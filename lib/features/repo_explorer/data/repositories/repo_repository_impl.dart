import 'package:tikweb_task/core/constants/app_constants.dart';
import 'package:tikweb_task/core/errors/exceptions.dart';
import 'package:tikweb_task/core/network/network_info.dart';
import 'package:tikweb_task/features/repo_explorer/data/datasource/repo_local_data_source.dart';
import 'package:tikweb_task/features/repo_explorer/data/datasource/repo_remote_data_source.dart';
import 'package:tikweb_task/features/repo_explorer/domain/entities/repo_entities.dart';

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
  Future<List<RepoEntity>> getRepositories({
    required String query,
    required int page,
    int perPage = AppConstants.perPage,
  }) async {
    final isConnected = await networkInfo.isConnected;
    final remoteRepos = await remoteDataSource.searchRepositories(
      query: query,
      page: page,
      perPage: perPage,
    );
    try {
      if (isConnected) {
        // Cache only first page
        if (page == 1) {
          await localDataSource.cacheRepositories(remoteRepos, query);
        }

        return remoteRepos.map((repo) => repo.toEntity()).toList();
      } else {
        // Only load cached data for first page when offline
        if (page == 1) {
          final localRepos = await localDataSource.getCachedRepositories(query);
          return localRepos.map((repo) => repo.toEntity()).toList();
        }
        throw NetworkException(message: 'No internet connection');
      }
    } catch (e) {
      throw ServerException(message: 'Failed to get repositories');
    }
  }
}
