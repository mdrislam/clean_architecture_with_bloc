import 'package:tikweb_task/core/constants/app_constants.dart';

import 'package:tikweb_task/features/repo_explorer/domain/entities/repo_result.dart';
import 'package:tikweb_task/features/repo_explorer/domain/repositories/repo_repository.dart';

class FetchRepoRepositoryUsecase {
  final RepoRepository repository;

  FetchRepoRepositoryUsecase(this.repository);

  Future<RepoResult> call({
    required String query,
    required int page,
    int perPage = AppConstants.perPage,
  }) async {
    return await repository.getRepositories(
      query: query,
      page: page,
      perPage: perPage,
    );
  }
}
