import 'package:clean_arch_learn/core/errors/failures.dart';
import 'package:clean_arch_learn/features/home/domain/entities/post_entity.dart';
import 'package:clean_arch_learn/features/home/domain/reposetories/posts_reposetories.dart';
import 'package:dartz/dartz.dart';

class GetAllPostsUseCase{
  final PostsReposetories postsReposetories;
  GetAllPostsUseCase(this.postsReposetories);
  
  Future<Either<Failure, List<PostEntity>>> call() {
    return postsReposetories.getAllPosts();
  }
}