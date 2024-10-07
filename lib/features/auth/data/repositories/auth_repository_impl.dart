import 'package:clean_arch_learn/core/errors/exceptions.dart';
import 'package:clean_arch_learn/core/errors/failures.dart';
import 'package:clean_arch_learn/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:clean_arch_learn/features/auth/domain/entities/user_auth_entity.dart';
import 'package:clean_arch_learn/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl(this.authRemoteDataSource);
  
  @override
  Future<Either<Failure, UserAuthEntity>> register({required String email, required String password}) async{
   final userModel = await authRemoteDataSource.register(email: email, password: password);
   final userEntity = userModel.toEntity();
   try {
     return Right(userEntity);
   } on InvalidUserCredentialsException {
     return Left(InvalidUserCredentialsFailure());
   }
  }

  @override
  Future<Either<Failure, UserAuthEntity>> login({required String email, required String password}) async{
   final userModel = await authRemoteDataSource.login(email: email, password: password);
   final userEntity = userModel.toEntity();
   try {
     return Right(userEntity);
   } on UserNotFoundException {
     return Left(UserNotFoundFailure());
   }
  }
  
  @override
  Future<Either<Failure, Unit>> logout() async{
    try {
      return const Right(unit);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}