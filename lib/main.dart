import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tikweb_task/core/bloc/theme_bloc.dart';
import 'package:tikweb_task/core/theme/app_theme.dart';
import 'package:tikweb_task/features/repo_explorer/presentation/bloc/repo_bloc.dart';
import 'package:tikweb_task/features/repo_explorer/presentation/pages/home_screen.dart';
import 'package:tikweb_task/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init(); // Initialize dependency injection
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<ThemeBloc>()),
        BlocProvider(create: (_) => di.sl<RepoBloc>()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            title: 'TikWeb Task',
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            themeMode: themeMode,
          );
        },
      ),
    );
  }
}
