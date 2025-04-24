import axios from 'axios';
import { scrapeProductDetail } from '../utils/playwrightScraper.js';

export class ProductScrapingService {
  static async scrapeProduct({ name, max_price }) {
    // Build the price filter part of the prompt only if max_price is provided
    const priceFilter = max_price
      ? `- Show the lowest price found, even if above ${max_price} SLL.`
      : `- Show the lowest price found, regardless of amount.`;

    // Updated prompt: not limited to "offers", US-only, and "if available" for fields
    const prompt = `
      Return a JSON array called "results" containing product listings or relevant results for "${name}" from websites and stores in the United States only.
      For each result, include as many of the following fields as possible (if available):
        - name (string)
        - price_sll (number, if available)
        - original_price (number, if available)
        - original_currency (string, if available)
        - seller (string, if available)
        - condition (string, e.g. "new", "used", "refurbished", or "unknown" if not listed)
        - link (string, if available)
      Also, include a field "lowest_price" with the lowest price found (in SLL) and its source, if available.
      List all links checked in a "citations" array.

      Example format:
      {
        "results": [
          {
            "name": "iPhone 14 Pro Max",
            "price_sll": 350000,
            "original_price": 1440,
            "original_currency": "USD",
            "seller": "Best Buy",
            "condition": "new",
            "link": "https://bestbuy.com/..."
          }
        ],
        "lowest_price": {
          "price_sll": 350000,
          "seller": "Best Buy",
          "link": "https://bestbuy.com/..."
        },
        "citations": [ ... ]
      }

      Find current product listings for "${name}" from United States websites and stores only.
      ${priceFilter}
      - For each result, include as many fields as possible. If a field is not available, set its value to null or "unknown".
      - If the price is not in SLL, convert it using these rates: 1 USD = 24.3 SLL.
      - If no results are found for "${name}", try to find similar or related products (e.g., previous models or close variants).
      - **If possible, always include at least one option from eBay US (https://www.ebay.com) in the results. If no eBay US listing is available, state this explicitly in the not_found_reason.**
      - If still no results are found, return an empty results array and explain in the not_found_reason why no results were found, suggesting the user try a different or more general product name.
    `;

    try {
      const response = await axios.post(
        'https://api.perplexity.ai/chat/completions',
        {
          model: 'sonar-pro', // <-- Try a more powerful Perplexity model here
          messages: [{
            role: 'user',
            content: prompt
          }]
        },
        {
          headers: {
            'Authorization': `Bearer ${process.env.PERPLEXITY_API_KEY}`,
            'Content-Type': 'application/json'
          },
          timeout: 50000
        }
      );

      // --- Begin cleaning and formatting the response ---
      let cleanedContent;
      try {
        const content = response.data.choices[0]?.message?.content;
        cleanedContent = content
          .replace(/```json/g, '')
          .replace(/```/g, '')
          .replace(/[‘’]/g, '"')
          .trim();

        const jsonMatch = cleanedContent.match(/\{[\s\S]*\}/);
        if (!jsonMatch) throw new Error('No JSON object found in response');

        const jsonString = jsonMatch[0];
        const offersData = JSON.parse(jsonString);

        const resultsArr = Array.isArray(offersData.results) ? offersData.results : [];
        // Filter for results with a known condition, a valid original_price, and "unlocked" in relevant fields, limit to 5
        const filteredResults = resultsArr
          .filter(item =>
            item.condition && item.condition !== "unknown" &&
            item.original_price !== null && item.original_price !== undefined &&
            // Exclude Swappa and CNET links
            !(item.link && (
              item.link.toLowerCase().includes("swappa.com") ||
              item.link.toLowerCase().includes("cnet.com")
            )) &&
            (
              // Always include Amazon or Walmart links
              (item.link && (
                item.link.toLowerCase().includes("amazon.com") ||
                item.link.toLowerCase().includes("walmart")
              )) ||
              // Otherwise, require "unlocked" in name, condition, or seller
              (item.name && item.name.toLowerCase().includes("unlocked")) ||
              (item.condition && item.condition.toLowerCase().includes("unlocked")) ||
              (item.seller && item.seller.toLowerCase().includes("unlocked"))
            )
          )
          .slice(0, 5)
          .map(item => {
            const subconditionMatch = (
              (item.name || '') + ' ' + (item.condition || '')
            ).match(/\b(fair|excellent|good|like new|very good|poor|mint|pristine|acceptable)\b/i);

            return {
              ...item,
              delivery:
                item.link && (
                  item.link.includes("amazon.com") ||
                  item.link.includes("walmart")
                )
                  ? "2 weeks"
                  : "3 weeks",
              subcondition: subconditionMatch ? subconditionMatch[0] : null
            };
          });

        // Ensure at least one "new" or "brand new" item is included
        if (!filteredResults.some(item => item.condition && item.condition.toLowerCase().includes('new'))) {
          const newItem = resultsArr.find(item =>
            item.condition && item.condition.toLowerCase().includes('new') &&
            !(item.link && (
              item.link.toLowerCase().includes("swappa.com") ||
              item.link.toLowerCase().includes("cnet.com")
            ))
          );
          if (newItem) {
            filteredResults.unshift({
              ...newItem,
              delivery:
                newItem.link && (
                  newItem.link.includes("amazon.com") ||
                  newItem.link.includes("walmart")
                )
                  ? "2 weeks"
                  : "3 weeks",
              subcondition: null
            });
            // Keep only up to 5 results
            filteredResults.splice(5);
          }
        }

        for (const item of filteredResults) {
          if (item.link && (item.link.includes('bestbuy.com') || item.link.includes('amazon.com'))) {
            const details = await scrapeProductDetail(item.link);
            item.scraped_details = details;
          }
        }
        // --- End of added block ---

        const noResults = filteredResults.length === 0;
        const noCitations = !Array.isArray(offersData.citations) || offersData.citations.length === 0;

        return {
          results: filteredResults,
          lowest_price: offersData.lowest_price || {
            price_sll: null,
            seller: null,
            link: null
          },
          citations: noCitations ? [] : offersData.citations,
          not_found_reason: (noResults || noCitations)
            ? `No valid results with known condition or links found for "${name}". This may be because the product is not available online in the United States, is rare, or the query is too specific. Try searching for a more general or related product name.`
            : undefined
        };
      } catch (e) {
        console.error('Scraper JSON Extraction Error:', e.message);
        console.error('Full Content:', cleanedContent);
        return {
          results: [],
          lowest_price: {
            price_sll: null,
            seller: null,
            link: null
          },
          citations: [],
          not_found_reason: 'No valid results or links found due to parsing error or empty result.'
        };
      }
      // --- End cleaning and formatting the response ---

    } catch (error) {
      console.error('[Scraping API] Error details:', {
        code: error.code,
        message: error.message,
        response: error.response?.data
      });
      throw error;
    }
  }
}