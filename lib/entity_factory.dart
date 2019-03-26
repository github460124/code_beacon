import 'package:code_beacon/model/weather_model_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "WeatherModelEntity") {
      return WeatherModelEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}