import 'dart:convert';

import 'package:frontend/consts/app_string.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class CustomerService {
  static var baseURL = AppString.baseURL;

  static Future<bool> addCustomer(
      {required String customerName,
      required String customerPhone,
      required String customerAddress,
      required String token}) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$baseURL/customer/add-customer'),
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
          'x-auth-token': token
        },
        body: jsonEncode(
          {
            "customerName": customerName,
            "customerPhone": customerPhone,
            "customerAddress": customerAddress
          },
        ),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
