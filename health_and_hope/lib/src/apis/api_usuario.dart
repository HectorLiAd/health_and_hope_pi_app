import 'package:flutter/cupertino.dart';
// import 'package:imagenespicker_ejemplo/models/modelos_imagen.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
import 'dart:io';
// import 'package:shared_preferences/shared_preferences.dart';

part 'api_usuario.g.dart';

@RestApi(baseUrl: "http://192.168.2.20:8080")
abstract class UserApi {
  factory UserApi(Dio dio, {String baseUrl})=_UserApi;

  static UserApi create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return UserApi(dio);
  }

  @GET("/api/imagenes/")
  Future<List<ModeloImagen>> getImagenes();

  @POST("/api/imagenes/")
  Future<ModeloImagen> crearImagen(@Body() ModeloImagen imagen);


}