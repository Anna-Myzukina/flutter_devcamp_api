// import 'package:flutter/material.dart';
// import 'package:flutter_devcamp_api/normal_http/model/weather_model.dart';
// import 'package:flutter_devcamp_api/normal_http/providers/get_current_weather_provider.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class WeatherInfoWidget extends ConsumerWidget {
  
//   const WeatherInfoWidget({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final weatherData = ref.watch(currentWeatherProvider);

//     return weatherData.when(
//       data: data, error: error, loading: loading)
    
    // ListView.builder(
    //   scrollDirection: Axis.vertical,
    //   itemCount: 10,
    //   itemBuilder: (context, index) {
    //     return Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Stack(
    //           children: [
    //             Container(
    //               width: MediaQuery.of(context).size.width * 0.8,
    //               height: 250,
    //               decoration: const BoxDecoration(
    //                   //color: Colors.red,
    //                   image: DecorationImage(
    //                       image: AssetImage('assets/images/rectangle.png'))),
    //               child: Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Text(
    //                       '${weather?.main.temp}°',
    //                       style: TextStyle(color: Colors.white, fontSize: 45),
    //                     ),
    //                     const SizedBox(height: 15),
    //                     const Text(
    //                       'H:21 L:19',
    //                       style: TextStyle(color: Colors.white, fontSize: 18),
    //                     ),
    //                     Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         const Text(
    //                           'City, Country',
    //                           style:
    //                               TextStyle(color: Colors.white, fontSize: 15),
    //                         ),
    //                         Text('${weather?.main.humidity}%',
    //                             style: const TextStyle(
    //                                 color: Colors.white, fontSize: 15))
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //             const Align(
    //               alignment: Alignment.bottomRight,
    //               child: Image(
    //                 height: 200,
    //                 image: AssetImage('assets/images/angeled_rain_sun.png'),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ],
    //     );
    //   },
    // );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_devcamp_api/normal_http/model/weather_model.dart';

// This extension convert m/s to km/h
// m/s is the default unit for wind speed in openweathermap but we need to convert it to km/h

extension ConvertWindSpeed on double {
  String get kmh => (this * 3.6).toStringAsFixed(2);
}

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    super.key,
    required this.weather,
  });

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
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