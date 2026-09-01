import 'package:flutter/material.dart';
import '../../widgets/app_navigation.dart';

class ListingDetailScreen extends StatelessWidget {
  final String listingId;

  const ListingDetailScreen({Key? key, required this.listingId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listing')),
      body: Center(
        child: Text('Listing Detail Coming Soon'),
      ),
      bottomNavigationBar: AppNavigation(
        currentRoute: '/listing',
        onNavigate: (route) {
          Navigator.pushReplacementNamed(context, route);
        },
      ),
    );
  }
}
