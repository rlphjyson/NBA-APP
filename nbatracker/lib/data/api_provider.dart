import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:http_parser/http_parser.dart';

class ApiProvider {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://www.balldontlie.io/api/v1/',
      connectTimeout: const Duration(milliseconds: 50000),
      receiveTimeout: const Duration(milliseconds: 20000),
    ),
  );

  Future<List<dynamic>> playersRequests() async {
    List<dynamic> playersResult = [];
    Response response;
    int page = 1;
    try {
      do {
        response = await _dio.get('players?per_page=100&page=${page++}');
        print("it works");
        playersResult = playersResult..addAll(response.data['data']);
      } while (response.data['meta']['current_page'] <
          response.data['meta']['total_pages']);

      print("hello");

      return playersResult;
    } on DioError catch (e) {
      if (e.response != null) {
        ErrorResponse(message: e.response?.data['message']);
        debugPrint('Dio error!');
        debugPrint('STATUS: ${e.response?.statusCode}');
        debugPrint('DATA: ${e.response?.data['message']}');
        debugPrint('HEADERS: ${e.response?.headers}');
      } else {
        debugPrint('Error sending request!');
        debugPrint(e.message);
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
    //print(membersResult);
  }

  Future<List<dynamic>> teamsRequests() async {
    List<dynamic> teamsResult;
    try {
      Response response = await _dio.get('teams');

      teamsResult = response.data['data'];

      return teamsResult;
    } on DioError catch (e) {
      if (e.response != null) {
        ErrorResponse(message: e.response?.data['message']);
        debugPrint('Dio error!');
        debugPrint('STATUS: ${e.response?.statusCode}');
        debugPrint('DATA: ${e.response?.data['message']}');
        debugPrint('HEADERS: ${e.response?.headers}');
      } else {
        debugPrint('Error sending request!');
        debugPrint(e.message);
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}

class ErrorResponse {
  bool? status;
  String? message;

  ErrorResponse({this.status, this.message});

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
