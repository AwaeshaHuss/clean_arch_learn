import 'package:clean_arch_learn/config/cache/cache_helper.dart';

const String _postbaseUrl = 'https://jsonplaceholder.typicode.com/';
const String _authbaseUrl = 'https://reqres.in/api/';

const String registerEndPoint = '${_authbaseUrl}register';
const String loginEndPoint = '${_authbaseUrl}login';
const String logoutEndPoint = '${_authbaseUrl}logout';
const String postsEndPoint = '${_postbaseUrl}posts';

final String uToken = CacheHelper.getData(key: 'uid') ?? '';