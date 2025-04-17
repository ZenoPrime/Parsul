// Remove ALL dotenv references from this file
module.exports = {
  PORT: process.env.PORT || 4000,
  get PERPLEXITY_API_KEY() {
    const key = process.env.PERPLEXITY_API_KEY;
    if (!key) throw new Error('PERPLEXITY_API_KEY missing from .env');
    return key;
  },
  ENVIRONMENT: process.env.NODE_ENV || 'development',
  API_TIMEOUT: parseInt(process.env.API_TIMEOUT) || 10000, // Increased timeout
  CORS_ORIGINS: process.env.CORS_ORIGINS ? 
    process.env.CORS_ORIGINS.split(',') : 
    ['http://localhost:3000']
};