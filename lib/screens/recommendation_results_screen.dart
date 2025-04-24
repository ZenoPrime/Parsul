import 'package:flutter/material.dart';

class RecommendationResultsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> recommendations;

  const RecommendationResultsScreen({
    super.key,
    required this.recommendations,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Recommendations'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: recommendations.isEmpty
          ? const Center(
              child: Text(
                'No recommendations found based on your criteria.',
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: recommendations.length,
              itemBuilder: (context, index) {
                final product = recommendations[index];
                // TODO: Adjust keys ('name', 'price', 'repair_score', 'repairability') if your API response differs
                final name = product['name'] ?? 'N/A';
                final price = product['price']?.toString() ?? 'N/A'; // Format price as needed
                final repairScore = product['repair_score']?.toString() ?? 'N/A';
                final repairability = product['repairability'] ?? 'N/A'; // Added based on your context

                return Card(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  elevation: 2,
                  child: ListTile(
                    // leading: Icon(Icons.phone_android), // Optional: Add an icon
                    title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Price: SLL $price'), // Assuming price is in SLL
                        Text('Repair Score: $repairScore ($repairability)'),
                      ],
                    ),
                    // Optional: Add onTap to navigate to product details or scrape
                    // onTap: () { /* Handle tap */ },
                  ),
                );
              },
            ),
    );
  }
}