// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/widgets.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),

          // Search
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: AppTextInput(
              hintText: 'Search for news, team, match, etc...',
              fillColor: Color(0xFF222232),
              icon: SvgPicture.asset(
                'assets/icon/Search.svg',
                fit: BoxFit.fitHeight,
                colorFilter:
                    ColorFilter.mode(Color(0xFF65656B), BlendMode.srcIn),
              ),
            ),
          ),
          SizedBox(height: 24),

          // Filter item
          AppSelectItemSmall(item: const [
            {'id': 1, 'name': 'Soccer', 'icon': 'image 3.png'},
            {'id': 2, 'name': 'Basketball', 'icon': 'image 4.png'},
            {'id': 3, 'name': 'Football', 'icon': 'image 2.png'},
            {'id': 4, 'name': 'Baseball', 'icon': 'baseball_26be 1.png'},
            {'id': 5, 'name': 'Tennis', 'icon': 'image 7.png'},
            {'id': 6, 'name': 'Volleyball', 'icon': 'image 1.png'},
          ]),

          SizedBox(height: 32),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: ListView(
                children: const [
                  AppNews(
                    image: 'assets/image 135.png',
                    title:
                        'Rumor Has It: Lampard’s position under threat position under threat',
                    date: '04 JAN 2021, 14:16',
                  ),
                  AppNews(
                    image: 'assets/image/articel5.png',
                    title: 'Artrta sees ‘natural leader’ Tierney as a future,',
                    date: '04 JAN 2021, 14:16',
                  ),
                  AppNews(
                    image: 'assets/image 136.png',
                    title:
                        'Athletic Bilbao to appoint Marcelino as coach until, ...',
                    date: '04 JAN 2021, 14:16',
                  ),
                  AppNews(
                    image: 'assets/image 147.png',
                    title:
                        'Barcelona suffer too much late in games, says Ter Stegen',
                    date: '04 JAN 2021, 14:16',
                  ),
                ],
              ),
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
        margin: EdgeInsets.only(bottom: 24),
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
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2, // Batas maksimal baris
                    overflow: TextOverflow
                        .ellipsis, // Tambahkan elipsis untuk teks panjang
                  ),
                  SizedBox(height: 4),
                  Text(
                    date,
                    style: TextStyle(
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
