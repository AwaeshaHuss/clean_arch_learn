import 'dart:async';
import 'package:clean_arch_learn/core/errors/failures.dart';
import 'package:clean_arch_learn/features/home/data/models/post_model.dart';
import 'package:clean_arch_learn/features/home/domain/entities/post_entity.dart';
import 'package:clean_arch_learn/features/home/domain/use_cases/get_all_posts_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState>{
  final GetAllPostsUseCase getAllPostsUseCase;

  PostBloc({required this.getAllPostsUseCase}) : super(const PostState()){
    on<GetAllPostsEvent>(_onGetAllPosts);
  }

  static PostBloc get(context) => BlocProvider.of(context);

  FutureOr<void> _onGetAllPosts(GetAllPostsEvent event, Emitter<PostState> emit) async{
    emit(state.copyWith(status: PostStateStatus.loading));
    Either<Failure, List<PostEntity>> result;
    result = await getAllPostsUseCase.call();
    result.fold((l){
      emit(state.copyWith(status: PostStateStatus.error));
    }, (r){
        emit(state.copyWith(posts: r, status: PostStateStatus.success));
    });
  }
}
