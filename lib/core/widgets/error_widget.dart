import 'package:flutter/material.dart';
import 'package:tikweb_task/core/values/app_sizes.dart';

class AppErrorWidget extends StatelessWidget {
  final String? message;
  final VoidCallback onRetry;
  const AppErrorWidget({super.key, this.message, required this.onRetry});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message ?? 'An error occurred',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppSizes.verticalSpacing),
          ElevatedButton(onPressed: onRetry, child: const Text('Retry')),
        ],
      ),
    );
  }
}
