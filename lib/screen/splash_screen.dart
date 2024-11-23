// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../config/routes.dart';
import '../widgets/widgets.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            Center(
              child: SizedBox(
                height: 338.11,
                width: 338.11,
                child: Stack(
                  children: [
                    // Box
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 10,
                      child: Container(
                        width: 276.48,
                        height: 276.48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(57.6),
                          color: Color(0xFF222232),
                        ),
                      ),
                    ),

                    // Mbappe
                    Positioned(
                      bottom: -140,
                      top: 0,
                      left: 2,
                      right: 2,
                      child: Image.asset(
                        'assets/image 27.png',
                        fit: BoxFit.contain, // Menyesuaikan ukuran
                      ),
                    ),

                    // Particle
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 1,
                      left: 1,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 85,
                      right: 1,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Color(0xFF246BFD),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 88),
            Text(
              "Dicover all about sport",
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(height: 14),
            Text(
              "Search millions of jobs and get the inside scoop on companies. Wait for what? Let’s get start it!",
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 16),
            ),

            SizedBox(height: 45),

            // Button
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: AppButton(
                    'Sign In',
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Color(0xFF222232),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (BuildContext context) {
                          return SignIn();
                        },
                      );
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 63,
                    child: Center(
                      child: AppButton(
                        'Sign Up',
                        color: Colors.white.withOpacity(0),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SignIn extends StatelessWidget {
  const SignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 66,
              height: 5,
              decoration: BoxDecoration(
                  color: Color(0xFF65656B),
                  borderRadius: BorderRadius.circular(100)),
            ),
          ),
          SizedBox(height: 20),
          Text("Welcome",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(height: 32),

          AppTextInput(
            hintText: 'Email',
            icon: SvgPicture.asset(
              'assets/icon/Message.svg',
              fit: BoxFit.fitHeight,
              colorFilter: ColorFilter.mode(Color(0xFF65656B), BlendMode.srcIn),
            ),
          ),
          SizedBox(height: 24),
          AppPasswordInput(
            hintText: 'Password',
            icon: SvgPicture.asset(
              'assets/icon/Password.svg',
              fit: BoxFit.fitHeight,
              colorFilter: ColorFilter.mode(Color(0xFF65656B), BlendMode.srcIn),
            ),
          ),
          SizedBox(height: 26),

          // Remember me
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: AppRememberMe(),
          ),

          SizedBox(height: 26),

          AppButton(
            'Sign In',
            onTap: () => Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.interest,
              (Route<dynamic> route) => false,
            ),
          ),

          SizedBox(height: 24),

          Center(
            child: RichText(
              text: TextSpan(
                text: 'Don’t have account?  ',
                style: Theme.of(context).textTheme.titleSmall,
                children: <TextSpan>[
                  TextSpan(
                    text: 'Sign Up',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Handle the click
                      },
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
