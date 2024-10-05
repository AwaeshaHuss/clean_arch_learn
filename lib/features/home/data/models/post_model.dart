import 'package:clean_arch_learn/features/home/domain/entities/post_entity.dart';

class PostModel{
  final int? id;
  final String? title;
  final String? body;

  PostModel({required this.id, required this.title, required this.body});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      body: json['body'] as String?,
    );
  }

  /// this method preventing tight coupling between [PostModel] => data layer and [PostEntity] => domain layer,
  /// wich leads to actualy follow separation of conserns of the clean arch
  PostEntity toEntity() => PostEntity(id: id, title: title, body: body);
}