


import '../util/app_response.dart';
import 'dio_network_helper.dart';

abstract class NetworkHelper {
  factory NetworkHelper() => DioNetworkHelper();
  NetworkHelper.create();

  Future<AppResponse> get(String url, {Map<String, String>? headers , Map<String, dynamic>? queryParameters ,
    bool isCached});

  Future<AppResponse> post(String url,
      {Map<String, String>? headers,
        Map<String, dynamic>? body,
        Map<String, String>? files});

  Future<AppResponse> put(String url,
      {Map<String, String>? headers,
        Map<String, dynamic>? body,
        Map<String, String>? files});

  Future<AppResponse> delete(
      String url,
      {
        Map<String, String>? headers,
        Map<String, dynamic>? body
      });

  Future<AppResponse> query(String url,String query)=> post(url,body: {
    'query':query
  });
}