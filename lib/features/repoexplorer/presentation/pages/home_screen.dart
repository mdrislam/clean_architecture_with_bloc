import 'package:flutter/material.dart';
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
          Text(
            'Dark Mode',
            style: TextStyle(color: Theme.of(context).iconTheme.color),
          ),
          Switch(
            value: Theme.of(context).brightness == Brightness.dark
                ? true
                : false,
            onChanged: (value) {
              setState(() {
                // Toggle theme mode
                if (value) {
                  ThemeMode.system == ThemeMode.dark;
                } else {
                  ThemeMode.system == ThemeMode.light;
                }
              });
            },
            activeColor: Colors.white,
            activeTrackColor: const Color.fromARGB(255, 115, 255, 120),
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.grey[400],
            trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            // Search bar below AppBar
            HomeSearchbar(controller: _searchController),
            const SizedBox(height: 8),
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
