import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/consts/app_string.dart';
import 'package:frontend/route.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

import '../../../../model/dokanStaff.dart';

class StaffController extends GetxController {
  static var baseURL = AppString.baseURL;
  final box = GetStorage();
  var staffList = <AllStaff>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    getStaff();
    super.onInit();
  }

  Future<void> addStaff(
      {required String staffName,
      required String phone,
      required String password}) async {
    try {
      isLoading(true);
      http.Response res = await http.post(
        Uri.parse('$baseURL/manage/dokan-staff/add'),
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
          'x-auth-token': box.read("token")
        },
        body: jsonEncode(
          {"staffName": staffName, "phone": phone, "password": password},
        ),
      );
      //print(jsonDecode(res.body)['msg']);
      if (res.statusCode == 200) {
        isLoading(false);
        Fluttertoast.showToast(msg: jsonDecode(res.body)['msg']);
        Get.toNamed(staffScreen);
      } else {
        isLoading(false);
        Fluttertoast.showToast(msg: jsonDecode(res.body)['msg']);
      }
    } catch (e) {
      isLoading(false);
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future<void> getStaff() async {
    try {
      http.Response res = await http.get(
        Uri.parse('$baseURL/manage/dokan-staff'),
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
          'x-auth-token': box.read('token')
        },
      );
      var data = jsonDecode(res.body)['allStaff'] as List;
      staffList.value =
          data.map((staffJSON) => AllStaff.fromJson(staffJSON)).toList();
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
