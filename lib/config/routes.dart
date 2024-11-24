import 'package:flutter/material.dart';
import '../screen/screen.dart';

class Routes {
  static const String splash = '/splash';
  static const String interest = '/interest';
  static const String menu = '/menu';
  static const String detailTeam = '/detail_team';
  static const String detailStandings = '/detail_standings';
  static const String searchExplore = '/search_explore';
  static const String articleDetail = '/article_detail';

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
      case detailStandings:
        return MaterialPageRoute(builder: (_) => const DetailStandingsPage());
      case searchExplore:
        return MaterialPageRoute(builder: (_) => const ExploreSearchPage());
      case articleDetail:
        return MaterialPageRoute(builder: (_) => const ArticleDetailPage());
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
