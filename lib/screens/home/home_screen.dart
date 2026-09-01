import 'package:flutter/material.dart';
import '../../models/listing.dart';
import '../../mock/mock_listings.dart';
import '../../app/theme.dart';
import '../../widgets/listing_card.dart';
import '../../widgets/app_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final categories = [
    'All',
    'Furniture',
    'Garden',
    'DIY',
    'Electronics',
    'Kids',
    'Hobbies',
    'Other',
  ];

  String selectedCategory = 'All';
  bool isMapView = false;
  List<Listing> filteredListings = mockListings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('foundNearby'),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "What's nearby?",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                SizedBox(height: 16),
                // Search bar
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for something...',
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    setState(() {
                      if (value.isEmpty) {
                        filteredListings = getListingsByCategory(selectedCategory);
                      } else {
                        filteredListings = searchListings(value);
                      }
                    });
                  },
                ),
                SizedBox(height: 16),
                // Location info
                Row(
                  children: [
                    Text('📍 Stourbridge · 10 miles',
                        style: Theme.of(context).textTheme.bodyMedium),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isMapView = !isMapView;
                        });
                      },
                      child: Text(isMapView ? 'List' : 'Map'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Categories
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = category == selectedCategory;
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: FilterChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        selectedCategory = category;
                        filteredListings = getListingsByCategory(category);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          // Listings grid
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: filteredListings.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: ListingCard(
                    listing: filteredListings[index],
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/listing',
                        arguments: filteredListings[index].id,
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: AppNavigation(
        currentRoute: '/home',
        onNavigate: (route) {
          Navigator.pushReplacementNamed(context, route);
        },
      ),
    );
  }
}
