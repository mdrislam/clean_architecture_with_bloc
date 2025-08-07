import 'package:flutter/material.dart';
import 'package:tikweb_task/core/values/app_sizes.dart';
import 'package:tikweb_task/features/repoexplorer/presentation/pages/details_screen.dart';

class RepoListItem extends StatelessWidget {
  const RepoListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppSizes.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.horizontalPadding),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailScreen()),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Repo Name',
                      maxLines: AppSizes.textMinLine,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, size: AppSizes.iconSizeSM),
                      const SizedBox(width: AppSizes.horizontalPadding / 4),
                      Text('77'),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: AppSizes.verticalSpacing / 2),
              Text(
                '@risadhossain',
                style: Theme.of(context).textTheme.bodySmall,
              ),

              const SizedBox(height: AppSizes.verticalSpacing),
              Text(
                'This is a sample repository description that might be quite long and needs to be truncated if it exceeds the available space.',
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: AppSizes.textMaxLine,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
