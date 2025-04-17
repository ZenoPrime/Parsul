### Recommendations Endpoint
**POST /api/recommendations**
- Parameters:
  ```json
  {
    "budget": {
      "total": "number - Total budget in SLL",
      "shipping": "number - Max shipping budget in SLL"
    },
    "preferences": "string[] - Product categories/interests"
  }
  ```
POST    /api/products/scrape    - Scrape product details from URLs
POST    /api/orders             - Create new order
GET     /api/orders/:id         - Retrieve order status
POST    /api/payments/initiate  - Start payment process