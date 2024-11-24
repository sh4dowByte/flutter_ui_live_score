import 'package:flutter/material.dart';

import '../config/pallete.dart';

class AppChooseItem extends StatefulWidget {
  final List<Map<String, dynamic>> items;
  const AppChooseItem({super.key, required this.items});

  @override
  State<AppChooseItem> createState() => _AppChooseItemState();
}

class _AppChooseItemState extends State<AppChooseItem> {
  List<int> activeIds = [1];

  void toggleItemById(int id) {
    setState(() {
      if (activeIds.contains(id)) {
        activeIds.remove(id);
      } else {
        activeIds.add(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Jumlah kolom
        crossAxisSpacing: 10, // Jarak antar kolom
        mainAxisSpacing: 8, // Jarak antar baris
        childAspectRatio: 0.7, // Rasio aspek item
      ),
      itemBuilder: (context, index) {
        final item = widget.items[index];
        final isActive = activeIds.contains(item['id']); // Status aktif

        return GestureDetector(
          onTap: () => toggleItemById(item['id']),
          child: Column(
            children: [
              Container(
                width: 90,
                height: 90,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
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
        );
      },
    );
  }
}
