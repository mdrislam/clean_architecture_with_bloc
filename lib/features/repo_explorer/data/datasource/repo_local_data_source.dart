import 'package:hive/hive.dart';
import 'package:tikweb_task/core/errors/exceptions.dart';
import 'package:tikweb_task/features/repo_explorer/data/models/repo_model.dart';

abstract class RepoLocalDataSource {
  Future<void> cacheRepositories(List<RepoModel> repos, String query);
  Future<List<RepoModel>> getCachedRepositories(String query);
}

class RepoLocalDataSourceImpl implements RepoLocalDataSource {
  @override
  Future<void> cacheRepositories(List<RepoModel> repos, String query) async {
    try {
      final box = await Hive.openBox<RepoModel>('repos_$query');
      await box.clear();
      await box.addAll(repos);
    } catch (e) {
      throw CacheException(message: 'Failed to cache repositories');
    }
  }

  @override
  Future<List<RepoModel>> getCachedRepositories(String query) async {
    try {
      final box = await Hive.openBox<RepoModel>('repos_$query');
      return box.values.toList();
    } catch (e) {
      throw CacheException(message: 'Failed to load cached repositories');
    }
  }
}
