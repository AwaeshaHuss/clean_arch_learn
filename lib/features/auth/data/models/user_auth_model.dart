import 'package:clean_arch_learn/features/auth/domain/entities/user_auth_entity.dart';

class UserAuthModel{
  final int? id;
  final String? token;
  final String? error;
  UserAuthModel({required this.id, required this.token, required this.error});

  factory UserAuthModel.fromJson(Map<String, dynamic> json) {
    return UserAuthModel(
      id: json['id'] as int?,
      token: json['token'] as String?,
      error: json['error'] as String?,
    );
  }

  UserAuthEntity toEntity() => UserAuthEntity(id: id, token: token, error: error);
}