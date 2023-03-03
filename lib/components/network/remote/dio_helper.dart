//TODO:16 1st step of dio
import'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DioHelper{
  
  /*TODO:16.1 //make it static so that init can see it*/
  static Dio dio; 
  /*TODO:16.2 //create object*/
  static init(){
    /*TODO:16.3 */
    dio = Dio(
    BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,
    ),);
  }
  //TODO:16.5 getData method and make it static like dio
  static Future<Response> getData(
    {@required String url , @required Map<String,dynamic> query}) async{
    return await dio.get(url,queryParameters: query);
  }
}