import 'package:flutter/material.dart';
import '../../widgets/app_navigation.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({Key? key}) : super(key: key);

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sell')),
      body: Center(
        child: Text('Sell Coming Soon'),
      ),
      bottomNavigationBar: AppNavigation(
        currentRoute: '/sell',
        onNavigate: (route) {
          Navigator.pushReplacementNamed(context, route);
        },
      ),
    );
  }
}
