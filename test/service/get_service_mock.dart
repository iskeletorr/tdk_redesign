import 'dart:io';

import 'package:dio/dio.dart';
import 'package:practice_1/service/i_get_service.dart';

class GetServiceMock implements IGetService{
  @override
  Future getData(String path) async {
    return Future.value([]);
  }
  
  @override
  Dio get dio => Dio();
}
