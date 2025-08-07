import 'package:tikweb_task/features/repo_explorer/domain/entities/repo_entities.dart';

class RepoResult {
  final List<RepoEntity> repos;
  final bool isOffline;

  RepoResult({required this.repos, required this.isOffline});
}
