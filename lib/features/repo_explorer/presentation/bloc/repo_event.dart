import 'package:equatable/equatable.dart';

abstract class RepoEvent extends Equatable {
  const RepoEvent();

  @override
  List<Object?> get props => [];
}

class FetchRepoEvent extends RepoEvent {
  final bool isInitial;
  final String query;

  const FetchRepoEvent({required this.query, this.isInitial = true});
}

class LoadMoreRepoEvent extends RepoEvent {
  const LoadMoreRepoEvent();
}

class RefreshRepoEvent extends RepoEvent {
  const RefreshRepoEvent();
}
