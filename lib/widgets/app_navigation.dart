import 'package:flutter/material.dart';
import '../app/theme.dart';

class AppNavigation extends StatelessWidget {
  final String currentRoute;
  final Function(String) onNavigate;

  const AppNavigation({
    Key? key,
    required this.currentRoute,
    required this.onNavigate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // On desktop, show top navigation
    if (MediaQuery.of(context).size.width > 600) {
      return _DesktopNavigation(
        currentRoute: currentRoute,
        onNavigate: onNavigate,
      );
    }

    // On mobile, show bottom navigation
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: AppTheme.black, width: 1)),
        color: AppTheme.white,
      ),
      child: BottomNavigationBar(
        currentIndex: _getNavIndex(currentRoute),
        onTap: (index) {
          final routes = ['/home', '/search', '/sell', '/messages', '/profile'];
          onNavigate(routes[index]);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            activeIcon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            activeIcon: Icon(Icons.add_circle),
            label: 'Sell',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline),
            activeIcon: Icon(Icons.mail),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  int _getNavIndex(String route) {
    switch (route) {
      case '/home':
        return 0;
      case '/search':
        return 1;
      case '/sell':
        return 2;
      case '/messages':
        return 3;
      case '/profile':
        return 4;
      default:
        return 0;
    }
  }
}

class _DesktopNavigation extends StatelessWidget {
  final String currentRoute;
  final Function(String) onNavigate;

  const _DesktopNavigation({
    required this.currentRoute,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppTheme.black, width: 1)),
        color: AppTheme.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo
            Text(
              'foundNearby',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            // Nav items
            Row(
              children: [
                _NavLink(
                  label: 'Browse',
                  route: '/home',
                  currentRoute: currentRoute,
                  onTap: () => onNavigate('/home'),
                ),
                SizedBox(width: 32),
                _NavLink(
                  label: 'Sell',
                  route: '/sell',
                  currentRoute: currentRoute,
                  onTap: () => onNavigate('/sell'),
                ),
                SizedBox(width: 32),
                _NavLink(
                  label: 'Messages',
                  route: '/messages',
                  currentRoute: currentRoute,
                  onTap: () => onNavigate('/messages'),
                ),
                SizedBox(width: 32),
                _NavLink(
                  label: 'Profile',
                  route: '/profile',
                  currentRoute: currentRoute,
                  onTap: () => onNavigate('/profile'),
                ),
              ],
            ),
            // Primary action
            ElevatedButton(
              onPressed: () => onNavigate('/sell'),
              child: const Text('Sell something'),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final String route;
  final String currentRoute;
  final VoidCallback onTap;

  const _NavLink({
    required this.label,
    required this.route,
    required this.currentRoute,
    required this.onTap,
  });

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isActive = widget.currentRoute == widget.route;
    
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: isActive ? FontWeight.w800 : FontWeight.w600,
                    color: AppTheme.black,
                  ),
            ),
            if (isActive || _isHovered)
              Container(
                margin: EdgeInsets.only(top: 4),
                height: 2,
                width: 30,
                color: AppTheme.black,
              ),
          ],
        ),
      ),
    );
  }
}
