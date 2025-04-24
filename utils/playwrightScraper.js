import { chromium } from 'playwright';

export async function scrapeProductDetail(url) {
  const browser = await chromium.launch({ headless: true });
  const page = await browser.newPage();

  try {
    await page.goto(url, { waitUntil: 'domcontentloaded', timeout: 45000 });

    // Handle Best Buy "Choose a country" prompt if present
    if (url.includes('bestbuy.com')) {
      // Wait for the country selection modal if it appears
      const countrySelector = await page.$('button[data-lid="hdr_gh_country_selector"]');
      if (countrySelector) {
        await countrySelector.click();
        // Wait for the US option and click it
        const usOption = await page.waitForSelector('a[href*="www.bestbuy.com/?intl=nosplash"]', { timeout: 5000 }).catch(() => null);
        if (usOption) {
          await usOption.click();
          await page.waitForLoadState('domcontentloaded');
        }
      }

      // If it's a search page, click the first product
      if (url.includes('/searchpage.jsp')) {
        const firstProduct = await page.$('li.sku-item .sku-header a');
        if (firstProduct) {
          const productUrl = await firstProduct.getAttribute('href');
          if (productUrl) {
            await page.goto('https://www.bestbuy.com' + productUrl, { waitUntil: 'domcontentloaded', timeout: 45000 });
          }
        }
      }
    }

    // Scrape product details
    const title = await page.$eval('h1', el => el.innerText.trim());
    const price = await page.$eval('.priceView-customer-price > span', el => el.innerText.trim());

    await browser.close();
    return { title, price };
  } catch (e) {
    await browser.close();
    return {
      title: null,
      price: null,
      error: 'Could not extract product details'
    };
  }
}