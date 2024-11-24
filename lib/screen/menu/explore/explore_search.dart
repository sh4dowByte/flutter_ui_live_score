import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widgets/widgets.dart';

class ExploreSearchPage extends StatelessWidget {
  const ExploreSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filterItems = [
      {'id': 1, 'name': 'Live Score', 'icon': 'fire_1f525 1.png'},
      {'id': 2, 'name': 'News', 'icon': 'newspaper_1f4f0 2.png'},
      {
        'id': 3,
        'name': 'Hastag',
        'icon': 'keycap-number-sign_23-fe0f-20e3 3.png'
      },
      {'id': 4, 'name': 'Liga', 'icon': 'stadium_1f3df-fe0f 2.png'},
    ];

    List<Map<String, dynamic>> searchHistory = [
      {
        'team': [
          {
            'name': 'Barcelona',
            'flag': 'assets/barcelona.png',
          },
          {
            'name': 'Real Madrid',
            'flag': 'assets/realmadrid.png',
          }
        ],
        'date': 'Monday, 12 Feb 2021 . 02.30 am',
      },
      {
        'team': [
          {
            'name': 'Aersenal',
            'flag': 'assets/barcelona.png',
          },
          {
            'name': 'Aston Villa',
            'flag': 'assets/realmadrid.png',
          }
        ],
        'date': 'Tuesday, 9 Mar 2021 . 05.00 am',
      },
      {
        'team': [
          {
            'name': 'Chelsea',
            'flag': 'assets/barcelona.png',
          },
          {
            'name': 'Liverpool',
            'flag': 'assets/realmadrid.png',
          }
        ],
        'date': 'Satuday, 14 Mar 2021 . 01.00 am',
      },
      {
        'team': [
          {
            'name': 'Dortmund',
            'flag': 'assets/barcelona.png',
          },
          {
            'name': 'München',
            'flag': 'assets/realmadrid.png',
          }
        ],
        'date': 'Monday, 12 Feb 2021 . 02.30 am',
      },
      {
        'team': [
          {
            'name': 'Real Madrid',
            'flag': 'assets/barcelona.png',
          },
          {
            'name': 'Arsenal',
            'flag': 'assets/realmadrid.png',
          }
        ],
        'date': 'Friday, 21 Apr 2021 . 00.45 am',
      },
      {
        'team': [
          {
            'name': 'Tottenham',
            'flag': 'assets/barcelona.png',
          },
          {
            'name': 'Watford',
            'flag': 'assets/realmadrid.png',
          }
        ],
        'date': 'Friday, 21 Apr 2021 . 02.45 am',
      },
      {
        'team': [
          {
            'name': 'Swansea City',
            'flag': 'assets/barcelona.png',
          },
          {
            'name': 'Fulham',
            'flag': 'assets/realmadrid.png',
          }
        ],
        'date': 'Sunday, 2 May 2021 . 04.45 am',
      },
      {
        'team': [
          {
            'name': 'Wolfsburg',
            'flag': 'assets/barcelona.png',
          },
          {
            'name': 'Liverpool',
            'flag': 'assets/realmadrid.png',
          }
        ],
        'date': 'Wednesday, 15 May 2021 . 01.00 am',
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
            child: Row(
              children: [
                Flexible(
                  flex: 3,
                  child: AppTextInput(
                    hintText: 'Search for news, team, match, etc...',
                    fillColor: const Color(0xFF222232),
                    icon: SvgPicture.asset(
                      'assets/icon/Search.svg',
                      fit: BoxFit.fitHeight,
                      colorFilter: const ColorFilter.mode(
                          Color(0xFF65656B), BlendMode.srcIn),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: AppButton(
                    'Cancel',
                    color: Theme.of(context).scaffoldBackgroundColor,
                    onTap: () => Navigator.pop(context),
                  ),
                )
              ],
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
                  Column(
                    children: searchHistory
                        .map((e) => SearchItems(
                            flag1: e['team'][0]['flag'],
                            team1: e['team'][0]['name'],
                            flag2: e['team'][1]['flag'],
                            team2: e['team'][1]['name'],
                            date: e['date']))
                        .toList(),
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

class SearchItems extends StatelessWidget {
  final String flag1;
  final String team1;
  final String flag2;
  final String team2;
  final String date;

  const SearchItems({
    super.key,
    required this.flag1,
    required this.team1,
    required this.flag2,
    required this.team2,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 70,
          height: 70,
          child: AppScoreTeamFlags(
            flag: flag1,
            flag2: flag2,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$team1 VS $team2"),
            Text(
              date,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF65656B),
              ),
            ),
          ],
        ),
        const Icon(
          Icons.close,
          color: Color(0xFF65656B),
        ),
      ],
    );
  }
}
