import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:frontend/features/home/pages/customer/customer_controller.dart';
import 'package:get/get.dart';

import '../../../../common/custom_button.dart';
import '../../../../common/custom_textfield.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  final TextEditingController _customerName = TextEditingController();
  final TextEditingController _customerPhone = TextEditingController();
  final TextEditingController _customerAddress = TextEditingController();

  final _customerKey = GlobalKey<FormState>();
  final CustomerController _customerController = Get.put(CustomerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Form(
            key: _customerKey,
            child: Column(
              children: [
                const Center(
                  child: Text(
                    "Add Customer",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: _customerName,
                  hintText: "Customer Name",
                  type: TextInputType.text,
                  icon: const Icon(Icons.person),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: _customerPhone,
                  hintText: "Customer Phone",
                  type: TextInputType.number,
                  icon: const Icon(Icons.person),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: _customerAddress,
                  hintText: "Customer Address",
                  type: TextInputType.text,
                  icon: const Icon(Icons.person),
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  () => _customerController.isLoading.isTrue
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : CustomButton(
                          text: "Add Customer",
                          onTap: () {
                            if (_customerKey.currentState!.validate()) {
                              _customerController.addCustomer(
                                  customerName: _customerName.text,
                                  customerPhone: _customerPhone.text,
                                  customerAddress: _customerAddress.text);
                              _customerName.text = "";
                              _customerPhone.text = "";
                              _customerAddress.text = "";
                            }
                          },
                        ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
