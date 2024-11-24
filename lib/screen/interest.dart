// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

import '../config/routes.dart';
import '../widgets/widgets.dart';

class InterestPage extends StatelessWidget {
  const InterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {'id': 1, 'name': 'Soccer', 'icon': 'image 3.png'},
      {'id': 2, 'name': 'Basketball', 'icon': 'image 4.png'},
      {'id': 3, 'name': 'Football', 'icon': 'image 2.png'},
      {'id': 4, 'name': 'Baseball', 'icon': 'baseball_26be 1.png'},
      {'id': 5, 'name': 'Tennis', 'icon': 'image 7.png'},
      {'id': 6, 'name': 'Volleyball', 'icon': 'image 1.png'},
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
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
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  AppChooseItem(
                    items: items,
                  ),

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
