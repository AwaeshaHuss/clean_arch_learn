import 'package:clean_arch_learn/core/errors/failures.dart';
import 'package:clean_arch_learn/features/home/domain/entities/post_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PostsReposetories{
  Future<Either<Failure, List<PostEntity>>> getAllPosts();
}