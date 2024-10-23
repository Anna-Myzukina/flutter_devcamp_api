import 'package:flutter/material.dart';
import 'package:flutter_devcamp_api/normal_http/providers/get_current_weather_provider.dart';
import 'package:flutter_devcamp_api/src/time_converter.dart';
import 'package:flutter_devcamp_api/widgets/weather_display_row_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherDisplayWidget extends ConsumerWidget {
  const WeatherDisplayWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(currentWeatherProvider);

    return weatherData.when(
      data: (weather) {
        return SizedBox(
          //height: 300,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              top: 36.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Country name text
                    Text(
                      weather.name,
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                    ),

                    const SizedBox(height: 20),

                    // Today's date
                    Text(
                      DateTime.now().dateTime,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),

                    const SizedBox(height: 30),

                    // Weather icon big
                    SizedBox(
                      height: 160,
                      child: Image.asset(
                        'assets/icons/${weather.weatherDataModel[0].icon.replaceAll('n', 'd')}.png',
                        fit: BoxFit.contain,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Weather description
                    Text(
                      weather.weatherDataModel[0].description.toUpperCase(),
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    const SizedBox(height: 50),

                    const SizedBox(height: 40),

                    // Weather info in a row
                    WeatherDisplayRowWidget(weather: weather),

                    const SizedBox(height: 15),
                  ]),
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return const Center(
          child: Text(
            'An error has occurred',
          ),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
