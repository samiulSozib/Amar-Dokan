import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend/consts/app_string.dart';
import 'package:frontend/features/auth/authController.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../common/custom_button.dart';
import '../../common/custom_textfield.dart';
import '../../route.dart';

class AdminRegistrationScreen extends StatefulWidget {
  const AdminRegistrationScreen({super.key});

  @override
  State<AdminRegistrationScreen> createState() =>
      _AdminRegistrationScreenState();
}

class _AdminRegistrationScreenState extends State<AdminRegistrationScreen> {
  final _registrationKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _dokanNameController = TextEditingController();
  final TextEditingController _dokanOwnerNameController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final AuthController _authController = Get.put(AuthController());
  late bool _passwordVisibility;

  @override
  void initState() {
    _passwordVisibility = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 60),
                  child: const Center(
                    child: Text(
                      AppString.appString,
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Create Your Account",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _registrationKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: _dokanNameController,
                            hintText: "Dokan Name",
                            type: TextInputType.text,
                            icon: const Icon(Icons.book_online_outlined),
                          ),
                          CustomTextField(
                            controller: _dokanOwnerNameController,
                            hintText: "Owner Name",
                            type: TextInputType.text,
                            icon: const Icon(Icons.book_online_outlined),
                          ),
                          CustomTextField(
                            controller: _phoneNumberController,
                            hintText: "Phone Number",
                            type: TextInputType.number,
                            icon: const Icon(Icons.phone_android_outlined),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 10, left: 10, right: 10),
                            child: TextFormField(
                              controller: _passwordController,
                              keyboardType: TextInputType.text,
                              obscureText: !_passwordVisibility,
                              decoration: InputDecoration(
                                hintText: "Password",
                                prefixIcon: const Icon(Icons.key_outlined),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisibility =
                                          !_passwordVisibility;
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
                          CustomTextField(
                            controller: _addressController,
                            hintText: "Address",
                            type: TextInputType.text,
                            icon: const Icon(Icons.home_outlined),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Obx(
                            () => _authController.isLoading.isTrue
                                ? const CircularProgressIndicator()
                                : CustomButton(
                                    onTap: () {
                                      if (_registrationKey.currentState!
                                          .validate()) {
                                        _authController.registration(
                                            context: context,
                                            dokanName:
                                                _dokanNameController.text,
                                            ownerName:
                                                _dokanOwnerNameController.text,
                                            phone: _phoneNumberController.text,
                                            password: _passwordController.text,
                                            address: _addressController.text);
                                      }
                                    },
                                    text: "Next",
                                    color: Colors.blueAccent,
                                  ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                text: "Already an user? ",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 18),
                                children: [
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap =
                                          () => Get.toNamed(adminSignInScreen),
                                    text: "Log in",
                                    style: const TextStyle(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
