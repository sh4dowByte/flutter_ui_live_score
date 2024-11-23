// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

import '../config/routes.dart';
import '../widgets/widgets.dart';

class InterestPage extends StatelessWidget {
  const InterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            Text(
              "What sport do you interest?",
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(height: 14),
            Text(
              "You can choose more than one",
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 16),
            ),
            SizedBox(height: 45),
            Expanded(
              child: ListView(
                children: [
                  AppInterestSelector(),

                  SizedBox(height: 94),

                  // Button
                  Column(
                    children: [
                      AppButton(
                        'Continue',
                        onTap: () => Navigator.pushNamedAndRemoveUntil(
                          context,
                          Routes.menu,
                          (Route<dynamic> route) => false,
                        ),
                      ),
                      SizedBox(width: 20),
                      SizedBox(
                        height: 63,
                        child: Center(
                          child: AppButton(
                            'Skip',
                            color: Colors.white.withOpacity(0),
                            onTap: () => Navigator.pushNamedAndRemoveUntil(
                              context,
                              Routes.menu,
                              (Route<dynamic> route) => false,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppInterestSelector extends StatefulWidget {
  const AppInterestSelector({super.key});

  @override
  State<AppInterestSelector> createState() => _AppInterestSelectorState();
}

class _AppInterestSelectorState extends State<AppInterestSelector> {
  final List<Map<String, dynamic>> days = [
    {'id': 1, 'name': 'Soccer', 'icon': 'image 3.png'},
    {'id': 2, 'name': 'Basketball', 'icon': 'image 4.png'},
    {'id': 3, 'name': 'Football', 'icon': 'image 2.png'},
    {'id': 4, 'name': 'Baseball', 'icon': 'baseball_26be 1.png'},
    {'id': 5, 'name': 'Tennis', 'icon': 'image 7.png'},
    {'id': 6, 'name': 'Volleyball', 'icon': 'image 1.png'},
  ];

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
      itemCount: days.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Jumlah kolom
        crossAxisSpacing: 0, // Jarak antar kolom
        mainAxisSpacing: 8, // Jarak antar baris
        childAspectRatio: 1, // Rasio aspek item
      ),
      itemBuilder: (context, index) {
        final item = days[index];
        final isActive = activeIds.contains(item['id']); // Status aktif

        return GestureDetector(
          onTap: () => toggleItemById(item['id']),
          child: Column(
            children: [
              Container(
                width: 80,
                height: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  gradient: LinearGradient(
                    colors: [
                      isActive ? Color(0xFFF4A58A) : Color(0xFF222232),
                      isActive ? Color(0xFFED6B4E) : Color(0xFF222232)
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
              SizedBox(height: 6),
              Text(
                item['name'],
                textAlign: TextAlign.center,
                style: TextStyle(
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
