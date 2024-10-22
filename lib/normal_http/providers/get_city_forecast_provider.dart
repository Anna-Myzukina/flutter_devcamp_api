import 'package:flutter_devcamp_api/normal_http/api/weather_service.dart';
import 'package:flutter_devcamp_api/normal_http/model/weather_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cityForecastProvider =
    FutureProvider.autoDispose.family<WeatherModel, String>((ref, cityName) {
  return WeatherService.getWeatherByCityName(cityName: cityName);
});
