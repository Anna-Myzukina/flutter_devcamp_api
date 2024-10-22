import 'package:flutter_devcamp_api/normal_http/api/weather_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentWeatherProvider = FutureProvider.autoDispose((ref) {
  return WeatherService.getCurrentWeather();
});
