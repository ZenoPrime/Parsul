
// Replace explicit path with
import 'dotenv/config';  // This already handles .env loading

// Remove the manual config() call and add validation
if (!process.env.PERPLEXITY_API_KEY) {
  console.error('[FATAL] Missing PERPLEXITY_API_KEY in .env');
  process.exit(1);
}
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
// Enhanced middleware with raw body verification
app.use(express.json({
  verify: (req, res, buf) => {
    try {
      JSON.parse(buf.toString());
    } catch (e) {
      console.log('Invalid JSON received:', buf.toString());
      throw new Error('Invalid JSON payload - Check for trailing commas or missing quotes');
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

// Add with other imports
import productsRouter from './routes/products.js';

// Add with other routes
app.use('/api/recommendations', recommendationsRouter);
app.use('/api/products', productsRouter);

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