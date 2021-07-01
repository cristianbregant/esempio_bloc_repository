import 'dart:convert';

import 'package:esercizio_bloc_repository/src/helper/app_exception.dart';
import 'package:http/http.dart' as http;

class ApiBaseHelper {
  final String _baseUrl = "https://jsonplaceholder.typicode.com";

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(_baseUrl + url));
      responseJson = _returnResponse(response);
    } catch (error) {
      print(error.toString());
      rethrow;
    }
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body, {dynamic header}) async {
    var responseJson;
    try {
      final response = await http.post(Uri.parse(_baseUrl + url),
          body: body, headers: header);
      responseJson = _returnResponse(response);
    } catch (error) {
      print(error.toString());
      rethrow;
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw BadRequestException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
