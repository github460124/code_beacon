import 'package:code_beacon/dio/dio_weather.dart';
import 'package:flutter/material.dart';
import 'package:code_beacon/model/weather_model_entity.dart';

class WeatherWidget extends StatelessWidget{
  final String code ;
  final String temp ;
  final double height;
  const WeatherWidget({Key key, this.code,this.temp,  this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        children: <Widget>[
          Image.asset(
            'lib/image/weatherImage/$code.png',
            width: 40,fit: BoxFit.fill,
          ),
          Text('$temp℃',style: TextStyle(fontSize: 18),),
        ],
      ),
    );
  }
}