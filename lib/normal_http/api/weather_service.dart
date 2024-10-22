import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_devcamp_api/services/getlocation_service.dart';
import 'package:flutter_devcamp_api/normal_http/model/hourly_weather_model.dart';
import 'package:flutter_devcamp_api/normal_http/model/weather_model.dart';
import 'package:flutter_devcamp_api/normal_http/model/weekly_weather_model.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_devcamp_api/src/constants.dart' as constsant;

class WeatherService {
  static const url =
      'https://api.openweathermap.org/data/2.5';
  
  // static const weeklyWeatherUrl =
  //     'https://api.open-meteo.com/v1/forecast?current=&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=auto';

  Future<List<WeatherModel>> fetchWeather() async {
    final response = await http.get(Uri.parse('$url/posts'));
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data) => WeatherModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  static double lat = 0.0;
  static double lon = 0.0;
  static final dio = Dio();

  //! Get lat and lon
  static Future<void> fetchLocation() async {
    final location = await getLocation();
    lat = location.latitude;
    lon = location.longitude;
  }

  //* Current Weather
  static Future<WeatherModel> getCurrentWeather() async {
    await fetchLocation();
    final url = _constructWeatherUrl();
    final response = await _fetchData(url);
    return WeatherModel.fromJson(response);
  }

  //* Hourly Weather
  static Future<HourlyWeatherModel> getHourlyForecast() async {
    await fetchLocation();
    final url = _constructForecastUrl();
    final response = await _fetchData(url);
    return HourlyWeatherModel.fromJson(response);
  }

  //* Weekly weather
  // static Future<WeeklyWeather> getWeeklyForecast() async {
  //   await fetchLocation();
  //   final url = _constructWeeklyForecastUrl();
  //   final response = await _fetchData(url);
  //   return WeeklyWeather.fromJson(response);
  // }

  //* Weather by City Name
  static Future<WeatherModel> getWeatherByCityName({
    required String cityName,
  }) async {
    final url = _constructWeatherByCityUrl(cityName);
    final response = await _fetchData(url);
    return WeatherModel.fromJson(response);
  }


 //! Build urls
  static String _constructWeatherUrl() =>
      '$url/weather?lat=$lat&lon=$lon&units=metric&appid=${constsant.apiKey}';

  static String _constructForecastUrl() =>
      '$url/forecast?lat=$lat&lon=$lon&units=metric&appid=${constsant.apiKey}';

  static String _constructWeatherByCityUrl(String cityName) =>
      '$url/weather?q=$cityName&units=metric&appid=${constsant.apiKey}';

  // static String _constructWeeklyForecastUrl() =>
  //     '$weeklyWeatherUrl&latitude=$lat&longitude=$lon';

  //* Fetch Data for a url
  static Future<Map<String, dynamic>> _fetchData(String url) async {
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error fetching data');
    }
  }

}