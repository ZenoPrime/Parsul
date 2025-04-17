
import 'dotenv/config';
import express from 'express';
import cors from 'cors';

// Add path configuration for .env
import {config} from 'dotenv';
config({ path: 'C:\\Users\\Mohamed Jawad\\Desktop\\Parsul\\.env' });
const app = express();

const envr = process.env.PERPLEXITY_API_KEY;

console.log(envr)

// Enhanced middleware with raw body verification
app.use(cors());
app.use(express.json({
  verify: (req, res, buf) => {
    try {
      JSON.parse(buf.toString());
    } catch (e) {
      throw new Error('Invalid JSON payload');
    }
  }
}));

// Health check endpoint
app.get('/api/health', (req, res) => {
  res.json({ status: 'API operational' });
});

// Add right after health check endpoint
app.get('/api/env-check', (req, res) => {
  res.json({
    apiKeyPresent: !!process.env.PERPLEXITY_API_KEY,
    apiKeyValue: process.env.PERPLEXITY_API_KEY ? 
      `${process.env.PERPLEXITY_API_KEY.slice(0, 8)}...` : 
      'Missing'
  }); 
});

// Uncomment and fix the recommendations route
import recommendationsRouter from './routes/recommendations.js';
app.use('/api/recommendations', recommendationsRouter);

// Error handling middleware (add at the end)
// Error handling middleware update
app.use((err, req, res, next) => {
  console.error(`[${new Date().toISOString()}] Error: ${err.message}`);
  if (err.message.includes('JSON')) {
    return res.status(400).json({
      error: 'Invalid JSON format',
      details: 'Ensure proper quoting and comma placement in request body'
    });
  }
  res.status(500).json({
    error: 'Internal server error',
    details: process.env.NODE_ENV === 'development' ? err.message : undefined
  });
});

// Add temporary logging middleware
if (process.env.NODE_ENV !== 'test') {
  app.use((req, res, next) => {
    console.log('Received body:', req.body);
    next();
  });
}

// Start server
// Start server only when not in test environment
if (process.env.NODE_ENV !== 'test') {
  const PORT = process.env.PORT || 4000;
  app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
  });
}

// Add right after imports
console.log('[ENV] Perplexity Key:', process.env.PERPLEXITY_API_KEY?.slice(0, 8) + '...');
console.log('[ENV] Node Environment:', process.env.NODE_ENV);

// Add at the very bottom
export default app;