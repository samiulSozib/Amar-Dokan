import 'package:flutter/material.dart';
import 'package:frontend/common/custom_button.dart';

import 'package:frontend/common/custom_textfield.dart';
import 'package:frontend/features/drawer/pages/staff/staffController.dart';
import 'package:get/get.dart';

class AddStaffScreen extends StatefulWidget {
  const AddStaffScreen({super.key});

  @override
  State<AddStaffScreen> createState() => _AddStaffScreenState();
}

class _AddStaffScreenState extends State<AddStaffScreen> {
  final TextEditingController staffNameController = TextEditingController();
  final TextEditingController staffPhoneController = TextEditingController();
  final TextEditingController staffPasswordController = TextEditingController();
  late bool _passwordVisibility;
  final _staffKey = GlobalKey<FormState>();
  final StaffController _staffController = Get.put(StaffController());
  @override
  void initState() {
    _passwordVisibility = false;
    _staffController.getStaff();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "Add Staff",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _staffKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: staffNameController,
                      hintText: "Enter Name",
                      type: TextInputType.text,
                      icon: const Icon(Icons.person),
                    ),
                    CustomTextField(
                      controller: staffPhoneController,
                      hintText: "Enter Phone",
                      type: TextInputType.number,
                      icon: const Icon(Icons.phone),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10, left: 10, right: 10),
                      child: TextFormField(
                        controller: staffPasswordController,
                        keyboardType: TextInputType.text,
                        obscureText: !_passwordVisibility,
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: const Icon(Icons.key_outlined),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _passwordVisibility = !_passwordVisibility;
                              });
                            },
                            icon: Icon(_passwordVisibility
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Enter Password';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => _staffController.isLoading.isTrue
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : CustomButton(
                              text: "Add Staff",
                              onTap: () {
                                if (_staffKey.currentState!.validate()) {
                                  _staffController.addStaff(
                                      staffName: staffNameController.text,
                                      phone: staffPhoneController.text,
                                      password: staffPasswordController.text);
                                }
                              },
                            ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
