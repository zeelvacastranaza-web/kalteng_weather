import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'weather_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cuaca Kalteng',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const WeatherKaltengScreen(),
    );
  }
}

class WeatherKaltengScreen extends StatefulWidget {
  const WeatherKaltengScreen({super.key});

  @override
  State<WeatherKaltengScreen> createState() => _WeatherKaltengScreenState();
}

class _WeatherKaltengScreenState extends State<WeatherKaltengScreen> {
  final List<KaltengCity> kaltengCities = [
    KaltengCity(
      name: 'Palangkaraya (Ibu Kota)',
      latitude: -2.2106,
      longitude: 113.9139,
    ),
    KaltengCity(
      name: 'Sampit (Kotim)',
      latitude: -2.5333,
      longitude: 112.9500,
    ),
    KaltengCity(
      name: 'Pangkalan Bun (Kobar)',
      latitude: -2.6833,
      longitude: 111.6167,
    ),
    KaltengCity(
      name: 'Muara Teweh (Barito Utara)',
      latitude: -0.9500,
      longitude: 114.9000,
    ),
    KaltengCity(
      name: 'Kuala Kapuas (Kapuas)',
      latitude: -3.0092,
      longitude: 114.3813,
    ),
    KaltengCity(
      name: 'Kuala Kurun (Gunung Mas)',
      latitude: -1.1016,
      longitude: 113.8663,
    ),
    KaltengCity(
      name: 'Kasongan (Katingan)',
      latitude: -2.0465,
      longitude: 113.3857,
    ),
  ];

  late KaltengCity selectedCity;
  CurrentWeather? currentWeather;
  bool isLoading = false;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    selectedCity = kaltengCities[0];
    fetchWeatherData(selectedCity);
  }

  /// Mengambil data cuaca terkini untuk kota yang dipilih.
  Future<void> fetchWeatherData(KaltengCity city) async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    final url = Uri.parse(
      'https://api.open-meteo.com/v1/forecast'
      '?latitude=${city.latitude}'
      '&longitude=${city.longitude}'
      '&current_weather=true',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        setState(() {
          currentWeather = CurrentWeather.fromJson(data['current_weather']);
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Gagal mengambil data dari server API.';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Terjadi kesalahan koneksi internet.';
        isLoading = false;
      });
    }
  }

  /// Menampilkan pilihan kota dan informasi cuaca di layar.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuaca Kalimantan Tengah'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Pilih Kabupaten / Kota:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<KaltengCity>(
              initialValue: selectedCity,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
              items: kaltengCities.map((city) {
                return DropdownMenuItem<KaltengCity>(
                  value: city,
                  child: Text(city.name),
                );
              }).toList(),
              onChanged: (newCity) {
                if (newCity != null) {
                  setState(() {
                    selectedCity = newCity;
                  });
                  fetchWeatherData(newCity);
                }
              },
            ),
            const SizedBox(height: 32),
            if (isLoading)
              const Center(child: CircularProgressIndicator())
            else if (errorMessage != null)
              Text(
                errorMessage!,
                style: const TextStyle(color: Colors.red),
              )
            else if (currentWeather != null)
              Card(
                elevation: 4,
                color: Colors.teal.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        selectedCity.name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '${currentWeather!.temperature} °C',
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Kecepatan Angin: ${currentWeather!.windSpeed} km/h',
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}