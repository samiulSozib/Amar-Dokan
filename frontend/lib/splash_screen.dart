import 'package:flutter/material.dart';
import 'package:frontend/features/auth/authController.dart';
import 'package:frontend/route.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';

import 'consts/app_string.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final box = GetStorage();

  Future chooseScreen() async {
    var token = box.read("token");
    if (token == null || token == "") {
      Get.toNamed(adminSignInScreen);
    } else {
      Get.toNamed(homeScreen);
    }
  }

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () => chooseScreen(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Lottie.asset('assets/files/splash.json'),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  AppString.appString.toString(),
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
