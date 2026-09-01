import 'package:flutter/material.dart';
import '../../app/theme.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16.0 : 40.0,
              vertical: isMobile ? 32.0 : 60.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo/wordmark
                Text(
                  'foundNearby',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SizedBox(height: isMobile ? 40 : 64),

                // Hero section
                Text(
                  'Find useful things nearby.',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(height: 24),

                // Value props
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _PropertyText('Buy it.'),
                    _PropertyText('Give it away.'),
                    _PropertyText('Find it.'),
                  ],
                ),
                SizedBox(height: isMobile ? 40 : 64),

                // CTA Buttons
                SizedBox(
                  width: isMobile ? double.infinity : 300,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: const Text('Browse nearby'),
                  ),
                ),
                SizedBox(height: 12),
                SizedBox(
                  width: isMobile ? double.infinity : 300,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/sell');
                    },
                    child: const Text('List something'),
                  ),
                ),
                SizedBox(height: isMobile ? 40 : 64),

                // Location prompt
                Container(
                  padding: EdgeInsets.all(AppTheme.lg),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppTheme.black, width: 2),
                    borderRadius: BorderRadius.circular(AppTheme.radiusLg),
                    color: AppTheme.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '📍 Stourbridge',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Showing things within 10 miles',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppTheme.grey400,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PropertyText extends StatelessWidget {
  final String text;

  const _PropertyText(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
