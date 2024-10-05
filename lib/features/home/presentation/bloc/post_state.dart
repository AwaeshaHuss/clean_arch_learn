part of 'post_bloc.dart';

enum PostStateStatus{initial, loading, error, success}

extension PostStateStatusX on PostStateStatus{
  bool get isInitial => this == PostStateStatus.initial;
  bool get isLoading => this == PostStateStatus.loading;
  bool get isError => this == PostStateStatus.error;
  bool get isSuccess => this == PostStateStatus.success;
}

class PostState extends Equatable{
  final PostStateStatus status;
  final List<PostEntity> posts;
  const PostState({this.status = PostStateStatus.initial, this.posts = const []});
  PostState copyWith({PostStateStatus? status, List<PostEntity>? posts}) => PostState(status: status ?? this.status, posts: posts ?? this.posts);

  @override
  List<Object?> get props => [status];
}