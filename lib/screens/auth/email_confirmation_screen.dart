import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import 'package:dhvanika/utils/assets.dart';

class EmailConfirmationScreen extends StatelessWidget {
  const EmailConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 300,
          width: 300,
          child: Lottie.asset(Assets.emailVerificationSent),
        ),
      ),
    );
  }
}
