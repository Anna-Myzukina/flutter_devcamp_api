import 'package:flutter_devcamp_api/normal_http/api/weather_service.dart';
import 'package:flutter_devcamp_api/normal_http/model/weather_model.dart';

class WeatherNormalRepository {
  final WeatherService weatherService;

  WeatherNormalRepository(this.weatherService);

  Future<List<WeatherModel>> fetchWeather() => weatherService.fetchWeather();

}
