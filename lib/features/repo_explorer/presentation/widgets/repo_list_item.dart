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
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => DetailScreen(repo: repo)),
          // );

          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  DetailScreen(repo: repo),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    const curve = Curves.easeInOutCubicEmphasized;

                    final slideAnimation = Tween<Offset>(
                      begin: const Offset(0, 0.2),
                      end: Offset.zero,
                    ).chain(CurveTween(curve: curve)).animate(animation);

                    final scaleAnimation = Tween<double>(
                      begin: 0.95,
                      end: 1.0,
                    ).chain(CurveTween(curve: curve)).animate(animation);

                    final fadeAnimation = Tween<double>(
                      begin: 0.0,
                      end: 1.0,
                    ).chain(CurveTween(curve: curve)).animate(animation);

                    return FadeTransition(
                      opacity: fadeAnimation,
                      child: SlideTransition(
                        position: slideAnimation,
                        child: ScaleTransition(
                          scale: scaleAnimation,
                          child: child,
                        ),
                      ),
                    );
                  },
              transitionDuration: const Duration(milliseconds: 600),
            ),
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
