import 'package:clean_arch_learn/core/errors/failures.dart';
import 'package:clean_arch_learn/features/auth/domain/entities/user_auth_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository{
  Future<Either<Failure, UserAuthEntity>> register({required String email, required String password});
  Future<Either<Failure, UserAuthEntity>> login({required String email, required String password});
  Future<Either<Failure, Unit>> logout();
}