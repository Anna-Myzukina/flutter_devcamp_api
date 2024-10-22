import 'package:flutter_devcamp_api/normal_http/api/weather_service.dart';
import 'package:flutter_devcamp_api/normal_http/model/hourly_weather_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final hourlyForecastProvider = FutureProvider.autoDispose<HourlyWeatherModel>(
  (ref) => WeatherService.getHourlyForecast(),
);