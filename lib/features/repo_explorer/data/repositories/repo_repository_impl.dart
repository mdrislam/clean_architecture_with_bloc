import 'package:tikweb_task/core/constants/app_constants.dart';
import 'package:tikweb_task/core/errors/exceptions.dart';
import 'package:tikweb_task/core/network/network_info.dart';
import 'package:tikweb_task/features/repo_explorer/data/datasource/repo_local_data_source.dart';
import 'package:tikweb_task/features/repo_explorer/data/datasource/repo_remote_data_source.dart';
import 'package:tikweb_task/features/repo_explorer/domain/entities/repo_entities.dart';
import 'package:tikweb_task/features/repo_explorer/domain/entities/repo_result.dart';

import 'package:tikweb_task/features/repo_explorer/domain/repositories/repo_repository.dart';

class RepoRepositoryImpl implements RepoRepository {
  final RepoRemoteDataSource remoteDataSource;
  final RepoLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  RepoRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<RepoResult> getRepositories({
    required String query,
    required int page,
    int perPage = AppConstants.perPage,
  }) async {
    final isConnected = await networkInfo.isConnected;

    try {
      if (isConnected) {
        // Only call remote API when connected
        final remoteRepos = await remoteDataSource.searchRepositories(
          query: query,
          page: page,
          perPage: perPage,
        );
        // Cache only first page
        if (page == 1) {
          await localDataSource.cacheRepositories(remoteRepos, query);
        }

        return RepoResult(
          repos: remoteRepos.map((repo) => repo.toEntity()).toList(),
          isOffline: false,
        );
      } else {
        // Only load cached data for first page when offline
        if (page == 1) {
          final localRepos = await localDataSource.getCachedRepositories(query);
          return RepoResult(
            repos: localRepos.map((repo) => repo.toEntity()).toList(),
            isOffline: true,
          );
        }
        throw NetworkException(message: 'No internet connection');
      }
    } catch (e) {
      throw ServerException(message: 'Failed to get repositories');
    }
  }
}
