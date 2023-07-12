import 'package:dio/dio.dart';

class DioHelper
{
    static  Dio? dio;
 static void init()
   {
      dio = Dio(
         BaseOptions(
           baseUrl:'https://newsapi.org/',
           connectTimeout: 50000,
           receiveTimeout: 50000,
           headers: dio as Map<String, dynamic>?,
           receiveDataWhenStatusError: true,
         )
     );
   }

   static Future<Response> getData
       (
   {
     required String url,
     required Map<String,dynamic> query ,
   }
       )
   async{
    return await dio!.get(
      url,
       queryParameters:query,
     );
   }

}