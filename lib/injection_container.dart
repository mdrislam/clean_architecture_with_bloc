import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tikweb_task/core/bloc/theme_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Initialize Hive
  await Hive.initFlutter();

  // Open and register the settings box as a singleton
  final settingsBox = await Hive.openBox('settings');
  sl.registerSingleton<Box>(
    settingsBox,
  ); // or use sl.registerSingleton<Box>('settings', settingsBox);

  // Register ThemeBloc/Cubit and inject the Hive box
  sl.registerFactory(
    () => ThemeBloc(sl()),
  ); // Make sure ThemeBloc accepts Box in constructo
}
