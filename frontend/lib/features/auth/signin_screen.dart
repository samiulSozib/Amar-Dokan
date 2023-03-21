import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:frontend/features/auth/authController.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../common/custom_button.dart';
import '../../common/custom_textfield.dart';
import '../../consts/app_string.dart';
import '../../route.dart';

enum AuthType {
  admin,
  staff,
}

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  AuthType _authType = AuthType.admin;

  final _signinKey = GlobalKey<FormState>();

  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                  "Log In",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: _signinKey,
                  child: Column(
                    children: [
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
                        height: 10,
                      ),
                      Row(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio(
                            value: AuthType.admin,
                            groupValue: _authType,
                            onChanged: (AuthType? val) {
                              setState(() {
                                _authType = val!;
                              });
                            },
                          ),
                          const Text(
                            "Admin",
                            style: TextStyle(fontSize: 16, color: Colors.green),
                          ),
                          Radio(
                            value: AuthType.staff,
                            groupValue: _authType,
                            onChanged: (AuthType? val) {
                              setState(() {
                                _authType = val!;
                              });
                            },
                          ),
                          const Text(
                            "Staff",
                            style: TextStyle(fontSize: 16, color: Colors.green),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Obx(
                        () => _authController.isLoading.isTrue
                            ? const CircularProgressIndicator()
                            : CustomButton(
                                onTap: () {
                                  if (_signinKey.currentState!.validate()) {
                                    _authController.signin(
                                        context: context,
                                        phone: _phoneNumberController.text,
                                        password: _passwordController.text,
                                        type: _authType.name);
                                  }
                                },
                                text: "Sign In",
                                color: Colors.blueAccent,
                              ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: "New user? ",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 18),
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () =>
                                      Get.toNamed(adminRegistrationScreen),
                                text: "Register",
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
