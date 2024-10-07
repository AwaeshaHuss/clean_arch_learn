import 'dart:convert';

import 'package:clean_arch_learn/config/network/http_service.dart';
import 'package:clean_arch_learn/core/errors/exceptions.dart';
import 'package:clean_arch_learn/core/strings.dart';
import 'package:clean_arch_learn/features/home/data/models/post_model.dart';

abstract class PostRemoteDataSource{
  Future<List<PostModel>> getAllPosts();
}

class PostRemoteDataSourceHttpImpl implements PostRemoteDataSource{
  @override
  Future<List<PostModel>> getAllPosts() async{
    final response = await HttpService().call(
    postsEndPoint, 
    method: HttpMethod.get, 
    headers: {"Content-Type": "application/json"});

    if(response.statusCode == 200){
       final List decodedJson = json.decode(response.body) as List;
      final List<PostModel> postModels = decodedJson
          .map<PostModel>((jsonPostModel) => PostModel.fromJson(jsonPostModel))
          .toList();
      return postModels;
    }else{
      throw ServerException();
    }
  }

}