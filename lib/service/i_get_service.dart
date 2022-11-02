import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class IGetService {
  IGetService({required this.dio});

  Future getData(String path);
  final Dio dio;
}
