import 'package:clean_arch_learn/features/home/data/data_sources/post_remote_data_source.dart';
import 'package:clean_arch_learn/features/home/data/reposetories/post_reposetory_impl.dart';
import 'package:clean_arch_learn/features/home/domain/reposetories/posts_reposetories.dart';
import 'package:clean_arch_learn/features/home/domain/use_cases/get_all_posts_usecase.dart';
import 'package:clean_arch_learn/features/home/presentation/bloc/post_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.I;

void init() async{

  //* Features

  //* Home
  //* Bloc
  
  sl.registerFactory(() => PostBloc(getAllPostsUseCase: sl()));

  //* UseCase

  sl.registerLazySingleton(() => GetAllPostsUseCase(sl()));

  //* Repo

  sl.registerLazySingleton<PostsReposetories>(() => PostReposetoriesImpl(postRemoteDataSource: sl()));

  //* Data Source

  sl.registerLazySingleton<PostRemoteDataSource>(() => PostRemoteDataSourceHttpImpl());

  //* External

  
}