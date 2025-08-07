import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tikweb_task/core/bloc/theme_bloc.dart';
import 'package:tikweb_task/core/network/api_client.dart';
import 'package:tikweb_task/core/network/network_info.dart';
import 'package:tikweb_task/features/repo_explorer/data/datasource/repo_local_data_source.dart';
import 'package:tikweb_task/features/repo_explorer/data/datasource/repo_remote_data_source.dart';
import 'package:tikweb_task/features/repo_explorer/data/repositories/repo_repository_impl.dart';
import 'package:tikweb_task/features/repo_explorer/domain/repositories/repo_repository.dart';
import 'package:tikweb_task/features/repo_explorer/domain/usecases/fetch_repo_repository_usecase.dart';
import 'package:tikweb_task/features/repo_explorer/presentation/bloc/repo_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Initialize Hive
  await Hive.initFlutter();

  final settingsBox = await Hive.openBox('settings');
  sl.registerSingleton<Box>(settingsBox);
  sl.registerFactory(() => ThemeBloc(sl()));
  //FetchRepoRepositoryUsecase
  sl.registerFactory(() => RepoBloc(sl()));

  // Use cases
  sl.registerLazySingleton(() => FetchRepoRepositoryUsecase(sl()));
  // Repository
  sl.registerLazySingleton<RepoRepository>(
    () => RepoRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<RepoRemoteDataSource>(
    () => RepoRemoteDataSourceImpl(apiClient: sl()),
  );
  sl.registerLazySingleton<RepoLocalDataSource>(
    () => RepoLocalDataSourceImpl(),
  );

  // Core
  sl.registerLazySingleton(() => ApiClient());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  sl.registerSingleton<Connectivity>(Connectivity());
}
