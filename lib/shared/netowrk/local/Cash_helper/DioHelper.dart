import 'package:dio/dio.dart';

class DioHelper{

  static late  Dio dio ;
  static init(){
    dio=Dio(
        BaseOptions(
            baseUrl: 'https://student.valuxapps.com/api/',
            receiveDataWhenStatusError: true,

        )
    );
  }
  static Future<Response>  getData(
      {
        required String url,
        Map<String,dynamic> ?query,
        String langaunge='en',
        String? token,
      }
      )async{
    dio.options.headers={
      'lang':langaunge,
    'Authorization': token,
      'Content-Type': 'application/json',
    };


    return await dio.get(url , queryParameters: query );
  }
  static Future<Response> postData({
    required String url,
    String langaunge='en',
    String? token,
     Map<String,dynamic>? query,
   required  Map<String,dynamic>? data,
})async{
    dio.options.headers={
      'lang':langaunge,
    'Authorization': token,
    };
    return dio.post(url,
    queryParameters: query,
      data: data,
    );
  }
}