import axios from 'axios';

// Initialize logging at module level
console.log('[Init] RecommendationService loaded');

export class RecommendationService {
  // Update the generateRecommendations method
  static async generateRecommendations(params) {
    console.log('[Service] Starting recommendation generation with params:', params);
    try {
      this.validateParams(params);
      const prompt = this.buildPrompt(params);
      console.log('[Service] Generated prompt:', prompt);
      
      const apiResponse = await this.queryPerplexity(prompt);
      console.log('[Service] Received API response');
      
      return this.formatResponse(apiResponse);
    } catch (error) {
      console.error('[Service] Recommendation error:', error);
      throw error;
    }
  }

  // Update the queryPerplexity method
  static async queryPerplexity(prompt) {
    console.log('[API] Sending request to Perplexity');
    try {
      const response = await axios.post(
        'https://api.perplexity.ai/chat/completions',
        {
          model: 'sonar-pro', // Verified working model
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
      console.log('[API] Received response status:', response.status);
      return response.data;
    } catch (error) {
      console.error('[API] Error details:', {
        code: error.code,
        message: error.message,
        response: error.response?.data
      });
      throw error;
    }
  }

  static validateParams({ budget, preferences }) {
    if (!budget?.total || !budget?.shipping || !preferences?.length) {
      throw new Error('Missing required parameters: budget and preferences');
    }
  }

  static buildPrompt({ budget, preferences }) {
    return `Suggest 3-5 products for Sierra Leone considering:
            - Total budget: ${budget.total} SLL
            - Max shipping: ${budget.shipping} SLL
            - Preferences: ${preferences.join(', ')}
            - Prioritize high repairability and local service availability
            
            Required JSON format:
            [{
              "name": "Product name",
              "price": 180000,  // Numeric value ONLY (no currency symbols)
              "repair_score": 8
            }]`;
  }

  static formatResponse(apiResponse) {
    let cleanedContent;
    
    try {
      const content = apiResponse.choices[0]?.message?.content;
      // Clean and isolate JSON
      cleanedContent = content
        .replace(/```json/g, '')
        .replace(/```/g, '')
        .replace(/SLL/g, '')
        .replace(/(\d+),(\d+)/g, '$1$2')
        .replace(/[‘’]/g, '"')  // Replace curly quotes
        .trim();
  
      // Use regex to find first complete JSON array
      const jsonMatch = cleanedContent.match(/\[[\s\S]*?\]/);
      if (!jsonMatch) throw new Error('No JSON array found in response');
      
      const jsonString = jsonMatch[0];
      if (!this.isValidJson(jsonString)) throw new Error('Invalid JSON structure');
  
      const products = JSON.parse(jsonString);
      
      return {
        recommendations: products.map((product) => ({
          ...product,
          price: Number(product.price) || 0,
          repairability: product.repair_score >= 7 ? 'high' : 'medium'
        }))
      };
    } catch (e) {
      console.error('JSON Extraction Error:', e.message);
      console.error('Full Content:', cleanedContent);
      throw new Error('Failed to process AI recommendations'); // Changed from returning object
    }
  }

  static isValidJson(str) {
    try {
      JSON.parse(str);
      return true;
    } catch {
      return false;
    }
  }
  // Remove the duplicate queryPerplexity method below
}