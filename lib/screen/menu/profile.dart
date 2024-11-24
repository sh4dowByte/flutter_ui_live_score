import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_live_score/config/pallete.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Heading
            const SizedBox(height: 52),

            Center(
              child: SizedBox(
                width: 100,
                height: 100,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Transform.scale(
                              scale: 1.5, // Menerapkan skala zoom
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    top: 10,
                                    child: Image.asset(
                                      'assets/image 131.png',
                                      fit: BoxFit.cover,
                                      alignment: Alignment
                                          .topCenter, // Ambil bagian atas gambar
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Edit
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: Pallete.gradientColor, // Warna gradien
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 2),
                        ),
                        child: SvgPicture.asset(
                          'assets/icon/Edit.svg',
                          fit: BoxFit.fitHeight,
                          colorFilter: const ColorFilter.mode(
                              Color(0xFFFFFFFF), BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Name
            const Text(
              'Brian Imanuel',
              style: TextStyle(fontSize: 26),
            ),
            const SizedBox(height: 6),
            Text(
              '#YNWK till the end 🔥',
              style: TextStyle(color: Pallete.grey1),
            ),

            const SizedBox(height: 32),

            // Tab Page
            TabBar(
              // isScrollable: true,
              controller: _tabController,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              dividerHeight: 0,
              indicatorColor: Theme.of(context).primaryColor,
              labelPadding: const EdgeInsets.symmetric(horizontal: 30),
              indicatorPadding: const EdgeInsets.symmetric(horizontal: -20),
              indicator: BoxDecoration(
                gradient: LinearGradient(
                  colors: Pallete.gradientColor,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(23),
              ),
              tabs: const [
                Tab(text: "My Profile"),
                Tab(text: "Activity"),
                Tab(text: "Settings"),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  const MyProfile(),
                  Container(),
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyProfile extends StatelessWidget {
  const MyProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24).copyWith(top: 32),
      child: ListView(
        children: [
          AppListTile(
            title: 'Name',
            subtitle: 'Brian Imanuel',
            icon: SvgPicture.asset(
              'assets/icon/Edit.svg',
              fit: BoxFit.fitHeight,
              colorFilter:
                  const ColorFilter.mode(Color(0xFFFFFFFF), BlendMode.srcIn),
            ),
          ),
          AppListTile(
            title: 'Email',
            subtitle: 'brians213@gmail.com',
            icon: SvgPicture.asset(
              'assets/icon/Message.svg',
              fit: BoxFit.fitHeight,
              colorFilter:
                  const ColorFilter.mode(Color(0xFFFFFFFF), BlendMode.srcIn),
            ),
          ),
          AppListTile(
            title: 'Phone',
            subtitle: '+62 821 560 641',
            icon: SvgPicture.asset(
              'assets/icon/Call.svg',
              fit: BoxFit.fitHeight,
              colorFilter:
                  const ColorFilter.mode(Color(0xFFFFFFFF), BlendMode.srcIn),
            ),
          ),
          AppListTile(
            title: 'Address',
            subtitle: 'Long beach, California',
            icon: SvgPicture.asset(
              'assets/icon/Location.svg',
              fit: BoxFit.fitHeight,
              colorFilter:
                  const ColorFilter.mode(Color(0xFFFFFFFF), BlendMode.srcIn),
            ),
          ),
        ],
      ),
    );
  }
}

class AppListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function()? onTap;
  final Widget icon;

  const AppListTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                      width: 32,
                      height: 32,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Pallete.black1,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: icon),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(color: Pallete.grey1),
                      ),
                      // Divider(),
                    ],
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 17,
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 50, top: 6, bottom: 20),
            child: Divider(),
          )
        ],
      ),
    );
  }
}
