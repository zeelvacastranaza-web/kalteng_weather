# kalteng_weather

## Tentang Aplikasi

Cuaca Kalimantan Tengah adalah aplikasi yang dibuat menggunakan Flutter untuk menampilkan suhu dan kecepatan angin terkini di beberapa kota dan kabupaten di Kalimantan Tengah. Data cuaca diambil dari Open-Meteo Forecast API melalui koneksi internet.

## Fitur

- Memilih lokasi dari daftar tujuh kota/kabupaten: Palangkaraya, Sampit, Pangkalan Bun, Muara Teweh, Kuala Kapuas, Kuala Kurun, dan Kasongan.
- Memuat cuaca Palangkaraya secara otomatis saat aplikasi dibuka.
- Memperbarui data cuaca saat pengguna memilih lokasi lain.
- Menampilkan suhu dalam derajat Celsius (°C) dan kecepatan angin dalam kilometer per jam (km/h).
- Menampilkan indikator ketika data sedang dimuat dan pesan jika terjadi masalah koneksi atau pengambilan data.

## Cara Menggunakan

1. Buka aplikasi; cuaca Palangkaraya akan dimuat secara otomatis.
2. Tekan pilihan **Pilih Kabupaten / Kota**.
3. Pilih kota atau kabupaten yang ingin dilihat.
4. Tunggu hingga suhu dan kecepatan angin lokasi tersebut muncul.

Pastikan perangkat terhubung ke internet agar aplikasi dapat mengambil data terbaru.

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

## Persiapan dan Cara Menjalankan

Pastikan Flutter SDK sudah terpasang. Jika mengambil project dari GitHub, clone repository terlebih dahulu dan buka folder project di Visual Studio Code. Kemudian:

1. Sambungkan HP Android dengan USB debugging aktif, atau nyalakan emulator Android.
2. Buka terminal melalui menu **Terminal → New Terminal**.
3. Pastikan terminal berada di folder utama proyek, yaitu folder yang berisi `pubspec.yaml`.
4. Ambil dependensi proyek dengan menjalankan:

   ```bash
   flutter pub get
   ```

5. Jalankan aplikasi dengan perintah:

   ```bash
   flutter run
   ```

6. Setelah aplikasi terbuka di HP atau emulator, pilih kota atau kabupaten untuk melihat informasi cuacanya.

## Pembuat

Nama: Della Jeva Lestari XII RPL2