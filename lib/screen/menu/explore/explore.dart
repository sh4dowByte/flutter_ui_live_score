import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/routes.dart';
import '../../../widgets/widgets.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filterItems = [
      {'id': 1, 'name': 'Soccer', 'icon': 'image 3.png'},
      {'id': 2, 'name': 'Basketball', 'icon': 'image 4.png'},
      {'id': 3, 'name': 'Football', 'icon': 'image 2.png'},
      {'id': 4, 'name': 'Baseball', 'icon': 'baseball_26be 1.png'},
      {'id': 5, 'name': 'Tennis', 'icon': 'image 7.png'},
      {'id': 6, 'name': 'Volleyball', 'icon': 'image 1.png'},
    ];

    List<Map<String, dynamic>> trendingNews = [
      {
        'image': 'assets/image/articel4.png',
        'title': 'Arsenal vs Aston Villa prediction',
        'date': 'May 15, 2020',
      },
      {
        'image': 'assets/image/articel6.png',
        'title': 'Expected Borussia Dortmund starting ...',
        'date': 'Aug 23, 2020',
      },
      {
        'image': 'assets/image 135.png',
        'title': 'Arsenal vs Aston Villa prediction',
        'date': 'May 15, 2020',
      },
    ];
    List<Map<String, dynamic>> news = [
      {
        'image': 'assets/image 135.png',
        'title':
            'Rumor Has It: Lampard’s position under threat position under threat',
        'date': '04 JAN 2021, 14:16',
      },
      {
        'image': 'assets/image/articel5.png',
        'title': 'Artrta sees ‘natural leader’ Tierney as a future,',
        'date': '04 JAN 2021, 14:16',
      },
      {
        'image': 'assets/image 136.png',
        'title': 'Athletic Bilbao to appoint Marcelino as coach until, ...',
        'date': '04 JAN 2021, 14:16',
      },
      {
        'image': 'assets/image 147.png',
        'title': 'Barcelona suffer too much late in games, says Ter Stegen',
        'date': '04 JAN 2021, 14:16',
      },
    ];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 65),

          // Search
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: AppTextInput(
              onTap: () => Navigator.pushNamed(context, Routes.searchExplore),
              hintText: 'Search for news, team, match, etc...',
              fillColor: const Color(0xFF222232),
              icon: SvgPicture.asset(
                'assets/icon/Search.svg',
                fit: BoxFit.fitHeight,
                colorFilter:
                    const ColorFilter.mode(Color(0xFF65656B), BlendMode.srcIn),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Filter item
          AppSelectItemSmall(item: filterItems),

          const SizedBox(height: 32),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Column(
                    children: [
                      ...news.map((e) => AppNews(
                            image: e['image'],
                            title: e['title'],
                            date: e['date'],
                          )),
                    ],
                  ),
                ),

                // Trending news
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.0),
                  child: Text(
                    'Trending News',
                    style: TextStyle(fontSize: 24),
                  ),
                ),

                const SizedBox(height: 24),

                SizedBox(
                  height: 169,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: trendingNews.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final item = trendingNews[index];

                      EdgeInsets margin = EdgeInsets.only(
                        left: index == 0 ? 20 : 0,
                        right: index == trendingNews.length - 1 ? 20 : 0,
                      );

                      return GestureDetector(
                        child: Container(
                          width: 250,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          margin: margin,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      item['image'],
                                      fit: BoxFit.cover,
                                      width: 250,
                                      height: double.infinity,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          end: Alignment
                                              .topCenter, // Awal gradien
                                          begin: Alignment
                                              .bottomCenter, // Akhir gradien

                                          colors: [
                                            Colors.black.withOpacity(
                                                0.7), // Warna awal dengan transparansi
                                            Colors.transparent, // Warna akhir
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 250,
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      item['title'],
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      item['date'],
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AppNews extends StatelessWidget {
  final String image;
  final String title;
  final String date;
  final Function()? onTap;

  const AppNews({
    super.key,
    required this.image,
    required this.title,
    required this.date,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        height: 64,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image.asset(
                image,
                width: 64, // Tambahkan ukuran untuk menjaga proporsional
                height: 64,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20), // Jarak antar elemen
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2, // Batas maksimal baris
                    overflow: TextOverflow
                        .ellipsis, // Tambahkan elipsis untuk teks panjang
                  ),
                  const SizedBox(height: 4),
                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF65656B),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20), // Jarak antar elemen
            SvgPicture.asset(
              'assets/icon/Bookmark.svg',
              width: 25,
              colorFilter:
                  const ColorFilter.mode(Color(0xFF65656B), BlendMode.srcIn),
            ),
          ],
        ),
      ),
    );
  }
}
