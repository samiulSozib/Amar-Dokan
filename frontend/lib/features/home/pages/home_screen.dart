import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:frontend/features/auth/authController.dart';
import 'package:frontend/features/home/bottom_nav.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../drawer/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthController _authController = Get.put(AuthController());
  final box = GetStorage();
  @override
  void initState() {
    print(box.read("token"));
    //_authController.getUser(context: context, token: box.read("token"));
    // TODO: implement initState
    _authController.getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Amar Dokan",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        drawer: const DrawerMenu(),
        body: BottomNavController(),
      ),
    );
  }
}
