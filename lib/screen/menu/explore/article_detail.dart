// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/pallete.dart';
import '../../../widgets/widgets.dart';

class ArticleDetailPage extends StatefulWidget {
  const ArticleDetailPage({super.key});

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  bool showReadme = true;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Tambahkan listener untuk mendeteksi perubahan posisi scroll
    _scrollController.addListener(() {
      showReadme = _scrollController.position.pixels < 280;

      setState(() {});
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    // Fungsi untuk scroll ke bawah
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent, // Posisi akhir
      duration: Duration(milliseconds: 600), // Durasi animasi
      curve: Curves.easeInOut, // Jenis kurva animasi
    );
  }

  // void _scrollToTop() {
  //   // Fungsi untuk scroll ke atas
  //   _scrollController.animateTo(
  //     0, // Posisi awal
  //     duration: Duration(milliseconds: 500),
  //     curve: Curves.easeInOut,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innnerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 290.0,
              floating: false,
              pinned: true,
              automaticallyImplyLeading: false,
              titleSpacing: 0.0,
              centerTitle: false,
              elevation: 0.0,
              leadingWidth: 0.0,
              title: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        AppCircleButton(
                            onTap: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            )),
                        SizedBox(width: 15),
                        AnimatedOpacity(
                          opacity: innnerBoxIsScrolled ? 1.0 : 0.0,
                          duration: const Duration(seconds: 1),
                          curve: Curves.ease,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 160,
                            child: const Text(
                              'Arsenal vs Aston Villa prediction',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    AppCircleButton(
                      isTransparent: true,
                      icon: SvgPicture.asset(
                        'assets/icon/share.svg',
                        fit: BoxFit.fitHeight,
                        colorFilter: const ColorFilter.mode(
                            Color(0xFFFFFFFF), BlendMode.srcIn),
                      ),
                    ),
                  ],
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: HeaderBodySliver(),
                  ),
                ),
              ),
            ),
          ];
        },
        body: Stack(
          children: [
            Builder(
              builder: (BuildContext context) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Arsenal vs Aston Villa prediction',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 34),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(64)),
                                  child: Image.asset(
                                    'assets/image 131.png',
                                    width:
                                        37, // Tambahkan ukuran untuk menjaga proporsional
                                    height: 37,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 14),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Brian Imanuel'),
                                    Text('May 15, 2020 '),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icon/Heart.svg',
                                  fit: BoxFit.fitHeight,
                                  colorFilter: const ColorFilter.mode(
                                      Color(0xFFFFFFFF), BlendMode.srcIn),
                                ),
                                SizedBox(width: 8),
                                Text('1403'),
                                SizedBox(width: 15),
                                SvgPicture.asset(
                                  'assets/icon/Message.svg',
                                  fit: BoxFit.fitHeight,
                                  colorFilter: const ColorFilter.mode(
                                      Color(0xFFFFFFFF), BlendMode.srcIn),
                                ),
                                SizedBox(width: 8),
                                Text('976'),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        DropCapText(
                          "rsenal will have to grind it out against Aston Villa if they are to register another crucial victory in their pursuit of the Premier League title. "
                          "They've shown resilience and determination in their previous matches, but this game will test their mettle once again.\n\n"
                          "The Gunners will rely heavily on their attacking trio to break through Aston Villa's defense, which has been formidable in recent weeks. "
                          "Villa, on the other hand, will look to capitalize on counter-attacks and set-pieces to exploit any gaps in Arsenal's backline.\n\n"
                          "Both teams are coming into this game with high stakes, and the result could have significant implications for their respective seasons. "
                          "Fans are eagerly anticipating an intense battle at the Emirates Stadium this Sunday, with hopes that their team will emerge victorious.\n"
                          "Key players like Martin Ødegaard and Bukayo Saka will be crucial for Arsenal, while Aston Villa will depend on the creativity of Douglas Luiz and the finishing of Ollie Watkins. \n\n"
                          "This is a clash of styles, with Arsenal's possession-based football going up against Villa's disciplined defensive setup and quick transitions.\n"
                          "The atmosphere at the Emirates is expected to be electric, as supporters gather to cheer their team on in what promises to be a thrilling encounter."
                          "League wins. The match is scheduled for Sunday at the Emirates. \n\nThe Gunners put forth a real statement of intent after their 1-0 win against Manchester United. Mikel Arteta's side had already surrendered points to Liverpool, Manchester City and ",
                          dropCap: DropCap(
                            width: 55, // Lebar huruf besar
                            height: 55, // Tinggi mencakup dua baris
                            child: Text(
                              "A",
                              style: TextStyle(
                                fontSize: 52,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          style: TextStyle(fontSize: 16, height: 2),
                        ),
                        SizedBox(height: 25),
                      ],
                    ),
                  ),
                );
              },
            ),
            AnimatedOpacity(
              opacity: showReadme ? 1.0 : 0.0,
              duration: Duration(milliseconds: 200),
              child: GestureDetector(
                onTap: () {
                  _scrollToBottom();
                },
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          end: Alignment.topCenter, // Awal gradien
                          begin: Alignment.bottomCenter, // Akhir gradien

                          colors: [
                            Colors.black.withOpacity(1),
                            Colors.black.withOpacity(0.6),
                            Colors.transparent, // Warna akhir
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60.0, vertical: 40),
                        child: Container(
                          height: 56,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            gradient: LinearGradient(
                              colors: Pallete.gradientColor, // Warna gradien
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Read More'),
                              Icon(Icons.keyboard_arrow_down_rounded)
                            ],
                          ),
                        ),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderBodySliver extends StatelessWidget {
  const HeaderBodySliver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/image/articel4.png',
          fit: BoxFit.cover,
          height: 500,
        ),
        Positioned(
          top: 120,
          right: 20,
          child: Container(
            height: 45,
            width: 45,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              gradient: LinearGradient(
                colors: Pallete.gradientColor, // Warna gradien
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SvgPicture.asset(
              'assets/icon/Bookmark.svg',
              fit: BoxFit.fitHeight,
              colorFilter:
                  const ColorFilter.mode(Color(0xFFFFFFFF), BlendMode.srcIn),
            ),
          ),
        ),
      ],
    );
  }
}
