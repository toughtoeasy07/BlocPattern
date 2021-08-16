import 'dart:convert';

import 'package:http/http.dart';

mixin  ServerConnection
{
  String apiname="https://yourapiyour.com/login-authenticate-api";
  //A Future is used to represent a potential value, or error, that will be available at some time in the future
  Future<String> loginApi(var postParams) async
  {
  final response = await post(
      Uri.parse(apiname),
      headers: <String, String>{
       'Content-Type': 'application/json; charset=UTF-8',
       'X-API-KEY': 'Q4GxNgqgKV9XJyoKHNgs'
      },
      body: postParams
  );
  String s=response.body;
  return s;
  }




}















































