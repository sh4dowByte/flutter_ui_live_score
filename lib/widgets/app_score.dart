import 'package:flutter/material.dart';
import 'package:flutter_ui_live_score/widgets/widgets.dart';

import '../config/pallete.dart';
import 'app_icons8.dart';

class AppScore extends StatelessWidget {
  final String ligaFlag;
  final String liga;
  final String country;

  final String flag;
  final String flag2;
  final String team;
  final String team2;
  final String scoreTeam;
  final String scoreTeam2;

  final String leadText;

  final Function()? onTap;

  const AppScore({
    super.key,
    required this.ligaFlag,
    required this.liga,
    required this.country,
    required this.flag,
    required this.flag2,
    required this.team,
    required this.team2,
    required this.scoreTeam,
    required this.scoreTeam2,
    required this.leadText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // ignore: prefer_const_constructors
        margin: EdgeInsets.only(bottom: 24),
        child: Column(
          children: [
            AppLiga(ligaFlag: ligaFlag, liga: liga, country: country),
            const SizedBox(height: 14),
            AppScoreTeam(
                flag2: flag2,
                flag: flag,
                team: team,
                scoreTeam: scoreTeam,
                team2: team2,
                scoreTeam2: scoreTeam2,
                leadText: leadText),
          ],
        ),
      ),
    );
  }
}

class AppLiga extends StatelessWidget {
  const AppLiga({
    super.key,
    required this.ligaFlag,
    required this.liga,
    required this.country,
  });

  final String ligaFlag;
  final String liga;
  final String country;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            AppIcons8.getById(ligaFlag, width: 24, height: 24),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  liga,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  country,
                  style:
                      const TextStyle(fontSize: 12, color: Color(0xFFAAAAAA)),
                ),
              ],
            ),
          ],
        ),
        const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 13,
        ),
      ],
    );
  }
}

class AppScoreTeam extends StatelessWidget {
  const AppScoreTeam({
    super.key,
    required this.flag2,
    required this.flag,
    required this.team,
    required this.scoreTeam,
    required this.team2,
    required this.scoreTeam2,
    required this.leadText,
  });

  final String flag2;
  final String flag;
  final String team;
  final String scoreTeam;
  final String team2;
  final String scoreTeam2;
  final String leadText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      decoration: BoxDecoration(
        color: Pallete.blackBorder,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 80,
            child: AppScoreTeamFlags(flag2: flag2, flag: flag),
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(team),
                  Text(scoreTeam),
                ],
              ),
              const SizedBox(width: 10),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('vs'),
                  Text('-'),
                ],
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(team2),
                  Text(scoreTeam2),
                ],
              ),
            ],
          ),
          Container(
            height: 70,
            width: 47,
            decoration: BoxDecoration(
              color: Pallete.black1,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Center(child: Text(leadText)),
          ),
        ],
      ),
    );
  }
}

class AppScoreTeamFlags extends StatelessWidget {
  const AppScoreTeamFlags({
    super.key,
    required this.flag2,
    required this.flag,
  });

  final String flag2;
  final String flag;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: 30,
      child: Stack(
        clipBehavior: Clip.none, // Untuk memastikan elemen tidak terpotong
        children: [
          // Gambar pertama
          Positioned(
            left: 37,
            child: Container(
              padding: const EdgeInsets.all(8),
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Pallete.black1,
                borderRadius: BorderRadius.circular(45),
                border: Border.all(
                  color: Pallete.blackBorder, // Color of the border
                  width: 3, // Width of the border
                ),
              ),
              child: AppTeamSportIcon.getById(flag2),
            ),
          ),
          // Gambar kedua (bergeser ke kanan)
          Positioned(
            left: 0, // Sesuaikan jaraknya agar lebih presisi
            child: Container(
              padding: const EdgeInsets.all(8),
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Pallete.black1,
                borderRadius: BorderRadius.circular(45),
                border: Border.all(
                  color: Pallete.blackBorder, // Color of the border
                  width: 3, // Width of the border
                ),
              ),
              child: AppTeamSportIcon.getById(flag),
            ),
          ),
        ],
      ),
    );
  }
}
