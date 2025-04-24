import express from 'express';
import { ProductScrapingService } from '../services/productScrapingService.js';

const router = express.Router();

router.post('/scrape', async (req, res) => {
  try {
    const { name, max_price } = req.body;
    // Only require 'name'
    if (!name) {
      return res.status(400).json({ error: 'Missing required field: name' });
    }
    const result = await ProductScrapingService.scrapeProduct({ name, max_price });
    res.json(result);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

export default router;