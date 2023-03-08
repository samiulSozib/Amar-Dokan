import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/model/customer.dart';
import 'package:http/retry.dart';

import '../../../../consts/app_string.dart';
import 'package:http/http.dart' as http;

class CustomerListServices {
  static var baseURL = AppString.baseURL;

  static Future<List<Customer>> getCustomers({required String token}) async {
    List<Customer> customers = [];

    try {
      http.Response res = await http.get(
        Uri.parse('$baseURL/customer'),
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
          'x-auth-token': token
        },
      );
      print(res.body);
      var list = jsonDecode(res.body) as List;
      customers =
          list.map((customerJson) => Customer.fromJson(customerJson)).toList();
      //customers=Customer.fromJson(list)
    } catch (e) {
      Fluttertoast.showToast(msg: "Failed");
      print(e);
    }
    return customers;
  }
}
