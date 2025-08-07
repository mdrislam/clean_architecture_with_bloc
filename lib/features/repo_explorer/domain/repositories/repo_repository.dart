import 'package:tikweb_task/features/repo_explorer/domain/entities/repo_result.dart';

abstract class RepoRepository {
  Future<RepoResult> getRepositories({
    required String query,
    required int page,
    int perPage,
  });
}
