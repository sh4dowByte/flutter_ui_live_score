// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ui_live_score/widgets/widgets.dart';

class DetailTeam extends StatefulWidget {
  const DetailTeam({super.key});

  @override
  State<DetailTeam> createState() => _DetailTeamState();
}

class _DetailTeamState extends State<DetailTeam>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "UEFA Champions League",
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 31),

          // Items
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              TeamLogo(team: 'Arsenal', icon: 'assets/arsenal.png'),
              SizedBox(width: 47),
              Column(
                children: [
                  Text(
                    '2 - 3',
                    style: TextStyle(fontSize: 40),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '90.15',
                  ),
                ],
              ),
              SizedBox(width: 47),
              TeamLogo(team: 'Aston Villa', icon: 'assets/Villareal.png'),
            ],
          ),
          SizedBox(height: 32),

          // Tab Page
          TabBar(
            isScrollable: true,
            controller: _tabController,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            dividerHeight: 0,
            indicatorColor: Theme.of(context).primaryColor,
            labelPadding: EdgeInsets.symmetric(horizontal: 30),
            indicatorPadding: EdgeInsets.symmetric(horizontal: -20),
            indicator: BoxDecoration(
              gradient: LinearGradient(
                colors: const [
                  Color(0xFFF4A58A),
                  Color(0xFFED6B4E)
                ], // Warna gradien
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(23), // Membulatkan sudut
            ),
            tabs: const [
              Tab(text: "Match Detail"),
              Tab(text: "Line Up"),
              Tab(text: "H2H"),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                MatchDetailPage(),
                LineUpPage(),
                Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LineUpPage extends StatelessWidget {
  const LineUpPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Formation',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(width: 14),
              Text(
                '(4-2-3-1)',
                style: TextStyle(color: Color(0xFFC4C4C4)),
              ),
            ],
          ),
          SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: AppSelectItemSmall(item: const [
              {'id': 1, 'name': 'Arsenal'},
              {'id': 2, 'name': 'Aston Villa'},
            ]),
          ),
          SizedBox(height: 24),
          Center(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              child: Image.asset('assets/fieldFootball.png'),
            ),
          ),
        ],
      ),
    );
  }
}

class MatchDetailPage extends StatelessWidget {
  const MatchDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            child: Column(
              children: [
                rowMatch('Shooting', '8', '12'),
                rowMatch('Attacks', '22', '29'),
                rowMatch('Possesion', '42', '58'),
                rowMatch('🟨 Cards', '3', '5'),
                rowMatch('Corners', '8', '7'),

                SizedBox(height: 32),

                // Other Match
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Other Match',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: AppScoreTeam(
                    flag: 'assets/manchester.png',
                    flag2: 'assets/idezia.png',
                    team: 'Man United',
                    team2: 'Chelsea FC',
                    scoreTeam: '2',
                    scoreTeam2: '3',
                    leadText: 'FT',
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: AppScoreTeam(
                    flag: 'assets/tottenham.png',
                    flag2: 'assets/southampton.png',
                    team: 'Totenham',
                    team2: 'Southamton',
                    scoreTeam: '1',
                    scoreTeam2: '0',
                    leadText: 'FT',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget rowMatch(String name, String team1Score, String team2Score) {
    return Container(
      margin: EdgeInsets.only(bottom: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            team1Score,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            width: 100,
            child: Text(
              name,
              style: TextStyle(fontSize: 20, color: Color(0xFFC4C4C4)),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            team2Score,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

class TeamLogo extends StatelessWidget {
  final String team;
  final String icon;
  const TeamLogo({
    super.key,
    required this.team,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Color(0xFF222232),
            borderRadius: BorderRadius.circular(60),
            border: Border.all(
              color: Color(0xFF2B2B3D), // Color of the border
              width: 3, // Width of the border
            ),
          ),
          child: Image.asset(
            icon,
          ),
        ),
        SizedBox(height: 16),
        Text(team),
      ],
    );
  }
}
