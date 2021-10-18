import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'api_usuario.g.dart';
@JsonSerializable()
class ModeloAccessUser {


  String email;
  String password;
  //String access_token;

  ModeloAccessUser({this.email="", this.password=""/*,this.access_token=""*/});



  factory ModeloAccessUser.fromJson(Map<String, dynamic> json) => _$AccesUserFromJson(json);
  Map<String, dynamic> toJson() => _$AccesUserToJson(this);


}