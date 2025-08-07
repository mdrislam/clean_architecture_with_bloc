
import 'package:tikweb_task/features/repo_explorer/domain/entities/repo_entities.dart';

abstract class RepoRepository {
  Future<List<RepoEntity>> getRepositories({
    required String query,
    required int page,
    int perPage,
  });
}
