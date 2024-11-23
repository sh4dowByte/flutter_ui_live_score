import 'package:flutter/material.dart';
import 'package:flutter_ui_live_score/screen/menu/detail_team.dart';
import '../screen/screen.dart';

class Routes {
  static const String splash = '/splash';
  static const String interest = '/interest';
  static const String menu = '/menu';
  static const String detailTeam = '/detailTeam';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreenPage());
      case interest:
        return MaterialPageRoute(builder: (_) => const InterestPage());
      case menu:
        return MaterialPageRoute(builder: (_) => const MenuPage());
      case detailTeam:
        return MaterialPageRoute(builder: (_) => const DetailTeam());
      case '/':
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  appBar: AppBar(
                    title: const Text('Routes'),
                    centerTitle: true, // Judul di tengah
                  ),
                  body: const Center(
                    child: Text('Routes Not Found'),
                  ),
                ));
    }
  }
}
