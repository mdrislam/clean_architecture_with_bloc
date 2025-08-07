import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tikweb_task/core/constants/app_constants.dart';
import 'package:tikweb_task/features/repo_explorer/data/models/repo_model.dart';
import 'package:tikweb_task/features/repo_explorer/domain/usecases/fetch_repo_repository_usecase.dart';
import 'package:tikweb_task/features/repo_explorer/presentation/bloc/repo_event.dart';
import 'package:tikweb_task/features/repo_explorer/presentation/bloc/repo_state.dart';

class RepoBloc extends Bloc<RepoEvent, RepoState> {
  final FetchRepoRepositoryUsecase usecase;
  final int perPage = AppConstants.perPage;

  RepoBloc(this.usecase) : super(const RepoState()) {
    on<FetchRepoEvent>(_onFetchRepositories);
    on<LoadMoreRepoEvent>(_onLoadMoreRepos);
    on<RefreshRepoEvent>(_onRefreshRepos);
  }

  Future<void> _onFetchRepositories(
    FetchRepoEvent event,
    Emitter<RepoState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: event.isInitial ? RepoStatus.loading : RepoStatus.refreshing,
          query: event.query,
          page: 1,
        ),
      );

      final repos = await usecase(
        query: event.query,
        page: 1,
        perPage: perPage,
      );

      emit(
        state.copyWith(
          status: RepoStatus.success,
          repos: repos,
          hasReachedEnd: repos.length < perPage,
          isCachedData: repos.isNotEmpty && repos.first is RepoModel,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: RepoStatus.failure, errorMessage: e.toString()),
      );
    }
  }

  Future<void> _onLoadMoreRepos(
    LoadMoreRepoEvent event,
    Emitter<RepoState> emit,
  ) async {
    if (state.hasReachedEnd || state.status == RepoStatus.loadingMore) return;

    try {
      emit(state.copyWith(status: RepoStatus.loadingMore));

      final nextPage = state.page + 1;
      final repos = await usecase(
        query: state.query,
        page: nextPage,
        perPage: perPage,
      );

      emit(
        state.copyWith(
          status: RepoStatus.success,
          repos: [...state.repos, ...repos],
          hasReachedEnd: repos.length < perPage,
          page: nextPage,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: RepoStatus.failure, errorMessage: e.toString()),
      );
    }
  }

  Future<void> _onRefreshRepos(
    RefreshRepoEvent event,
    Emitter<RepoState> emit,
  ) async {
    add(FetchRepoEvent(query: state.query, isInitial: false));
  }
}
