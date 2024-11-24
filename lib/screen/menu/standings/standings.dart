import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/routes.dart';
import '../../../widgets/widgets.dart';

class StandingsPage extends StatelessWidget {
  const StandingsPage({super.key});

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

    List<Map<String, dynamic>> standingTeams = [
      {
        'liga': {
          'flag': 'assets/image 10.png',
          'name': 'La Liga',
          'country': 'Spain',
        },
        'teams': [
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
        ],
      },
      {
        'liga': {
          'flag': 'assets/image 9.png',
          'name': 'Premier League',
          'country': 'England',
        },
        'teams': [
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
        ],
      }
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
              hintText: 'Search your competition ...',
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: ListView(
                padding: const EdgeInsets.all(0),
                children: [
                  ...standingTeams.map(
                    (e) => AppStandingsTeam(
                      teams: e['teams'],
                      liga: e['liga'],
                      onTap: () => Navigator.of(context)
                          .pushNamed(Routes.detailStandings),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppStandingsTeam extends StatelessWidget {
  final Map<String, dynamic> liga;
  final List<Map<String, dynamic>> teams;
  final Function()? onTap;
  const AppStandingsTeam({
    super.key,
    required this.teams,
    required this.liga,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          AppLiga(
            ligaFlag: liga['flag'],
            liga: liga['name'],
            country: liga['country'],
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF222232),
              borderRadius: BorderRadius.circular(19),
            ),
            child: Column(
              children: [
                rows(
                  'Teams',
                  'D',
                  'L',
                  'Ga',
                  'Gd',
                  'Pts',
                ),
                ...teams.map((e) => rows(
                      e['name'],
                      e['score']['d'],
                      e['score']['l'],
                      e['score']['ga'],
                      e['score']['gd'],
                      e['score']['pts'],
                      flags: e['flags'],
                    ))
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget rows(
      String teams, String D, String L, String ga, String gd, String pts,
      {String? flags}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (flags != null) ...[
                    Image.asset(
                      flags,
                      width: 16,
                      height: 16,
                    ),
                    const SizedBox(width: 9),
                  ],
                  SizedBox(width: 100, child: Text(teams)),
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
          const Padding(
            padding: EdgeInsets.only(left: 190),
            child: Divider(
              color: Color(0xFF181829),
            ),
          ),
        ],
      ),
    );
  }
}
