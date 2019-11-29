import 'package:dio/dio.dart';
import 'dart:async';

Map<String, dynamic> optHeader = {
  'content-type': 'application/json',
  'device': 'iOS',
  'appFlag': 'hem',
  'version': '2.0.9'
};

var dio = Dio(BaseOptions(connectTimeout: 30000, headers: optHeader));

// String stagingBaseURLString = 'http://api.test.tzlc51.com:8080';
String baseURLString = 'http://api.test.tzlc51.com:8080';

class APIPath {
  final String value;
  const APIPath._(this.value);
  static const audioRoomList = APIPath._('/voice-room/page');
  static const videoList = APIPath._('/product/page');
  static const userDetail = APIPath._('/user/detail');
}

class Netutils {
  static Future get(APIPath path, [Map<String, dynamic> params]) async {
    Response response;
    if (params != null) {
      response =
          await dio.get(baseURLString + path.value, queryParameters: params);
    } else {
      response = await dio.get(baseURLString + path.value);
    }
    return response.data;
  }

  static Future post(APIPath path, Map<String, dynamic> params) async {
    Response response = await dio.post(baseURLString + path.value,
        data: params);
    return response.data;
  }
}
