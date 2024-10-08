import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rekomendasi Wisata',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const TouristRecommendationPage(),
    );
  }
}

class TouristRecommendationPage extends StatelessWidget {
  const TouristRecommendationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rekomendasi Wisata',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 22, // Increased font size
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purple[900],
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Menara Teratai',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Image.network(
                'https://static.banyumaskab.go.id/website/images/website_05092301365064f6cc82c2e2d.jpg',
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              const Text(
                'Menara Teratai merupakan daya tarik wisata bari di daerah Banyumas yang dibuka pada tanggal 27 April 2022. Tinggi menara teratai yaitu 114m, terletak di pusat kota Purwokerto. Pengunjung pun dapat menikmati keindahan kota Purwokerto di malam hari.Jam Operasional Senin-Sabtu 09:00 s/d 22:00 wib dengan harga tiket Rp20.000 Minggu 07:00 s/d 22:00 wib dengan harga tiket Rp25.000  Diskon 50% bagi lansia berumur 60 tahun keatas, bagi anak balita (0-3 tahun) dan penyandang disabilitas.',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Add functionality for visiting the place
                },
                child: const Text('Kunjungi Sekarang'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
