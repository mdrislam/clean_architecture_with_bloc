import 'package:flutter/material.dart';

class RepoListItem extends StatelessWidget {
  const RepoListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Top row: Repo name + Stars
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Repo Name',
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 16),
                      const SizedBox(width: 4),
                      Text('77'),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 4),

              /// Username (owner)
              Text(
                '@risadhossain', // assuming `repo.owner` is the username
                style: Theme.of(context).textTheme.bodySmall,
              ),

              const SizedBox(height: 8),

              /// Description
              Text(
                'This is a sample repository description that might be quite long and needs to be truncated if it exceeds the available space.',
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
