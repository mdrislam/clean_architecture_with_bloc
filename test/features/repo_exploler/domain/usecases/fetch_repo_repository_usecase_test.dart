import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tikweb_task/features/repo_explorer/domain/entities/repo_entities.dart';
import 'package:tikweb_task/features/repo_explorer/domain/repositories/repo_repository.dart';
import 'package:tikweb_task/features/repo_explorer/domain/usecases/fetch_repo_repository_usecase.dart';

import 'fetch_repo_repository_usecase_test.mocks.dart';

@GenerateMocks([RepoRepository])
void main() {
  late MockRepoRepository mockRepository;
  late FetchRepoRepositoryUsecase usecase;

  setUp(() {
    mockRepository = MockRepoRepository();
    usecase = FetchRepoRepositoryUsecase(mockRepository);
  });

  const testQuery = 'flutter';
  const testPage = 1;
  const testPerPage = 20;

  final testRepos = [
    RepoEntity(
      id: 1,
      name: 'flutter_repo',
      fullName: 'flutter/flutter_repo',
      description: 'A Flutter repository',
      stars: 100,
      forks: 50,
      ownerName: 'flutter',
      ownerAvatarUrl: 'https://avatars.githubusercontent.com/u/1?v=4',
      htmlUrl: 'https://github.com/flutter/flutter_repo',
    ),
  ];

  test('should return list of RepoEntity when call is successful', () async {
    when(
      mockRepository.getRepositories(
        query: testQuery,
        page: testPage,
        perPage: testPerPage,
      ),
    ).thenAnswer((_) async => testRepos);

    final result = await usecase(
      query: testQuery,
      page: testPage,
      perPage: testPerPage,
    );

    expect(result, equals(testRepos));
    verify(
      mockRepository.getRepositories(
        query: testQuery,
        page: testPage,
        perPage: testPerPage,
      ),
    );
    verifyNoMoreInteractions(mockRepository);
  });
  test('should throw an exception when repository call fails', () async {
    when(
      mockRepository.getRepositories(
        query: testQuery,
        page: testPage,
        perPage: testPerPage,
      ),
    ).thenThrow(Exception('Failed to fetch repositories'));

    expect(
      () => usecase(query: testQuery, page: testPage, perPage: testPerPage),
      throwsA(isA<Exception>()),
    );

    verify(
      mockRepository.getRepositories(
        query: testQuery,
        page: testPage,
        perPage: testPerPage,
      ),
    );
    verifyNoMoreInteractions(mockRepository);
  });
  test(
    'should call repository with default perPage when not provided',
    () async {
      when(
        mockRepository.getRepositories(query: testQuery, page: testPage,perPage: anyNamed('perPage')),
      ).thenAnswer((_) async => testRepos);

      final result = await usecase(query: testQuery, page: testPage);

      expect(result, equals(testRepos));
      verify(
        mockRepository.getRepositories(
          query: testQuery,
          page: testPage,
          perPage: testPerPage, // Assuming default is 20
        ),
      );
      verifyNoMoreInteractions(mockRepository);
    },
  );
  test(
    'should call repository with provided perPage when specified',
    () async {
      const customPerPage = 30;
      when(
        mockRepository.getRepositories(
          query: testQuery,
          page: testPage,
          perPage: customPerPage,
        ),
      ).thenAnswer((_) async => testRepos);

      final result = await usecase(
        query: testQuery,
        page: testPage,
        perPage: customPerPage,
      );

      expect(result, equals(testRepos));
      verify(
        mockRepository.getRepositories(
          query: testQuery,
          page: testPage,
          perPage: customPerPage,
        ),
      );
      verifyNoMoreInteractions(mockRepository);
    },
  );
 
}
