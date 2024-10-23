import 'package:flutter/material.dart';
import 'package:flutter_devcamp_api/normal_http/model/weather_model.dart';

class WeatherInfoWidget extends StatelessWidget {
  final WeatherModel? weather;
  const WeatherInfoWidget({
    super.key,
    this.weather
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 250,
                  decoration: const BoxDecoration(
                      //color: Colors.red,
                      image: DecorationImage(
                          image: AssetImage('assets/images/rectangle.png'))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${weather?.main.temp}°',
                          style: const TextStyle(color: Colors.white, fontSize: 45),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'H:21 L:19',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'City, Country',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            Text('${weather?.main.humidity}%',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomRight,
                  child: Image(
                    height: 200,
                    image: AssetImage('assets/images/angeled_rain_sun.png'),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
