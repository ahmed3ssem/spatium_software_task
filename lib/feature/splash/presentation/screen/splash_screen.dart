import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spatium_software_task/config/routes/app_routes.dart';
import 'package:spatium_software_task/core/utils/app_strings.dart';
import 'package:spatium_software_task/feature/splash/presentation/widget/splash_text_item.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late Timer timer;

  startTimer(){
    timer = Timer(const Duration(seconds: 2), ()=> Navigator.pushReplacementNamed(context, Routes.numericRoutes));
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SplashTextItem(
          text: AppStrings.appName,
          color1: Colors.blue,
          color2: Colors.red,
        ),
      ),
    );
  }
}
