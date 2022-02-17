import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper{
 static Dio? dio;    // creating the dio object

static init(){   // putting the base url unto the dio object and use it while running the app
  dio = Dio(
    BaseOptions(
      baseUrl: 'https://newsapi.org/',    //
      receiveDataWhenStatusError: true,
    ),
  );
}


 static Future<Response> getData({
   required String url,            // named parameters required
   required Map<String, dynamic> query,
 }
     ) async{
   return await dio!.get(
       url,
       queryParameters:query );
 }

}