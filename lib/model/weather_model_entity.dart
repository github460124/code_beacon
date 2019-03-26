class WeatherModelEntity {
  List<WeatherModelResult> results;

  WeatherModelEntity({this.results});

  WeatherModelEntity.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = new List<WeatherModelResult>();
      (json['results'] as List).forEach((v) {
        results.add(new WeatherModelResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WeatherModelResult {
  WeatherModelResultsNow now;
  String lastUpdate;
  WeatherModelResultsLocation location;

  WeatherModelResult({this.now, this.lastUpdate, this.location});

  WeatherModelResult.fromJson(Map<String, dynamic> json) {
    now = json['now'] != null
        ? new WeatherModelResultsNow.fromJson(json['now'])
        : null;
    lastUpdate = json['last_update'];
    location = json['location'] != null
        ? new WeatherModelResultsLocation.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.now != null) {
      data['now'] = this.now.toJson();
    }
    data['last_update'] = this.lastUpdate;
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    return data;
  }
}

class WeatherModelResultsNow {
  String code;
  String temperature;
  String text;

  WeatherModelResultsNow({this.code, this.temperature, this.text});

  WeatherModelResultsNow.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    temperature = json['temperature'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['temperature'] = this.temperature;
    data['text'] = this.text;
    return data;
  }
}

class WeatherModelResultsLocation {
  String country;
  String path;
  String timezone;
  String timezoneOffset;
  String name;
  String id;

  WeatherModelResultsLocation(
      {this.country,
      this.path,
      this.timezone,
      this.timezoneOffset,
      this.name,
      this.id});

  WeatherModelResultsLocation.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    path = json['path'];
    timezone = json['timezone'];
    timezoneOffset = json['timezone_offset'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['path'] = this.path;
    data['timezone'] = this.timezone;
    data['timezone_offset'] = this.timezoneOffset;
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}
