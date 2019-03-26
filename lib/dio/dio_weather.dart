import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:code_beacon/model/weather_model_entity.dart';
main(){
  DioWeather.fetch();
}
class DioWeather{
  static var dio = new Dio();
  static  WeatherModelResult weatherModelResult;
  static Future<WeatherModelResult> fetch() async{
    Response response;
    response = await dio.get("https://api.seniverse.com/v3/weather/now.json?key=mgb8ickaql6hcn1l&location=shanghai&language=zh-Hans&unit=c");
    print('get in fetch');
    if(response.statusCode == 200){
      print('lianjiechenggong');
      weatherModelResult = WeatherModelEntity.fromJson(response.data).results[0];
      print(response.data);
      return weatherModelResult;
    }
    else{print('error');throw Exception('StatusCode : ${response.statusCode}');}
  }
}