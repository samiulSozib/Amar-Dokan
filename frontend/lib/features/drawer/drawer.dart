import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:frontend/route.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../auth/authController.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  final AuthController _authController = Get.put(AuthController());
  final box = GetStorage();
  RxBool isAdmin = false.obs;

  @override
  void initState() {
    if (box.read("user")['type'] == "dokanAdmin") {
      isAdmin(true);
    } else {
      isAdmin(false);
    }
    print(box.read("user"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => isAdmin.isTrue
        ? Drawer(
            child: ListView(
              padding: const EdgeInsets.only(top: 0),
              children: [
                Card(
                  child: DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          // Image.network(
                          //   "https://cdn.ciroapp.com/storage/2021/02/dokan-logo.png",
                          //   height: 80,
                          // ),
                          Text(
                            "Shop Name",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Md. Samiul Bashar",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.person,
                  ),
                  title: const Text('Staff'),
                  onTap: () {
                    Get.toNamed(staffScreen);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.person,
                  ),
                  title: const Text('Profile'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.settings,
                  ),
                  title: const Text('Settings'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.key,
                  ),
                  title: const Text('Change Password'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.exit_to_app,
                  ),
                  title: const Text('Logout'),
                  onTap: () {
                    _authController.logout();
                  },
                ),
              ],
            ),
          )
        : Drawer(
            child: ListView(
              padding: const EdgeInsets.only(top: 0),
              children: [
                Card(
                  child: DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Image.network(
                            "https://cdn.ciroapp.com/storage/2021/02/dokan-logo.png",
                            height: 80,
                          ),
                          Text(
                            "Shop Name",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Md. Samiul Bashar",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.person,
                  ),
                  title: const Text('Profile'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.settings,
                  ),
                  title: const Text('Settings'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.key,
                  ),
                  title: const Text('Change Password'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.exit_to_app,
                  ),
                  title: const Text('Logout'),
                  onTap: () {
                    _authController.logout();
                  },
                ),
              ],
            ),
          ));
  }
}
