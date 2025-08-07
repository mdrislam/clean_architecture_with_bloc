import 'package:flutter/material.dart';
import 'package:tikweb_task/core/values/app_sizes.dart';
import 'package:tikweb_task/features/repo_explorer/domain/entities/repo_entities.dart';
import 'package:tikweb_task/features/repo_explorer/presentation/pages/details_screen.dart';

class RepoListItem extends StatelessWidget {
  final RepoEntity repo;
  const RepoListItem({super.key, required this.repo});

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
                      repo.name,
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
                      Text(repo.stars.toString()),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: AppSizes.verticalSpacing / 2),
              Text(
                '@${repo.ownerName}',
                style: Theme.of(context).textTheme.bodySmall,
              ),

              const SizedBox(height: AppSizes.verticalSpacing),

              /// Description
              if (repo.description != null && repo.description!.isNotEmpty)
                Text(
                  repo.description!,
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
