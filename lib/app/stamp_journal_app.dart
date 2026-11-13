import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import '../shared/navigation/main_navigation_screen.dart';

class StampJournalApp extends StatelessWidget {
  const StampJournalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stamp Journal',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MainNavigationScreen(),
    );
  }
}
