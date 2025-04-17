import express from 'express';
import { RecommendationService } from '../services/recommendationService.js';

const router = express.Router();

router.post('/', async (req, res) => {
  try {
    // Replace temporary response with actual service call
    const recommendations = await RecommendationService.generateRecommendations(req.body);
    res.json(recommendations);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

export default router;