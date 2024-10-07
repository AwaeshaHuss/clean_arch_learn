import 'dart:convert';

import 'package:clean_arch_learn/config/network/http_service.dart';
import 'package:clean_arch_learn/core/errors/exceptions.dart';
import 'package:clean_arch_learn/core/strings.dart';
import 'package:clean_arch_learn/core/utils.dart';
import 'package:clean_arch_learn/features/auth/data/models/user_auth_model.dart';

abstract class AuthRemoteDataSource{
  Future<UserAuthModel> register({required String email, required String password});
  Future<UserAuthModel> login({required String email, required String password});
  Future<void> logout();
}

class AuthRemoteDataSourceHttpImpl implements AuthRemoteDataSource{
  @override
  Future<UserAuthModel> register({required String email, required String password}) async{
    final Map<String, String> headers = {
  'Content-Type': 'application/json'
  };
    final Map<String, dynamic> requestBody = {
    'email': email,
    'password': password,
  };
    
    final service = HttpService();
    final response = await service(registerEndPoint, method: HttpMethod.post, headers: headers, body: requestBody);
    
    if(response.statusCode == 200){
      final decodedResponse = json.decode(response.body);
      UserAuthModel model = UserAuthModel.fromJson(decodedResponse);
      return model;
    }else{
      ShowToastSnackBar.displayToast(message: response.body);
      throw InvalidUserCredentialsException();
    }
  }

  @override
  Future<UserAuthModel> login({required String email, required String password}) async{
    final Map<String, String> headers = {
  'Content-Type': 'application/json'
  };
    final Map<String, dynamic> requestBody = {
    'email': email,
    'password': password,
  };
    final service = HttpService();
    final response = await service.call(loginEndPoint, method: HttpMethod.post, headers: headers, body: requestBody);

    if(response.statusCode == 200){
      final decodedResponse = json.decode(response.body);
      UserAuthModel model = UserAuthModel.fromJson(decodedResponse);
      return model;
    }else{
      throw UserNotFoundException();
    }
  }

  @override
  Future<void> logout() async{
    final Map<String, String> headers = {
  'Content-Type': 'application/json'
  };
    final service = HttpService();
    final response = await service(logoutEndPoint, method: HttpMethod.post, headers: headers);

    if(response.statusCode == 200){
      ShowToastSnackBar.displayToast(message: 'You are loggedOut');
    }else{
      throw ServerException();
    }
  }
}