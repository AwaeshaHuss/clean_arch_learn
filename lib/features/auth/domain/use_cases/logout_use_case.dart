import 'package:clean_arch_learn/core/errors/failures.dart';
import 'package:clean_arch_learn/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LogOutUseCase{
  final AuthRepository authRepository;
  LogOutUseCase(this.authRepository);

  Future<Either<Failure, Unit>> call() async{
    return await authRepository.logout();
  }
}