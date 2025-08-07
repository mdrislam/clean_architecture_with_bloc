import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ItemsLoader extends StatelessWidget {
  const ItemsLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (_, __) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(width: 200, height: 16, color: Colors.white),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                height: 14,
                color: Colors.white,
              ),
              const SizedBox(height: 8),
              Container(width: 100, height: 14, color: Colors.white),
              const SizedBox(height: 16),
              Container(width: double.infinity, height: 1, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
