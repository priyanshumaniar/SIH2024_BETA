import '../utils/route_constants.dart';
import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(context) {
    return FutureBuilder(
        future: navigate(context),
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: const Color(0xFFFBFBFD),
            body: Center(
              child: Image.asset(
                'assets/images/Logo.png',
                width: 104,
                height: 120,
              ),
            ),
          );
        });
  }

  Future navigate(context) async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushNamed(context, signUpRoute);
  }
}
