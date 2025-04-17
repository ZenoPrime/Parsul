import request from 'supertest';
import app from '../server.js';
import axios from 'axios';

jest.mock('axios');

describe('POST /api/recommendations', () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });

  it('should return AI recommendations with valid request', async () => {
    // Mock successful API response
    axios.post.mockResolvedValue({
      data: {
        choices: [{
          message: {
            content: JSON.stringify([{
              name: "Test Phone",
              price: 180000,
              repair_score: 8
            }])
          }
        }]
      }
    });

    const res = await request(app)
      .post('/api/recommendations')
      .send({
        budget: {
          total: 200000,
          shipping: 50000
        },
        preferences: ["mobile phones"]
      });

    expect(res.statusCode).toEqual(200);
    expect(res.body).toHaveProperty('recommendations');
    expect(res.body.recommendations.length).toBeGreaterThan(0);
  }, 15000);

  it('should handle invalid JSON response from AI', async () => {
    // Mock API response with invalid JSON
    axios.post.mockResolvedValue({
      data: {
        choices: [{
          message: {
            content: "invalid JSON {"
          }
        }]
      }
    });

    const res = await request(app)
      .post('/api/recommendations')
      .send({
        budget: {
          total: 200000,
          shipping: 50000
        },
        preferences: ["mobile phones"]
      });

    expect(res.statusCode).toEqual(500);
    expect(res.body).toHaveProperty('error');
  }, 15000);
});