import 'package:flutter/material.dart';
import 'theme.dart';
import 'router.dart';

class FoundNearbyApp extends StatelessWidget {
  const FoundNearbyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'foundNearby',
      theme: AppTheme.getTheme(),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRouter.landing,
      debugShowCheckedModeBanner: false,
    );
  }
}
