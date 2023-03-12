import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:frontend/features/home/pages/dashboard/dashboardController.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../auth/authController.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final AuthController _authController = Get.put(AuthController());
  final DashBoardController _dashBoardController =
      Get.put(DashBoardController());
  @override
  void initState() {
    _authController.getUser();
    _dashBoardController.getUnpaidInfo();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Text(
                  _dashBoardController.dokanName.toString(),
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => Text(
                  _dashBoardController.dokanAddress.toString(),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
              Obx(
                () => Text(
                  _dashBoardController.dokanPhone.toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
              const Divider(
                color: Colors.black,
                thickness: 3,
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Unpaid Customer",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Obx(
                                  () => Text(
                                    _dashBoardController.unpaidCustomer
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Total Unpaid Amount",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Obx(
                                  () => Text(
                                    _dashBoardController.unpaidTotalAmount
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Unpaid Amount",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Obx(
                () => _dashBoardController.isLoading.isTrue
                    ? const CircularProgressIndicator()
                    : Expanded(
                        child: ListView.builder(
                          itemCount:
                              _dashBoardController.unpaidHistoryByMonth.length,
                          itemBuilder: (contex, index) {
                            return Card(
                              child: Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Year: ${_dashBoardController.unpaidHistoryByMonth[index].year.toString()}",
                                          ),
                                          Text(
                                            "Month: ${_dashBoardController.unpaidHistoryByMonth[index].month.toString()}",
                                          ),
                                        ],
                                      ),
                                      Text(
                                          "Due Amount: ${_dashBoardController.unpaidHistoryByMonth[index].totalAmount}")
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
