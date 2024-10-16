import 'package:flutter/material.dart';

class TouristSpot {
  final String name;
  final String imageUrl;
  final String description;

  TouristSpot(
      {required this.name, required this.imageUrl, required this.description});
}

class ListviewScreen extends StatelessWidget {
  ListviewScreen({super.key});

  final List<TouristSpot> touristSpots = [
    TouristSpot(
      name: 'Menara Teratai',
      imageUrl:
          'https://static.banyumaskab.go.id/website/images/website_05092301365064f6cc82c2e2d.jpg',
      description:
          'Menara setinggi 114m di pusat kota Purwokerto dengan pemandangan kota yang menakjubkan.',
    ),
    TouristSpot(
      name: 'Baturraden',
      imageUrl:
          'https://thumb.viva.id/intipseleb/1265x711/2024/07/03/6685077f416ed-baturaden.jpg',
      description:
          'Kawasan wisata alam di lereng Gunung Slamet dengan pemandian air panas dan air terjun.',
    ),
    TouristSpot(
      name: 'Curug Cipendok',
      imageUrl: 'https://ik.trn.asia/uploads/2023/10/1696506316639.jpeg',
      description:
          'Air terjun tertinggi di Jawa Tengah dengan ketinggian 92 meter, dikelilingi hutan tropis yang asri.',
    ),
    TouristSpot(
      name: 'Taman Andhang Pangrenan',
      imageUrl:
          'https://www.mgriyahotel.com/wp-content/uploads/2017/08/andhang-trendpwt.jpg',
      description:
          'Taman kota yang indah dengan berbagai fasilitas rekreasi dan area piknik yang nyaman.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Wisata Banyumas',
                style: TextStyle(
                  fontFamily:
                      'Roboto', // Menggunakan font Roboto yang tersedia di Flutter
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 3.0,
                      color: Colors.black.withOpacity(0.3),
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://radarbanyumas.disway.id/upload/78ab49e73d219bfe00c20b22d4613961.jpg',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.purple[900],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(15)),
                        child: Image.network(
                          touristSpots[index].imageUrl,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              touristSpots[index].name,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              touristSpots[index].description,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 12),
                            ElevatedButton(
                              onPressed: () {
                                print(
                                    'Anda memilih ${touristSpots[index].name}');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purpleAccent[800],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: const Text('Kunjungi Sekarang'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: touristSpots.length,
            ),
          ),
        ],
      ),
    );
  }
}
