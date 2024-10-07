import 'package:equatable/equatable.dart';

class UserAuthEntity extends Equatable{
  final int? id;
  final String? token;
  final String? error;
  const UserAuthEntity({required this.id, required this.token, required this.error});

  @override
  List<Object?> get props => [id, token];
}