import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Replace with your actual backend base URL
  static const String _baseUrl = "http://10.0.2.2:3000"; // Example for Android emulator

  // Example function to fetch best selling products
  // TODO: Update the return type and parsing logic based on your actual API response
  static Future<List<Map<String, dynamic>>> fetchBestSellingProducts() async {
    final url = Uri.parse('$_baseUrl/api/products/best-selling'); // Adjust endpoint path

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Assuming the API returns a JSON list like:
        // [ {"name": "Product A", "price": "SLE 100", "image_url": "..."}, ... ]
        List<dynamic> data = jsonDecode(response.body);
        // Convert the dynamic list to the expected type
        return List<Map<String, dynamic>>.from(data);
      } else {
        // Handle server errors (e.g., 404, 500)
        print('Failed to load products: ${response.statusCode}');
        // Consider throwing an exception or returning an empty list/error state
        return []; // Return empty list on error for now
      }
    } catch (e) {
      // Handle network errors or parsing errors
      print('Error fetching products: $e');
      // Consider throwing an exception or returning an empty list/error state
      return []; // Return empty list on error for now
    }
  }

  // --- Add other API call functions here ---

  // Function to fetch recommendations
  // Takes budget and preferences as input
  // TODO: Update the return type based on the actual structure if needed
  static Future<List<Map<String, dynamic>>> fetchRecommendations({
    required double totalBudget,
    required double shippingBudget,
    required List<String> preferences,
  }) async {
    final url = Uri.parse('$_baseUrl/api/recommendations'); // Endpoint path

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'budget': {
            'total': totalBudget,
            'shipping': shippingBudget,
          },
          'preferences': preferences,
        }),
      );

      if (response.statusCode == 200) {
        // Assuming the API returns a JSON object like:
        // { "recommendations": [ {"name": "...", "price": ..., "repair_score": ...}, ... ] }
        final Map<String, dynamic> data = jsonDecode(response.body);
        // Extract the list of recommendations
        final List<dynamic> recommendationsList = data['recommendations'] ?? [];
        // Convert the dynamic list to the expected type
        return List<Map<String, dynamic>>.from(recommendationsList);
      } else {
        // Handle server errors
        print('Failed to load recommendations: ${response.statusCode} ${response.body}');
        throw Exception('Failed to load recommendations'); // Throw exception on error
      }
    } catch (e) {
      // Handle network errors or parsing errors
      print('Error fetching recommendations: $e');
      throw Exception('Error fetching recommendations: $e'); // Throw exception on error
    }
  }

  // Example: static Future<Map<String, dynamic>> searchProducts(String query) async { ... }
  // Example: static Future<void> placeOrder(Map<String, dynamic> orderData) async { ... }
}