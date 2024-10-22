import 'package:flutter_devcamp_api/normal_http/model/weather_model.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class HourlyWeatherModel {
  final String cod;
  final int message;
  final int cnt;
  final List<WeatherEntry> list;
  final CityModel? city;

  const HourlyWeatherModel({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  factory HourlyWeatherModel.fromJson(Map<String, dynamic> json) {
    return HourlyWeatherModel(
      cod: json['cod'] ?? '',
      message: json['message'] ?? 0,
      cnt: json['cnt'] ?? 0,
      list: (json['list'] as List<dynamic>)
          .map((entry) => WeatherEntry.fromJson(entry))
          .toList(),
      city: json['city'] != null ? CityModel.fromJson(json['city']) : null,
    );
  }
}

@JsonSerializable()
class WeatherEntry {
  final int dt;
  final MainModel main;
  final List<WeatherDataModel> weather;
  final CloudsModel clouds;
  final WindModel wind;
  final int visibility;
  final dynamic pop;
  final SysModel? sys;
  final RainModel? rain;
  final String dtTxt;

  const WeatherEntry({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.rain,
    required this.dtTxt,
  });

  factory WeatherEntry.fromJson(Map<String, dynamic> json) {
    return WeatherEntry(
      dt: json['dt'] ?? 0,
      main: MainModel.fromJson(json['main']),
      weather: (json['weather'] as List<dynamic>)
          .map((weatherData) => WeatherDataModel.fromJson(weatherData))
          .toList(),
      clouds: CloudsModel.fromJson(json['clouds']),
      wind: WindModel.fromJson(json['wind']),
      visibility: json['visibility'] ?? 0,
      pop: json['pop'] ?? 0.0,
      sys: json['sys'] != null ? SysModel.fromJson(json['sys']) : null,
      rain: json['rain'] != null ? RainModel.fromJson(json['rain']) : null,
      dtTxt: json['dt_txt'],
    );
  }
}

@JsonSerializable()
class MainModel {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int seaLevel;
  final int grndLevel;
  final int humidity;
  final double tempKf;

  const MainModel({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  factory MainModel.fromJson(Map<String, dynamic> json) {
    return MainModel(
      temp: json['temp'].toDouble(),
      feelsLike: json['feels_like'].toDouble(),
      tempMin: json['temp_min'].toDouble(),
      tempMax: json['temp_max'].toDouble(),
      pressure: json['pressure'],
      seaLevel: json['sea_level'],
      grndLevel: json['grnd_level'],
      humidity: json['humidity'],
      tempKf: json['temp_kf'].toDouble(),
    );
  }
}

@JsonSerializable()
class CloudsModel {
  final int all;

  const CloudsModel({
    required this.all,
  });

  factory CloudsModel.fromJson(Map<String, dynamic> json) {
    return CloudsModel(
      all: json['all'],
    );
  }
}

@JsonSerializable()
class WindModel {
  final double speed;
  final int deg;
  final double gust;

  const WindModel({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  factory WindModel.fromJson(Map<String, dynamic> json) {
    return WindModel(
      speed: json['speed'].toDouble(),
      deg: json['deg'],
      gust: json['gust'].toDouble(),
    );
  }
}

class CityModel {
  final int id;
  final String name;
  final CoordModel coord;
  final String country;
  final int population;
  final int timezone;
  final int sunrise;
  final int sunset;

  CityModel({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'],
      name: json['name'],
      coord: CoordModel.fromJson(json['coord']),
      country: json['country'],
      population: json['population'],
      timezone: json['timezone'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}

@JsonSerializable()
class CoordModel {
  final double lat;
  final double lon;

  const CoordModel({
    required this.lat,
    required this.lon,
  });

  factory CoordModel.fromJson(Map<String, dynamic> json) {
    return CoordModel(
      lat: json['lat'].toDouble(),
      lon: json['lon'].toDouble(),
    );
  }
}

@JsonSerializable()
class RainModel {
  final double threeHours;

  const RainModel({
    required this.threeHours,
  });

  factory RainModel.fromJson(Map<String, dynamic> json) {
    return RainModel(threeHours: json['3h'] ?? 0.0);
  }
}

@JsonSerializable()
class SysModel {
  final String pod;

  const SysModel({
    required this.pod,
  });

  factory SysModel.fromJson(Map<String, dynamic> json) {
    return SysModel(
      pod: json['pod'] ?? '',
    );
  }
}