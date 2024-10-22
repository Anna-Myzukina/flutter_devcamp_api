class WeatherDataModel {
  final int id;
  final String main;
  final String description;
  final String icon;

  const WeatherDataModel({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherDataModel.fromJson(Map<String, dynamic> json) =>
      WeatherDataModel(
        id: json['id'] as int,
        main: json['main'] as String,
        description: json['description'] as String,
        icon: json['icon'] as String,
      );
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'main': main,
      'description': description,
      'icon': icon
    };
  }
}

class WeatherModel {
  final CoordModel coord;
  final List<WeatherDataModel> weatherDataModel;
  final String base;
  final MainModel main;
  final int? visibility;
  final WindModel wind;
  final RainModel? rain;
  final CloudsModel clouds;
  final int dt;
  final SysModel sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  const WeatherModel({
    required this.coord,
    required this.weatherDataModel,
    required this.base,
    required this.main,
    this.visibility,
    required this.wind,
    this.rain,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      coord: CoordModel.fromJson(json['coord'] as Map<String, dynamic>),
      weatherDataModel: (json['weather'] as List<dynamic>)
          .map((e) => WeatherDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      base: json['base'] as String,
      main: MainModel.fromJson(json['main'] as Map<String, dynamic>),
      visibility: json['visibility'] ?? 0,
      wind: WindModel.fromJson(json['wind'] as Map<String, dynamic>),
      rain: json['rain'] != null
          ? RainModel.fromJson(json['rain'] as Map<String, dynamic>)
          : null,
      clouds: CloudsModel.fromJson(json['clouds'] as Map<String, dynamic>),
      dt: json['dt'] as int,
      sys: SysModel.fromJson(json['sys'] as Map<String, dynamic>),
      timezone: json['timezone'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      cod: json['cod'] as int,
    );
  }
}

class CoordModel {
  final double lon;
  final double lat;

  const CoordModel({
    required this.lon,
    required this.lat,
  });

  factory CoordModel.fromJson(Map<String, dynamic> json) => CoordModel(
        lon: json['lon'] as double,
        lat: json['lat'] as double,
      );
}

class MainModel {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int? pressure;
  final int? humidity;
  final int? seaLevel;
  final int? grndLevel;
  final int? visibility;

  const MainModel({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
    this.visibility,
  });

  factory MainModel.fromJson(Map<String, dynamic> json) => MainModel(
        temp: json['temp'] as double,
        feelsLike: json['feels_like'] as double,
        tempMin: json['temp_min'] as double,
        tempMax: json['temp_max'] as double,
        pressure: json['pressure'],
        humidity: json['humidity'],
        seaLevel: json['sea_level'],
        grndLevel: json['grnd_level'],
        visibility: json['visibility'],
      );
}

class WindModel {
  final double speed;
  final int deg;
  final double? gust;

  const WindModel({
    required this.speed,
    required this.deg,
    this.gust,
  });

  factory WindModel.fromJson(Map<String, dynamic> json) => WindModel(
        speed: json['speed'] ?? 0.0,
        deg: json['deg'] ?? 0,
        gust: json['gust'],
      );
}

class RainModel {
  final double? oneHour;

  const RainModel({this.oneHour});

  factory RainModel.fromJson(Map<String, dynamic> json) {
    return RainModel(oneHour: json['oneHour'] ?? 0.0);
  }
}

class CloudsModel {
  final int all;

  const CloudsModel({
    required this.all,
  });

  factory CloudsModel.fromJson(Map<String, dynamic> json) {
    return CloudsModel(all: json['all'] ?? 0);
  }
}

class SysModel {
  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  const SysModel({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory SysModel.fromJson(Map<String, dynamic> json) => SysModel(
        type: json['type'] ?? 0,
        id: json['id'] ?? 0,
        country: json['country'] ?? '',
        sunrise: json['sunrise'] ?? 0,
        sunset: json['sunset'] ?? 0,
      );
}
