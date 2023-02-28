import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/features/auth/authServices.dart';
import 'package:frontend/route.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  final box = GetStorage();

  Future<void> registration(
      {required BuildContext context,
      required String dokanName,
      required String ownerName,
      required String phone,
      required String password,
      required String address}) async {
    try {
      isLoading(true);
      String registrationResponse = await AuthServices.registration(
          context: context,
          dokanName: dokanName,
          ownerName: ownerName,
          phone: phone,
          password: password,
          address: address);
      //print(registrationResponse);
      if (registrationResponse != "") {
        isLoading(false);
        Fluttertoast.showToast(msg: "Account Create Success");
        Get.toNamed(adminSignInScreen);
      } else {
        isLoading(false);
        Fluttertoast.showToast(msg: "Account Create Fail");
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> signin(
      {required BuildContext context,
      required String phone,
      required String password,
      required String type}) async {
    try {
      isLoading(true);
      String token = await AuthServices.signIn(
          context: context, phone: phone, password: password, type: type);
      if (token != "") {
        if (type == "admin") {
          isLoading(false);
          box.write("token", token);
          Fluttertoast.showToast(msg: "Login Success");
          Get.toNamed(adminHomeScreen);
        } else {
          isLoading(false);
          box.write("token", token);
          Fluttertoast.showToast(msg: "Login Success");
          Get.toNamed(staffHomeScreen);
        }
      }
      isLoading(false);
    } finally {
      isLoading(false);
    }
  }
}
