// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_live_score/config/pallete.dart';

import '../../config/routes.dart';
import '../../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = [
      {
        'liga': {
          'name': 'La Liga',
          'flag': 'ZGEFKpJoPdJQ',
          'country': 'Spain',
        },
        'team': [
          {
            'name': 'Barcelona',
            'flag': 'paYnEE8hcrP96neHRNofhQ',
            'score': '2',
          },
          {
            'name': 'Real Madrid',
            'flag': 'Th4fAVAZeCJWRcKoLW7koA',
            'score': '0',
          }
        ],
        'status': 'HT',
      },
      {
        'liga': {
          'name': 'Premier League',
          'flag': 'ct9PWm65omja',
          'country': 'England',
        },
        'team': [
          {
            'name': 'Aston Villa',
            'flag': 'uyNNelfnFvCEnsLrUL-j2Q',
            'score': '2',
          },
          {
            'name': 'Liverpool',
            'flag': 'nGfV05dipbAc7zzojivKew',
            'score': '3',
          }
        ],
        'status': 'FT',
      },
    ];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heading
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.all(28.0).copyWith(bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "LiveScore",
                  style: TextStyle(fontSize: 24),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icon/Search.svg',
                      fit: BoxFit.contain,
                      width: 25,
                      colorFilter: const ColorFilter.mode(
                          Color(0xFFFFFFFF), BlendMode.srcIn),
                    ),
                    SizedBox(width: 24),
                    Container(
                      child: Stack(
                        children: [
                          SvgPicture.asset(
                            'assets/icon/Notification.svg',
                            fit: BoxFit.contain,
                            width: 20,
                            colorFilter: const ColorFilter.mode(
                                Color(0xFFFFFFFF), BlendMode.srcIn),
                          ),
                          Positioned(
                            right: 0,
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors:
                                      Pallete.gradientColor, // Warna gradien
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '3',
                                  style: TextStyle(fontSize: 8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(0),
              children: [
                // Banner
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: SizedBox(
                    height: 200,
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                              colors: [
                                Pallete.blue1,
                                Color(0xFF0C0C69)
                              ], // Warna gradien
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                        ),
                        Positioned(
                          right: -20,
                          top: 0,
                          bottom: 0,
                          child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..scale(-1.0, 1.0), // Membalik secara horizontal
                            child: Image.asset(
                                'assets/image-removebg-preview 4.png'), // Ganti dengan path gambar Anda
                          ),
                        ),
                        Positioned(
                          left: 19,
                          top: 37,
                          bottom: 0,
                          child: SizedBox(
                            width: 158,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 120,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 15),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/image 1.png',
                                        width: 18,
                                        height: 18,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        'Football',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Liverpool UEFA Champion League Celebration',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  'Yesterday, 06.30 PM',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 32),

                // Filter
                SizedBox(
                  height: 134,
                  child: AppSelectItem(),
                ),

                SizedBox(height: 24),

                // Score
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Column(
                    children: items
                        .map((e) => AppScore(
                              ligaFlag: e['liga']['flag'],
                              liga: e['liga']['name'],
                              country: e['liga']['country'],
                              flag: e['team'][0]['flag'],
                              flag2: e['team'][1]['flag'],
                              team: e['team'][0]['name'],
                              team2: e['team'][1]['name'],
                              scoreTeam: e['team'][0]['score'],
                              scoreTeam2: e['team'][1]['score'],
                              leadText: e['status'],
                              onTap: () => Navigator.pushNamed(
                                  context, Routes.detailTeam),
                            ))
                        .toList(),
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
