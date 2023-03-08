import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:frontend/features/home/pages/customer_list/customer_list_controller.dart';
import 'package:frontend/model/customer.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerListScreen extends StatefulWidget {
  const CustomerListScreen({super.key});

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
  final CustomerListController _customerListController =
      Get.put(CustomerListController());
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  void initState() {
    _customerListController.fetchAllCustomer();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            children: [
              Container(
                height: screenHeight * 0.06,
                width: screenWidth,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Search By Name or Id",
                        style: TextStyle(color: Colors.white),
                      ),
                      Spacer(),
                      Text(
                        "Filter By Village",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screenWidth * 0.01,
              ),
              Obx(
                () => _customerListController.isLoading.isTrue
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: screenHeight * 0.02,
                            );
                          },
                          itemCount: _customerListController.allCustomer.length,
                          itemBuilder: (context, index) {
                            return ClipPath(
                              clipper: SideCutClipper(),
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  _customerListController
                                                      .allCustomer[index].id
                                                      .toString(),
                                                  style: GoogleFonts.oswald(
                                                    fontSize:
                                                        screenWidth * 0.04,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  _customerListController
                                                      .allCustomer[index]
                                                      .customerName
                                                      .toString(),
                                                  style: GoogleFonts.oswald(
                                                    fontSize:
                                                        screenWidth * 0.04,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  _customerListController
                                                      .allCustomer[index]
                                                      .customerPhone
                                                      .toString(),
                                                  style: GoogleFonts.oswald(
                                                    fontSize:
                                                        screenWidth * 0.04,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  _customerListController
                                                      .allCustomer[index]
                                                      .customerAddress
                                                      .toString(),
                                                  style: GoogleFonts.oswald(
                                                    fontSize:
                                                        screenWidth * 0.04,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            Row(
                                              children: [
                                                Text(
                                                  "Balance: ${_customerListController.allCustomer[index].totalAmount}",
                                                  style: GoogleFonts.oswald(
                                                    fontSize:
                                                        screenWidth * 0.035,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                const Spacer(),
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: const Icon(
                                                    Icons.mail,
                                                    color: Colors.black,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 100,
                                        width: 2,
                                        color: Colors.black,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      _customDialog(
                                                          _customerListController
                                                                  .allCustomer[
                                                              index],
                                                          "add");
                                                    },
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              shape: BoxShape
                                                                  .circle),
                                                      child: const Padding(
                                                        padding: EdgeInsets.all(
                                                            12.0),
                                                        child: Icon(Icons.add),
                                                      ),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  InkWell(
                                                    onTap: () {
                                                      _customDialog(
                                                          _customerListController
                                                                  .allCustomer[
                                                              index],
                                                          "remove");
                                                    },
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              shape: BoxShape
                                                                  .circle),
                                                      child: const Padding(
                                                        padding: EdgeInsets.all(
                                                            12.0),
                                                        child:
                                                            Icon(Icons.remove),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                              InkWell(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.white,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(12.0),
                                                    child: Text(
                                                      "History",
                                                      style: GoogleFonts.oswald(
                                                        fontSize:
                                                            screenWidth * 0.04,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
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

  void _customDialog(Customer customer, String type) {
    Get.defaultDialog(
      title: "Fill The Form",
      content: Column(
        children: [
          Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter Amount",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: TextFormField(
                controller: _noteController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "notes",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: () {
              print(customer.dokanId);
              print(customer.id);
              print(_amountController.text);
              print(_noteController.text);
              print(type);
            },
            child: Container(
              color: Colors.cyan,
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  "Submit Data",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      titleStyle: const TextStyle(
        color: Colors.white,
      ),
      middleTextStyle: const TextStyle(
        color: Colors.white,
      ),
      radius: 30,
    );
  }
}
