import 'package:flutter/material.dart';
import 'services/api_service.dart';
import 'screens/recommendation_results_screen.dart'; // Import the results screen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // To track the selected tab in the bottom bar

  // Placeholder data for products
  final List<Map<String, dynamic>> bestSellingProducts = [
    {'name': 'Apple iPhone 16 Pro...', 'price': 'SLE 23999', 'image': 'assets/placeholder_iphone.png'}, // Replace with actual asset paths later
    {'name': 'Bose QuietComfort U...', 'price': 'SLE 9399', 'image': 'assets/placeholder_headphones.png'},
    {'name': 'La Roche-Posay Effa...', 'price': 'SLE 549', 'image': 'assets/placeholder_serum.png'},
    {'name': 'Google Pixel 8 Pro', 'price': 'SLE 239', 'image': 'assets/placeholder_pixel.png'},
    // Add more products if needed
  ];

  bool _isFetchingRecommendations = false; // Add state for recommendation loading

  @override
  void initState() {
    super.initState();
    _loadBestSellingProducts();
  }

  Future<void> _loadBestSellingProducts() async {
    // Placeholder data for products
    final List<Map<String, dynamic>> bestSellingProducts = [
      {'name': 'Apple iPhone 16 Pro...', 'price': 'SLE 23999', 'image': 'assets/placeholder_iphone.png'}, // Replace with actual asset paths later
      {'name': 'Bose QuietComfort U...', 'price': 'SLE 9399', 'image': 'assets/placeholder_headphones.png'},
      {'name': 'La Roche-Posay Effa...', 'price': 'SLE 549', 'image': 'assets/placeholder_serum.png'},
      {'name': 'Google Pixel 8 Pro', 'price': 'SLE 239', 'image': 'assets/placeholder_pixel.png'},
      // Add more products if needed
    ];
  }

  // --- Function to fetch recommendations and navigate ---
  Future<void> _getRecommendations() async {
    setState(() {
      _isFetchingRecommendations = true; // Show loading indicator on button
    });

    // --- Hardcoded values for testing ---
    // TODO: Replace with actual user input later
    const double totalBudget = 500000; // Example budget
    const double shippingBudget = 50000; // Example shipping budget
    const List<String> preferences = ['smartphone', 'good battery']; // Example preferences
    // --- End Hardcoded values ---

    try {
      final recommendations = await ApiService.fetchRecommendations(
        totalBudget: totalBudget,
        shippingBudget: shippingBudget,
        preferences: preferences,
      );

      // Navigate to the results screen
      if (mounted) { // Check if the widget is still in the tree
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecommendationResultsScreen(
              recommendations: recommendations,
            ),
          ),
        );
      }
    } catch (e) {
      // Show error message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error getting recommendations: ${e.toString()}')),
        );
      }
    } finally {
      // Hide loading indicator
      if (mounted) {
        setState(() {
          _isFetchingRecommendations = false;
        });
      }
    }
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Add navigation logic here later
      print("Tapped index: $index");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // --- Header Section ---
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Good Morning', style: TextStyle(fontSize: 14, color: Colors.grey)),
                        Text('Paul', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    // Skeumorphic Cart Button
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8E0FF), // Light purple background
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(Icons.shopping_bag_outlined, color: Color(0xFF6A1B9A)), // Purple icon
                    ),
                  ],
                ),
              ),
            ),

            // --- Search Bar ---
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              sliver: SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white, // White background
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                      icon: Icon(Icons.search, color: Colors.grey), // Search icon on the left
                      suffixIcon: Icon(Icons.camera_alt_outlined, color: Colors.grey), // Camera icon on the right
                    ),
                  ),
                ),
              ),
            ),

            // --- Add Recommendations Button ---
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              sliver: SliverToBoxAdapter(
                child: ElevatedButton.icon(
                  icon: _isFetchingRecommendations
                      ? SizedBox( // Show progress indicator when loading
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                        )
                      : Icon(Icons.lightbulb_outline),
                  label: Text(_isFetchingRecommendations ? 'Getting Suggestions...' : 'Get Product Recommendations'),
                  onPressed: _isFetchingRecommendations ? null : _getRecommendations, // Disable button while loading
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    // Add styling as needed
                  ),
                ),
              ),
            ),
            // --- End Recommendations Button ---


            // --- Best Selling Header ---
            SliverPadding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0, bottom: 10.0),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Best Selling', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              ),
            ),

            // --- Product Grid ---
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two columns
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0,
                  childAspectRatio: 0.7, // Adjust aspect ratio as needed
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    final product = bestSellingProducts[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white, // Placeholder background for image
                              borderRadius: BorderRadius.circular(12),
                            ),
                            // child: Image.asset(product['image'], fit: BoxFit.cover), // Uncomment when you have assets
                            child: Center(child: Icon(Icons.image, size: 50, color: Colors.grey[300])), // Placeholder Icon
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(product['name'], style: const TextStyle(fontWeight: FontWeight.w500), overflow: TextOverflow.ellipsis),
                        Text(product['price'], style: const TextStyle(color: Colors.grey)),
                      ],
                    );
                  },
                  childCount: bestSellingProducts.length,
                ),
              ),
            ),
             SliverPadding(padding: EdgeInsets.only(bottom: 80)), // Add padding to avoid overlap with bottom bar
          ],
        ),
      ),

      // --- Bottom Navigation Bar (Skeumorphic) ---
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(15), // Margin around the bar
        height: 65,
        decoration: BoxDecoration(
          color: Colors.black87, // Dark background
          borderRadius: BorderRadius.circular(30), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect( // Clip the content to the rounded corners
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Container( // Active state with background
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white, // White background for active tab
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.home, color: Colors.black), // Black icon
                      SizedBox(width: 5),
                      Text('Home', style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
                label: '', // Hide default label
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.explore_outlined), // Placeholder
                label: '',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.local_shipping_outlined), // Placeholder
                label: '',
              ),
               const BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), // Placeholder
                label: '',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white, // Color for active icon when not using custom background
            unselectedItemColor: Colors.grey[400], // Color for inactive icons
            onTap: _onItemTapped,
            backgroundColor: Colors.transparent, // Make default background transparent
            type: BottomNavigationBarType.fixed, // Ensure all items are shown
            elevation: 0, // Remove default elevation
            showSelectedLabels: false, // Hide labels
            showUnselectedLabels: false,
          ),
        ),
      ),
    );
  }
}