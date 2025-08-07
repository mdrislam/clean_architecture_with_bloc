import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tikweb_task/core/bloc/theme_bloc.dart';
import 'package:tikweb_task/core/theme/app_colors.dart';
import 'package:tikweb_task/core/values/app_sizes.dart';
import 'package:tikweb_task/features/repoexplorer/presentation/widgets/home_searchbar.dart';
import 'package:tikweb_task/features/repoexplorer/presentation/widgets/repo_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repositories'),
        titleSpacing: 10,
        actions: [
          BlocBuilder<ThemeBloc, ThemeMode>(
            builder: (context, themeMode) {
              final isDark = themeMode == ThemeMode.dark;
              return Row(
                children: [
                  Text(
                    isDark ? 'Dark Mode' : 'Light Mode',
                    style: TextStyle(color: Theme.of(context).iconTheme.color),
                  ),
                  Switch(
                    value: isDark,
                    onChanged: (value) {
                      final newTheme = value ? ThemeMode.dark : ThemeMode.light;
                      context.read<ThemeBloc>().toggleTheme(newTheme);
                    },
                    activeColor: AppColors.white,
                    activeTrackColor: AppColors.primary,
                    inactiveThumbColor: AppColors.white,
                    inactiveTrackColor: AppColors.grey400,
                    trackOutlineColor: WidgetStateProperty.all(
                      AppColors.transparent,
                    ),
                  ),
                  const SizedBox(width: AppSizes.horizontalPadding / 2),
                ],
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.horizontalPadding,
        ),
        child: Column(
          children: [
            // Search bar below AppBar
            HomeSearchbar(controller: _searchController),
            const SizedBox(height: AppSizes.verticalSpacing),
            Expanded(
              child: ListView.builder(
                itemCount: 20, // Example item count
                itemBuilder: (context, index) {
                  return RepoListItem();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
