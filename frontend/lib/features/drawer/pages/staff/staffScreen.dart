import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:frontend/features/drawer/pages/staff/staffController.dart';
import 'package:frontend/features/drawer/pages/staff/widget/singleStaff.dart';
import 'package:get/get.dart';

import '../../../../route.dart';

class StaffScreen extends StatelessWidget {
  final StaffController _staffController = Get.put(StaffController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Staff List",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => _staffController.staffList.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return SingleStaff(
                                staffName: _staffController
                                    .staffList[index].staffName!,
                                staffPhone:
                                    _staffController.staffList[index].phone!);
                          },
                          itemCount: _staffController.staffList.length,
                        ),
                      ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(addStaffScreen),
          child: const Icon(Icons.person_add),
        ),
      ),
    );
  }
}
