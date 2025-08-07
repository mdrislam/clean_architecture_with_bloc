import 'package:equatable/equatable.dart';
import 'package:tikweb_task/core/constants/app_constants.dart';
import 'package:tikweb_task/features/repo_explorer/domain/entities/repo_entities.dart';

enum RepoStatus { initial, loading, success, failure, loadingMore, refreshing }

class RepoState extends Equatable {
  final RepoStatus status;
  final List<RepoEntity> repos;
  final bool hasReachedEnd;
  final bool isCachedData;
  final String query;
  final int page;
  final String? errorMessage;

  const RepoState({
    this.status = RepoStatus.initial,
    this.repos = const [],
    this.hasReachedEnd = false,
    this.isCachedData = false,
    this.query = AppConstants.initialQuery,
    this.page = 1,
    this.errorMessage,
  });

  RepoState copyWith({
    RepoStatus? status,
    List<RepoEntity>? repos,
    bool? hasReachedEnd,
    bool? isCachedData,
    String? query,
    int? page,
    String? errorMessage,
  }) {
    return RepoState(
      status: status ?? this.status,
      repos: repos ?? this.repos,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      isCachedData: isCachedData ?? this.isCachedData,
      query: query ?? this.query,
      page: page ?? this.page,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    repos,
    hasReachedEnd,
    isCachedData,
    query,
    page,
    errorMessage,
  ];
}
