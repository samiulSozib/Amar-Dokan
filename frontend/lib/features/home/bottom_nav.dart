// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/state_manager.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'pages/customer/add_customer_screen.dart';
import 'pages/dashboard/dashboard_screen.dart';
import 'pages/statistics/statistic_screen.dart';

class BottomNavController extends StatelessWidget {
  final RxInt _currentIndex = 0.obs;

  final _pages = [
    DashBoardScreen(),
    AddCustomerScreen(),
    StatisticScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          animationDuration: Duration(milliseconds: 600),
          onTap: (value) => _currentIndex.value = value,
          height: 70,
          color: Colors.blue,
          index: _currentIndex.value,
          backgroundColor: Colors.transparent,
          items: const [
            Icon(
              Icons.home,
              size: 20,
              color: Colors.white,
            ),
            Icon(
              Icons.add,
              size: 20,
              color: Colors.white,
            ),
            Icon(
              Icons.history,
              size: 20,
              color: Colors.white,
            )
          ],
        ),
        body: _pages[_currentIndex.value],
      ),
    );
  }
}
