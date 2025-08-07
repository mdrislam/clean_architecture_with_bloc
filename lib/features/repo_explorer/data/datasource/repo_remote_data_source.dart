import 'package:tikweb_task/core/constants/app_constants.dart';
import 'package:tikweb_task/core/errors/exceptions.dart';
import 'package:tikweb_task/core/network/api_client.dart';
import 'package:tikweb_task/features/repo_explorer/data/models/repo_model.dart';

abstract class RepoRemoteDataSource {
  Future<List<RepoModel>> searchRepositories({
    required String query,
    required int page,
    int perPage = AppConstants.perPage,
  });
}

class RepoRemoteDataSourceImpl implements RepoRemoteDataSource {
  final ApiClient apiClient;

  RepoRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<List<RepoModel>> searchRepositories({
    required String query,
    required int page,
    int perPage = AppConstants.perPage,
  }) async {
    try {
      final response = await apiClient.get(
        '/search/repositories',
        queryParameters: {
          'q': '$query in:name',
          'sort': 'stars',
          'order': 'desc',
          'page': page,
          'per_page': perPage,
        },
      );

      final items = response.data['items'] as List;
      return items.map((item) => RepoModel.fromJson(item)).toList();
    } catch (e) {
      print('Error fetching repositories: $e');
      throw ServerException(message: 'Failed to fetch repositories');
    }
  }
}
