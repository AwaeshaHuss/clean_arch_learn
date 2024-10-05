import 'package:clean_arch_learn/core/errors/exceptions.dart';
import 'package:clean_arch_learn/core/errors/failures.dart';
import 'package:clean_arch_learn/features/home/data/data_sources/post_remote_data_source.dart';
import 'package:clean_arch_learn/features/home/domain/entities/post_entity.dart';
import 'package:clean_arch_learn/features/home/domain/reposetories/posts_reposetories.dart';
import 'package:dartz/dartz.dart';

class PostReposetoriesImpl implements PostsReposetories{
  final PostRemoteDataSource postRemoteDataSource;
  PostReposetoriesImpl({required this.postRemoteDataSource});

  @override
  Future<Either<Failure, List<PostEntity>>> getAllPosts() async{
    final postsModel = await postRemoteDataSource.getAllPosts();
    /// in this line we mapped from [PostModel] to [PostEntity] to prevent tight coupling from the both
    List<PostEntity> postsEntity = postsModel.map((postModel) => postModel.toEntity()).toList();
    try {
      return Right(postsEntity);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}