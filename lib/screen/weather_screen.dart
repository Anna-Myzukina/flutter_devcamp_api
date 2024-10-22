import 'package:flutter/material.dart';
import 'package:flutter_devcamp_api/normal_http/providers/get_current_weather_provider.dart';
import 'package:flutter_devcamp_api/src/time_converter.dart';
import 'package:flutter_devcamp_api/widgets/weather_info_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class WeatherScreen extends StatefulWidget {
//   const WeatherScreen({super.key});

//   @override
//   State<WeatherScreen> createState() => _WeatherScreenState();
// }

// class _WeatherScreenState extends State<WeatherScreen> {
// @override
// Widget build(BuildContext context) {
//   double customWidth = MediaQuery.of(context).size.width;
//   return Scaffold(
//     backgroundColor: const Color(0xFF2b2e54),
//     body: Padding(
//       padding: EdgeInsets.symmetric(
//       horizontal: customWidth * 0.1),
//       child: const Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(
//             height: 650,
//             //width: customWidth * 0.8,
//             child: WeatherInfoWidget(),
//           ),
//         ],
//       ),
//     ),
//   );
// }

//}

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(currentWeatherProvider);

    return weatherData.when(
        data: (weather) {
          return Scaffold(
            backgroundColor: const Color(0xFF2b2e54),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 24.0,
                  right: 24.0,
                  top: 36.0,
                ),
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate(
                       [
                        Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: double.infinity,
                              ),
                              // Country name text
                              Text(
                                weather.name,
                                style: TextStyle(color: Colors.white, fontSize: 15),
                              ),
            
                              const SizedBox(height: 20),
            
                              // Today's date
                              Text(
                                DateTime.now().dateTime,
                                style: TextStyle(color: Colors.white, fontSize: 15),
                              ),
            
                              const SizedBox(height: 30),
            
                               // Weather icon big
                              SizedBox(
                                height: 260,
                                child: Image.asset(
                                  'assets/icons/${weather.weatherDataModel[0].icon.replaceAll('n', 'd')}.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
            
                              const SizedBox(height: 30),
            
                               // Weather description
                              Text(
                                weather.weatherDataModel[0].description.toUpperCase(),
                                style: TextStyle(color: Colors.white, fontSize: 15),
                              ),
                          ],
                        )
                       ]
                      ),
                    ),
                  ],
                ),
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
