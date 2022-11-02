import 'dart:io';

import 'package:dio/dio.dart';
import 'package:practice_1/service/i_get_service.dart';

class GetService extends IGetService {
  GetService(Dio dio):super(dio: dio);
  @override
  Future getData(String path) async {
    final response = await dio.get(path);
    switch (response.statusCode) {
      case HttpStatus.ok:
        return response.data;
      default:
        return '${response.statusCode} - ${response.statusMessage}';
    }
  }
}
