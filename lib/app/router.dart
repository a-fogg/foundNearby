import 'package:flutter/material.dart';
import '../screens/landing/landing_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/search/search_screen.dart';
import '../screens/listing/listing_detail_screen.dart';
import '../screens/sell/sell_screen.dart';
import '../screens/messages/messages_screen.dart';
import '../screens/messages/conversation_screen.dart';
import '../screens/profile/profile_screen.dart';

class AppRouter {
  static const String landing = '/';
  static const String home = '/home';
  static const String search = '/search';
  static const String listing = '/listing';
  static const String sell = '/sell';
  static const String messages = '/messages';
  static const String conversation = '/conversation';
  static const String profile = '/profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landing:
        return _buildRoute(const LandingScreen());
      case home:
        return _buildRoute(const HomeScreen());
      case search:
        return _buildRoute(const SearchScreen());
      case listing:
        final listingId = settings.arguments as String?;
        return _buildRoute(ListingDetailScreen(listingId: listingId ?? 'listing1'));
      case sell:
        return _buildRoute(const SellScreen());
      case messages:
        return _buildRoute(const MessagesScreen());
      case conversation:
        final args = settings.arguments as Map<String, dynamic>?;
        final listingId = args?['listingId'] as String? ?? 'listing1';
        final sellerId = args?['sellerId'] as String? ?? 'user1';
        return _buildRoute(
          ConversationScreen(
            listingId: listingId,
            sellerId: sellerId,
          ),
        );
      case profile:
        return _buildRoute(const ProfileScreen());
      default:
        return _buildRoute(const LandingScreen());
    }
  }

  static PageRouteBuilder<T> _buildRoute<T>(Widget child) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutCubic;
        final tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
