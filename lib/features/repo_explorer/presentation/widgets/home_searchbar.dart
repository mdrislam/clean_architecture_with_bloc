import 'package:flutter/material.dart';

class HomeSearchbar extends StatelessWidget {
  const HomeSearchbar({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}
