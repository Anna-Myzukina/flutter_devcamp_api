import 'package:flutter/material.dart';
import 'package:flutter_devcamp_api/normal_http/model/weather_model.dart';

// This extension convert m/s to km/h
// m/s is the default unit for wind speed in openweathermap but we need to convert it to km/h

extension ConvertWindSpeed on double {
  String get kmh => (this * 3.6).toStringAsFixed(2);
}

class WeatherDisplayRowWidget extends StatelessWidget {
  const WeatherDisplayRowWidget({
    super.key,
    required this.weather,
  });

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WeatherInfoTile(
            title: 'Temp',
            value: '${weather.main.temp}°',
          ),
          WeatherInfoTile(
            title: 'Wind',
            value: '${weather.wind.speed.kmh} km/h',
          ),
          WeatherInfoTile(
            title: 'Humidity',
            value: '${weather.main.humidity}%',
          ),
        ],
      ),
    );
  }
}

class WeatherInfoTile extends StatelessWidget {
  const WeatherInfoTile({
    super.key,
    required this.title,
    required this.value,
  }) : super();

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Title
        Text(
          title,
          style: const TextStyle(
          color: Colors.white, fontSize: 25),
        ),
        const SizedBox(height: 10),
        Text(
          value,
          style: const TextStyle(
          color: Colors.white, fontSize: 15),
        )
      ],
    );
  }
}