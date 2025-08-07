import 'package:flutter/material.dart';
import 'package:tikweb_task/core/theme/app_theme.dart';
import 'package:tikweb_task/features/repoexplorer/presentation/pages/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikWeb Task',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode
          .system, // Automatically switch between light and dark themes
    );
  }
}
