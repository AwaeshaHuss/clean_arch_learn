import 'package:clean_arch_learn/features/home/presentation/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_arch_learn/config/injection_container.dart' as di;

MultiBlocProvider blocProviders({Widget? child}) {
  return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => di.sl<PostBloc>()..add(const GetAllPostsEvent()))],
      child: child!);
}
