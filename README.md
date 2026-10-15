# kalteng_weather

## Tentang Aplikasi

Cuaca Kalimantan Tengah adalah aplikasi mobile yang dibuat menggunakan Flutter untuk menampilkan informasi cuaca terkini di beberapa kota dan kabupaten di Kalimantan Tengah. Pengguna dapat memilih lokasi, lalu aplikasi mengambil dan menampilkan suhu serta kecepatan angin dari Open-Meteo Forecast API.

## Fitur

- Memilih kota atau kabupaten di Kalimantan Tengah.
- Menampilkan suhu dalam derajat Celsius.
- Menampilkan kecepatan angin dalam km/h.
- Menampilkan indikator saat data cuaca sedang dimuat.
- Menampilkan pesan jika terjadi masalah koneksi atau pengambilan data.

## Arsitektur Aplikasi

Aplikasi terdiri dari bagian tampilan, pengambilan data, dan model data.

1. **Tampilan aplikasi** berada di `main.dart`. Bagian ini menampilkan pilihan kota, indikator proses, pesan error, dan informasi cuaca.
2. **Pengambilan data** dilakukan di `main.dart`. Aplikasi meminta data dari Open-Meteo Forecast API menggunakan paket `http`.
3. **Model data** berada di `weather_model.dart`. `KaltengCity` menyimpan nama dan koordinat kota. `CurrentWeather` menyimpan data cuaca yang diterima dari API.
4. **Alur data:** pengguna memilih kota → aplikasi meminta data berdasarkan koordinat kota → data JSON diubah menjadi objek `CurrentWeather` → suhu dan kecepatan angin ditampilkan di layar.

## Struktur Folder

```text
kalteng_weather/
├── lib/
│   ├── main.dart
│   └── weather_model.dart
├── android/
├── ios/
├── pubspec.yaml
└── README.md
```

## Teknologi dan Sumber Data

- Flutter
- Bahasa pemrograman Dart
- Paket `http`
- Open-Meteo Forecast API

## Cara Menjalankan

1. Buka folder proyek di Visual Studio Code.
2. Sambungkan HP Android dengan USB debugging aktif, atau nyalakan emulator Android.
3. Buka terminal melalui menu **Terminal → New Terminal**.
4. Pastikan terminal berada di folder utama proyek, yaitu folder yang berisi `pubspec.yaml`.
5. Ambil dependensi proyek dengan menjalankan:

   ```bash
   flutter pub get
   ```

6. Jalankan aplikasi dengan perintah:

   ```bash
   flutter run
   ```

7. Setelah aplikasi terbuka di HP atau emulator, pilih kota atau kabupaten untuk melihat informasi cuacanya.

## Pembuat

Nama: Della Jeva Lestari XII RPL2