import 'dart:convert';
import 'package:http/http.dart' show Response, get, post, put, patch, delete;

enum HttpMethod { get, post, put, patch, delete }

class HttpService {

  HttpService();

  Future<Response> call<T>(
    String endpoint, {
    required HttpMethod method,
    Map<String, String>? headers,
    T? body,
  }) async {
    return await _request<T>(
      endpoint,
      method: method,
      headers: headers,
      body: body,
    );
  }

  Future<Response> _request<T>(
    String endpoint, {
    required HttpMethod method,
    Map<String, String>? headers,
    T? body,
  }) async {
    final url = Uri.parse(endpoint);
    final jsonBody = body != null ? jsonEncode(body) : null;

    switch (method) {
      case HttpMethod.get:
        return await get(url, headers: headers);
      case HttpMethod.post:
        return await post(url, headers: headers, body: jsonBody);
      case HttpMethod.put:
        return await put(url, headers: headers, body: jsonBody);
      case HttpMethod.patch:
        return await patch(url, headers: headers, body: jsonBody);
      case HttpMethod.delete:
        return await delete(url, headers: headers, body: jsonBody);
      default:
        throw UnimplementedError('HTTP method not supported');
    }
  }
}