import 'package:flutter/material.dart';

import '../config/pallete.dart';

class AppSelectItem extends StatefulWidget {
  const AppSelectItem({super.key});

  @override
  State<AppSelectItem> createState() => _AppSelectItemState();
}

class _AppSelectItemState extends State<AppSelectItem> {
  final List<Map<String, dynamic>> category = [
    {'id': 1, 'name': 'Soccer', 'icon': 'image 3.png'},
    {'id': 2, 'name': 'Basketball', 'icon': 'image 4.png'},
    {'id': 3, 'name': 'Football', 'icon': 'image 2.png'},
    {'id': 4, 'name': 'Baseball', 'icon': 'baseball_26be 1.png'},
    {'id': 5, 'name': 'Tennis', 'icon': 'image 7.png'},
    {'id': 6, 'name': 'Volleyball', 'icon': 'image 1.png'},
  ];

  int activeIds = 1;

  void toggleItemById(int id) {
    setState(() {
      activeIds = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: category.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final item = category[index];
        final isActive = activeIds == (item['id']); // Status aktif

        EdgeInsets margin = EdgeInsets.only(
          left: index == 0 ? 20 : 0,
          right: index == category.length - 1 ? 20 : 0,
        );

        return GestureDetector(
          onTap: () => toggleItemById(item['id']),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            margin: margin,
            child: Column(
              children: [
                Container(
                  width: 92,
                  height: 92,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [
                        isActive ? const Color(0xFFF4A58A) : Pallete.black1,
                        isActive ? const Color(0xFFED6B4E) : Pallete.black1
                      ], // Warna gradien
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Image.asset(
                    'assets/${item['icon']}',
                    width: 44,
                    height: 44,
                    fit: BoxFit
                        .cover, // Menyesuaikan gambar dengan area yang tersedia
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  item['name'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
