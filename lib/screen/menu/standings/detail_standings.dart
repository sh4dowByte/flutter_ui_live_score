import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';

class DetailStandingsPage extends StatelessWidget {
  const DetailStandingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filterItems = [
      {'id': 1, 'name': 'All'},
      {'id': 2, 'name': 'Home'},
      {'id': 3, 'name': 'Away'},
    ];
    List<Map<String, dynamic>> standingTeams = [
      {
        'flags': 'assets/Atletico.png',
        'name': 'Atlético Madrid',
        'score': {
          'd': '2',
          'l': '1',
          'ga': '6',
          'gd': '23',
          'pts': '38',
        }
      },
      {
        'flags': 'assets/realmadrid.png',
        'name': 'Real Madrid',
        'score': {
          'd': '4',
          'l': '3',
          'ga': '7',
          'gd': '15',
          'pts': '37',
        }
      },
      {
        'flags': 'assets/barcelona.png',
        'name': 'Barcelona',
        'score': {
          'd': '4',
          'l': '4',
          'ga': '9',
          'gd': '20',
          'pts': '34',
        }
      },
      {
        'flags': 'assets/Villareal.png',
        'name': 'Villareal',
        'score': {
          'd': '8',
          'l': '2',
          'ga': '10',
          'gd': '16',
          'pts': '32',
        }
      },
      {
        'flags': 'assets/Atletico.png',
        'name': 'Liverpool',
        'score': {
          'd': '6',
          'l': '2',
          'ga': '21',
          'gd': '16',
          'pts': '33',
        }
      },
      {
        'flags': 'assets/manchester.png',
        'name': 'Man United',
        'score': {
          'd': '3',
          'l': '3',
          'ga': '24',
          'gd': '9',
          'pts': '33',
        }
      },
      {
        'flags': 'assets/barcelona.png',
        'name': 'Leicester City',
        'score': {
          'd': '2',
          'l': '5',
          'ga': '21',
          'gd': '10',
          'pts': '32',
        }
      },
      {
        'flags': 'assets/Villareal.png',
        'name': 'Villareal',
        'score': {
          'd': '8',
          'l': '2',
          'ga': '10',
          'gd': '16',
          'pts': '32',
        }
      },
      {
        'flags': 'assets/Atletico.png',
        'name': 'Liverpool',
        'score': {
          'd': '6',
          'l': '2',
          'ga': '21',
          'gd': '16',
          'pts': '33',
        }
      },
      {
        'flags': 'assets/manchester.png',
        'name': 'Man United',
        'score': {
          'd': '3',
          'l': '3',
          'ga': '24',
          'gd': '9',
          'pts': '33',
        }
      },
      {
        'flags': 'assets/barcelona.png',
        'name': 'Leicester City',
        'score': {
          'd': '2',
          'l': '5',
          'ga': '21',
          'gd': '10',
          'pts': '32',
        }
      },
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image 10.png',
                width: 30,
                height: 30,
                fit: BoxFit
                    .cover, // Menyesuaikan gambar dengan area yang tersedia
              ),
              const SizedBox(width: 10),
              const Text(
                "Spain",
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(width: 40),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/1200px-LaLiga 4.png',
                  width: 112,
                  height: 112,
                ),
                const SizedBox(height: 18),
                const Text(
                  'La Liga',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          AppChooseItemSmall(item: filterItems),
          const SizedBox(height: 24),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                children: [
                  rows('#', 'Teams', 'D', 'L', 'Ga', 'Gd', 'Pts'),
                  const Divider(),
                  Expanded(
                    child: ListView(
                      children: standingTeams.asMap().entries.map((entry) {
                        int index = entry.key;
                        var team = entry.value;
                        Color color = Colors.transparent;
                        if (index < 3) {
                          color = const Color(0xFF14274D);
                        } else if (index >= 3 && index <= 5) {
                          color = const Color(0xFF441818);
                        }

                        return rows(
                            (index + 1).toString(),
                            team['name'],
                            team['score']['d'],
                            team['score']['l'],
                            team['score']['ga'],
                            team['score']['gd'],
                            team['score']['pts'],
                            flags: team['flags'],
                            color: color);
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget rows(String num, String teams, String D, String L, String ga,
      String gd, String pts,
      {String? flags, Color? color}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 46,
        decoration: BoxDecoration(
            color: color ?? Colors.transparent,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(width: 35, child: Text(num)),
                if (flags != null) ...[
                  Image.asset(
                    flags,
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 9),
                ],
                SizedBox(width: 80, child: Text(teams)),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 35, child: Text(D)),
                SizedBox(width: 35, child: Text(L)),
                SizedBox(width: 35, child: Text(ga)),
                SizedBox(width: 35, child: Text(gd)),
                SizedBox(width: 35, child: Text(pts)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
