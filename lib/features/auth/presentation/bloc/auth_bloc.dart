import 'dart:async';

import 'package:clean_arch_learn/config/cache/cache_helper.dart';
import 'package:clean_arch_learn/core/errors/failures.dart';
import 'package:clean_arch_learn/core/utils.dart';
import 'package:clean_arch_learn/features/auth/domain/entities/user_auth_entity.dart';
import 'package:clean_arch_learn/features/auth/domain/use_cases/login_use_case.dart';
import 'package:clean_arch_learn/features/auth/domain/use_cases/logout_use_case.dart';
import 'package:clean_arch_learn/features/auth/domain/use_cases/register_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUseCase registerUserUseCase;
  final LoginUseCase loginUseCase;
  final LogOutUseCase logOutUseCase;
  AuthBloc({required this.registerUserUseCase, required this.loginUseCase, required this.logOutUseCase}) : super(const AuthState(loggedOut: false)) {
    on<RegisterEvent>(_register);
    on<LoginEvent>(_login);
    on<LogoutEvent>(_logout);
  }

  static AuthBloc get(context) => BlocProvider.of(context);

  FutureOr<void> _register(RegisterEvent event, Emitter<AuthState> emit) async{
    emit(state.copyWith(status: AuthStateStatus.loading));
    final String email = event.email;
    final String password = event.password;
    final Either<Failure, UserAuthEntity> result;
    result = await registerUserUseCase.call(email: email, password: password);
    result.fold((l){
      ShowToastSnackBar.displayToast(message: l.toString(), isError: true);
      emit(state.copyWith(status: AuthStateStatus.error));
    }, (r){
      // ShowToastSnackBar.displayToast(message: 'Your token ${r.token}', isSuccess: true);
      CacheHelper.saveData(key: 'uid', value: r.token);
      emit(state.copyWith(status: AuthStateStatus.success));
    });
  }

  FutureOr<void> _login(LoginEvent event, Emitter<AuthState> emit) async{
    emit(state.copyWith(status: AuthStateStatus.loading));
    final String email = event.email;
    final String password = event.password;
    final Either<Failure, UserAuthEntity> result;
    result = await loginUseCase(email: email, password: password);
    result.fold((l){
      ShowToastSnackBar.displayToast(message: l.toString(), isError: true);
      emit(state.copyWith(status: AuthStateStatus.error));
    }, (r){
      // ShowToastSnackBar.displayToast(message: 'Your token ${r.token}', isSuccess: true);
      CacheHelper.saveData(key: 'uid', value: r.token);
      emit(state.copyWith(status: AuthStateStatus.success));
    });
  }

  FutureOr<void> _logout(LogoutEvent event, Emitter<AuthState> emit) async{
    emit(state.copyWith(status: AuthStateStatus.loading));
    final Either<Failure, Unit> result;
    result = await logOutUseCase();
    result.fold((l) {
      ShowToastSnackBar.displayToast(message: l.toString(), isError: true);
      emit(state.copyWith(status: AuthStateStatus.error));
    }, (r) {
      CacheHelper.saveData(key: 'uid', value: '');
      emit(state.copyWith(status: AuthStateStatus.success, loggedOut: true));
    });
  }
}
