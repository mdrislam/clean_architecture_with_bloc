import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tikweb_task/core/bloc/theme_bloc.dart';
import 'package:tikweb_task/core/constants/app_constants.dart';
import 'package:tikweb_task/core/theme/app_colors.dart';
import 'package:tikweb_task/core/values/app_sizes.dart';
import 'package:tikweb_task/core/widgets/error_widget.dart';
import 'package:tikweb_task/core/widgets/items_loader.dart';
import 'package:tikweb_task/features/repo_explorer/presentation/bloc/repo_bloc.dart';
import 'package:tikweb_task/features/repo_explorer/presentation/bloc/repo_event.dart';
import 'package:tikweb_task/features/repo_explorer/presentation/bloc/repo_state.dart';
import 'package:tikweb_task/features/repo_explorer/presentation/widgets/home_searchbar.dart';
import 'package:tikweb_task/features/repo_explorer/presentation/widgets/repo_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    context.read<RepoBloc>().add(
      const FetchRepoEvent(query: AppConstants.initialQuery, isInitial: true),
    );
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<RepoBloc>().add(const LoadMoreRepoEvent());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  void _onSearchSubmitted(String query) {
    if (query.trim().isEmpty) return;
    context.read<RepoBloc>().add(FetchRepoEvent(query: query.trim()));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: () =>
            FocusScope.of(context).unfocus(), // Dismiss keyboard on tap

        child: Scaffold(
          appBar: AppBar(
            title: const Text('Repositories'),
            titleSpacing: 10,
            actions: [
              BlocBuilder<ThemeBloc, ThemeMode>(
                builder: (context, themeMode) {
                  final isDark = themeMode == ThemeMode.dark;
                  return Row(
                    children: [
                      Text(
                        isDark ? 'Dark Mode' : 'Light Mode',
                        style: TextStyle(
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                      Switch(
                        value: isDark,
                        onChanged: (value) {
                          final newTheme = value
                              ? ThemeMode.dark
                              : ThemeMode.light;
                          context.read<ThemeBloc>().toggleTheme(newTheme);
                        },
                        activeColor: AppColors.white,
                        activeTrackColor: AppColors.primary,
                        inactiveThumbColor: AppColors.white,
                        inactiveTrackColor: AppColors.grey400,
                        trackOutlineColor: WidgetStateProperty.all(
                          AppColors.transparent,
                        ),
                      ),
                      const SizedBox(width: AppSizes.horizontalPadding / 2),
                    ],
                  );
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.horizontalPadding,
            ),
            child: Column(
              children: [
                // Search bar below AppBar
                HomeSearchbar(onSearch: _onSearchSubmitted),
                const SizedBox(height: AppSizes.verticalSpacing),
                Expanded(
                  child: BlocConsumer<RepoBloc, RepoState>(
                    listener: (context, state) {
                      if (state.status == RepoStatus.failure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              state.errorMessage ?? 'Unknown error',
                            ),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state.isCachedData &&
                          state.status == RepoStatus.success &&
                          state.repos.isNotEmpty) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Showing cached data'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        });
                      }
                      return RefreshIndicator(
                        onRefresh: () async {
                          context.read<RepoBloc>().add(
                            const RefreshRepoEvent(),
                          );
                        },

                        child: _buildBody(state),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(RepoState state) {
    switch (state.status) {
      case RepoStatus.initial:
        return const Center(child: Text('Search for repositories'));
      case RepoStatus.loading:
        return const ItemsLoader();
      case RepoStatus.refreshing:
        return Stack(
          children: [
            _buildList(state),
            const Center(child: CircularProgressIndicator()),
          ],
        );
      case RepoStatus.loadingMore:
        return _buildList(state);
      case RepoStatus.success:
        if (state.repos.isEmpty) {
          return const Center(child: Text('No repositories found'));
        }
        return _buildList(state);
      case RepoStatus.failure:
        if (state.repos.isEmpty) {
          return AppErrorWidget(
            message: state.errorMessage,
            onRetry: () => context.read<RepoBloc>().add(
              FetchRepoEvent(query: state.query),
            ),
          );
        }
        return _buildList(state);
    }
  }

  Widget _buildList(RepoState state) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: state.hasReachedEnd
          ? state.repos.length
          : state.repos.length + 1,
      padding: EdgeInsets.zero,

      itemBuilder: (context, index) {
        if (index >= state.repos.length) {
          return state.status == RepoStatus.failure
              ? AppErrorWidget(
                  message: state.errorMessage,
                  onRetry: () =>
                      context.read<RepoBloc>().add(const LoadMoreRepoEvent()),
                )
              : const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: CircularProgressIndicator()),
                );
        }
        return RepoListItem(repo: state.repos[index]);
      },
    );
  }
}
