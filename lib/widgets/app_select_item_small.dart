import 'package:flutter/material.dart';

import '../config/pallete.dart';

class AppSelectItemSmall extends StatefulWidget {
  final List<Map<String, dynamic>> item;
  const AppSelectItemSmall({super.key, required this.item});

  @override
  State<AppSelectItemSmall> createState() => _AppSelectItemSmallState();
}

class _AppSelectItemSmallState extends State<AppSelectItemSmall> {
  // final List<Map<String, dynamic>> category = [
  //   {'id': 1, 'name': 'Soccer'},
  //   {'id': 2, 'name': 'Basketball', 'icon': 'image 4.png'},
  //   {'id': 3, 'name': 'Football', 'icon': 'image 2.png'},
  //   {'id': 4, 'name': 'Baseball', 'icon': 'baseball_26be 1.png'},
  //   {'id': 5, 'name': 'Tennis', 'icon': 'image 7.png'},
  //   {'id': 6, 'name': 'Volleyball', 'icon': 'image 1.png'},
  // ];

  int activeIds = 1;

  void toggleItemById(int id) {
    setState(() {
      activeIds = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.item.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = widget.item[index];
          final isActive = activeIds == (item['id']); // Status aktif

          EdgeInsets margin = EdgeInsets.only(
            left: index == 0 ? 20 : 0,
            right: index == widget.item.length - 1 ? 20 : 0,
          );

          return GestureDetector(
            onTap: () => toggleItemById(item['id']),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              margin: margin,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      gradient: LinearGradient(
                        colors: [
                          isActive ? const Color(0xFFF4A58A) : Pallete.black1,
                          isActive ? const Color(0xFFED6B4E) : Pallete.black1
                        ], // Warna gradien
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Row(
                      children: [
                        if (item['icon'] != null) ...[
                          Image.asset(
                            'assets/${item['icon']}',
                            width: 20,
                            height: 20,
                            fit: BoxFit
                                .cover, // Menyesuaikan gambar dengan area yang tersedia
                          ),
                        ],
                        if (item['icon'] != null && isActive) ...[
                          const SizedBox(width: 8),
                        ],
                        if (isActive || item['icon'] == null) ...[
                          Text(
                            item['name'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          )
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
