import 'package:clean_arch_learn/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:clean_arch_learn/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:clean_arch_learn/features/auth/domain/repositories/auth_repository.dart';
import 'package:clean_arch_learn/features/auth/domain/use_cases/login_use_case.dart';
import 'package:clean_arch_learn/features/auth/domain/use_cases/logout_use_case.dart';
import 'package:clean_arch_learn/features/auth/domain/use_cases/register_use_case.dart';
import 'package:clean_arch_learn/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_arch_learn/features/home/data/data_sources/post_remote_data_source.dart';
import 'package:clean_arch_learn/features/home/data/reposetories/post_reposetory_impl.dart';
import 'package:clean_arch_learn/features/home/domain/reposetories/posts_reposetories.dart';
import 'package:clean_arch_learn/features/home/domain/use_cases/get_all_posts_usecase.dart';
import 'package:clean_arch_learn/features/home/presentation/bloc/post_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.I;

void init() async{

  //? Features

  //* Home
  //* Bloc
  
  sl.registerFactory(() => PostBloc(getAllPostsUseCase: sl()));

  //* UseCase

  sl.registerLazySingleton(() => GetAllPostsUseCase(sl()));

  //* Repo

  sl.registerLazySingleton<PostsReposetories>(() => PostReposetoriesImpl(postRemoteDataSource: sl()));

  //* Data Source

  sl.registerLazySingleton<PostRemoteDataSource>(() => PostRemoteDataSourceHttpImpl());

  //* Auth
  //* Bloc

  sl.registerFactory(() => AuthBloc(registerUserUseCase: sl(), loginUseCase: sl(), logOutUseCase: sl()));

  //* UseCase

  sl.registerLazySingleton(() => RegisterUseCase(sl()));
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => LogOutUseCase(sl()));

  //* Repo

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  //* DataSource

  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceHttpImpl());
}