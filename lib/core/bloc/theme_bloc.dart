import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class ThemeBloc extends Cubit<ThemeMode> {
  final Box settingsBox;

  ThemeBloc(this.settingsBox) : super(ThemeMode.system) {
    _loadTheme();
  }

  void _loadTheme() {
    final savedTheme = settingsBox.get('theme', defaultValue: 'system');
    switch (savedTheme) {
      case 'light':
        emit(ThemeMode.light);
        break;
      case 'dark':
        emit(ThemeMode.dark);
        break;
      default:
        emit(ThemeMode.system);
    }
  }

  Future<void> toggleTheme(ThemeMode newTheme) async {
    emit(newTheme);
    await settingsBox.put('theme', newTheme.name);
  }
}
