import 'package:clean_arch_learn/core/utils.dart';
import 'package:clean_arch_learn/features/home/domain/entities/post_entity.dart';
import 'package:clean_arch_learn/features/home/presentation/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if(state.status.isInitial) return _buildInitialWidget();
          if(state.status.isLoading) return _buildLoadingWidget();
          if(state.status.isError) return _buildErrorWidget(context);
          if(state.status.isSuccess) {
            return RefreshIndicator(
            onRefresh: _onRefresh,
            child: _buildSuccessWidget(context, state.posts));
          }
          return 0.width;
        },
      ),
    );
  }

  Widget _buildInitialWidget(){
    return const Center(
      child: Text('this\'s initial state for this screen'),
    );
  }

  Widget _buildSuccessWidget(context, List<PostEntity> posts){
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return index == 0
          ? 32.height
          : Card(
            elevation: 0,
            child: ListTile(
              title: Text(post.title ?? 'No title', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w800),),
              subtitle: Text(post.body ?? 'No body',  style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w400)),
            ),
          );
        },
        padding: const EdgeInsets.all(4.0),
      );
  }

  Widget _buildLoadingWidget(){
    return const Center(
      child: CircularProgressIndicator.adaptive(
        strokeWidth: 1.0,
      ),
    );
  }

  Widget _buildErrorWidget(context){
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Error occurd, try again later!!!'),
          12.height,
          TextButton(onPressed: (){
            PostBloc.get(context).add(const GetAllPostsEvent());
          }, child: const Text('try again'))
        ],
      ),
    );
  }

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      PostBloc.get(context).add(const GetAllPostsEvent());
    }
  }
}
