import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../config/pallete.dart';
import 'screen.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _currentIndex = 0;

  // Daftar halaman yang akan ditampilkan sesuai tab yang dipilih
  final List<Widget> _pages = [
    const Center(child: HomePage()),
    const Center(child: ExplorePage()),
    const Center(child: StandingsPage()),
    const Center(child: ProfilePage()),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          _pages[_currentIndex], // Menampilkan halaman sesuai tab yang dipilih
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent, // Hilangkan efek ripple
          highlightColor: Colors.transparent, // Hilangkan efek highlight
          hoverColor: Colors.transparent, // Hilangkan efek hover
          focusColor: Colors.transparent, // Hilangkan efek focus
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 6, 1, 1).withOpacity(0.1),
                spreadRadius: 3,
                blurRadius: 10,
                // offset: Offset(10, -2), // Offset bayangan ke atas
              ),
            ],
          ),
          child: BottomNavigationBar(
            // elevation: 8.0,
            selectedFontSize: 0,
            currentIndex: _currentIndex, // Index saat ini
            onTap: _onTabTapped, // Mengubah halaman saat tab ditekan
            type: BottomNavigationBarType.fixed,
            items: [
              _buildNavItem(
                  SvgPicture.asset(
                    'assets/icon/Home.svg',
                    width: 25,
                    fit: BoxFit.contain,
                    colorFilter:
                        ColorFilter.mode(Pallete.grey2, BlendMode.srcIn),
                  ),
                  'Home',
                  0),
              _buildNavItem(
                  SvgPicture.asset(
                    'assets/icon/Discovery.svg',
                    fit: BoxFit.contain,
                    width: 25,
                    colorFilter:
                        ColorFilter.mode(Pallete.grey2, BlendMode.srcIn),
                  ),
                  'Explore',
                  1),
              _buildNavItem(
                  SvgPicture.asset(
                    'assets/icon/Chart.svg',
                    width: 25,
                    colorFilter:
                        ColorFilter.mode(Pallete.grey2, BlendMode.srcIn),
                  ),
                  'Standings',
                  2),
              _buildNavItem(
                  SvgPicture.asset(
                    'assets/icon/Profile.svg',
                    width: 25,
                    colorFilter:
                        ColorFilter.mode(Pallete.grey2, BlendMode.srcIn),
                  ),
                  'My Profile',
                  3),
            ],
            selectedItemColor:
                Theme.of(context).primaryColor, // Warna item yang dipilih
            unselectedItemColor: Colors.grey, // Warna item yang tidak dipilih
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(Widget icon, String label, int index) {
    bool isActive = _currentIndex == index;

    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.symmetric(vertical: 34.0),
        child: SizedBox(
            height: 34,
            child: isActive
                ? Column(
                    children: [
                      Text(
                        label,
                        style: TextStyle(color: Pallete.blue1),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                            color: Pallete.blue1,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ],
                  )
                : icon),
      ),
      label: '',
    );
  }
}
