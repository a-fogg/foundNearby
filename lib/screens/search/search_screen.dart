import 'package:flutter/material.dart';
import '../../widgets/app_navigation.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search')),
      body: Center(
        child: Text('Search Coming Soon'),
      ),
      bottomNavigationBar: AppNavigation(
        currentRoute: '/search',
        onNavigate: (route) {
          Navigator.pushReplacementNamed(context, route);
        },
      ),
    );
  }
}
