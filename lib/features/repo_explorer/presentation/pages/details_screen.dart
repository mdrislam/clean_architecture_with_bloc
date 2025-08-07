import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tikweb_task/core/bloc/theme_bloc.dart';
import 'package:tikweb_task/core/theme/app_colors.dart';
import 'package:tikweb_task/core/values/app_sizes.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:cached_network_image/cached_network_image.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios),
        ),
        title: Text('Details', style: TextStyle(fontWeight: FontWeight.w500)),
        actions: [
          BlocBuilder<ThemeBloc, ThemeMode>(
            builder: (context, themeMode) {
              final isDark = themeMode == ThemeMode.dark;
              return Row(
                children: [
                  Text(
                    isDark ? 'Dark Mode' : 'Light Mode',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Switch(
                    value: isDark,
                    onChanged: (val) {
                      final newTheme = val ? ThemeMode.dark : ThemeMode.light;
                      context.read<ThemeBloc>().toggleTheme(newTheme);
                    },

                    activeColor: AppColors.white,
                    activeTrackColor: AppColors.primary,
                    inactiveThumbColor: AppColors.white,
                    inactiveTrackColor: AppColors.grey400,
                    trackOutlineColor: WidgetStateProperty.all(
                      Colors.transparent,
                    ),
                  ),

                  const SizedBox(width: AppSizes.horizontalPadding / 2),
                ],
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Repository Name',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, size: AppSizes.iconSizeSM),
                    const SizedBox(width: AppSizes.horizontalPadding / 4),
                    // Assuming this is the star count
                    Text('70'),
                  ],
                ),
                const SizedBox(width: AppSizes.horizontalPadding / 3),
                Row(
                  children: [
                    const Icon(
                      Icons.fork_left_sharp,
                      size: AppSizes.iconSizeSM,
                    ),

                    // Assuming this is the fork count
                    Text('10'),
                  ],
                ),
              ],
            ),
            const SizedBox(width: AppSizes.verticalSpacing),
            SizedBox(
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.horizontalPadding),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: AppSizes.profileRadiousXL,
                        backgroundImage: CachedNetworkImageProvider(
                          'https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png',
                        ),
                      ),
                      const SizedBox(height: AppSizes.verticalSpacing),
                      // Assuming repo.ownerName is the owner's name
                      Text(
                        'ownerName',
                        maxLines: AppSizes.textMinLine,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: AppSizes.verticalSpacing),
                      InkWell(
                        onTap: () => _launchUrl(
                          'https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png',
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: AppSizes.borderRadius,
                              backgroundImage: CachedNetworkImageProvider(
                                'https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png',
                              ),
                            ),

                            const SizedBox(
                              width: AppSizes.horizontalPadding / 2,
                            ),
                            Expanded(
                              child: Text(
                                'https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png',
                                maxLines: AppSizes.textMinLine,
                                style: Theme.of(context).textTheme.bodyMedium!
                                    .copyWith(
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSizes.verticalSpacing),

            Text('Description'),
            const SizedBox(height: AppSizes.verticalSpacing),
            // Assuming repo.description is the repository description
            Text(
              'This is a sample repository description that might be quite long and needs to be truncated if it exceeds the available space.',
              maxLines: AppSizes.textMinLine,
            ),
            const SizedBox(height: AppSizes.verticalSpacing),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
