# Parsul - AI-Powered Concierge Service

![Project Banner](https://via.placeholder.com/1200x400?text=Parsul+Recommendation+Engine)

A intelligent recommendation system optimized for Sierra Leone market needs, focusing on repairability and local availability.

## Features
- 🧠 AI-powered recommendations via Perplexity API
- 🔧 Repair score calculations
- 🚚 Shipping type detection
- ✅ Local parts availability tracking
- 📊 Budget-aware suggestions

## Tech Stack
- Node.js + Express
- Axios for API calls
- Jest + Supertest for testing
- Environment configuration with dotenv

## Getting Started

### 1. Installation
```bash
npm install
```

### 2. Configuration
Create `.env` file:
```env
PERPLEXITY_API_KEY=your_api_key_here
PORT=4000
```

### 3. Running the Service
```bash
npm start
```

### 4. Testing
```bash
npm test
```

# API Documentation
Recommendations Endpoint :
```bash
POST /api/recommendations
{
  "budget": {
    "total": 200000,
    "shipping": 50000
  },
  "preferences": ["mobile phones"]
}
```

