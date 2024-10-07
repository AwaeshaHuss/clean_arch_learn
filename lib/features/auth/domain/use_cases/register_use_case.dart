import 'package:clean_arch_learn/core/errors/failures.dart';
import 'package:clean_arch_learn/features/auth/domain/entities/user_auth_entity.dart';
import 'package:clean_arch_learn/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterUseCase{
  final AuthRepository authRepository;
  RegisterUseCase(this.authRepository);

  Future<Either<Failure, UserAuthEntity>> call({required String email, required String password}) {
    return authRepository.register(email: email, password: password);
  }
}