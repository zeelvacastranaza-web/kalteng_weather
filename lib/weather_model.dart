/// Menyimpan nama dan koordinat kota di Kalimantan Tengah.
class KaltengCity {
  final String name;
  final double latitude;
  final double longitude;

  KaltengCity({
    required this.name,
    required this.latitude,
    required this.longitude,
  });
}

/// Menyimpan data cuaca terkini dari API.
class CurrentWeather {
  final double temperature;
  final double windSpeed;
  final int weatherCode;
  final String time;

  CurrentWeather({
    required this.temperature,
    required this.windSpeed,
    required this.weatherCode,
    required this.time,
  });

  /// Mengubah data JSON dari API menjadi objek CurrentWeather.
  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      temperature: (json['temperature'] as num).toDouble(),
      windSpeed: (json['windspeed'] as num).toDouble(),
      weatherCode: json['weathercode'] as int,
      time: json['time'] as String,
    );
  }
}