import 'dart:async';
import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/model/customer.dart';
import 'package:http/retry.dart';

import '../../../../consts/app_string.dart';
import 'package:http/http.dart' as http;

import '../../../../model/transaction.dart';

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
      //print(res.body);
      var list = jsonDecode(res.body) as List;
      customers =
          list.map((customerJson) => Customer.fromJson(customerJson)).toList();
      //customers=Customer.fromJson(list)
    } catch (e) {
      Fluttertoast.showToast(msg: "Failed");
      print(e.toString());
    }
    return customers;
  }

  static Future<bool> createTransaction(
      {required String token,
      required int dokanId,
      required int customerId,
      required double transactionAmount,
      required String notes,
      required String type}) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$baseURL/transaction/create'),
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
          'x-auth-token': token
        },
        body: jsonEncode(
          {
            "dokanId": dokanId,
            "customerId": customerId,
            "transactionAmount": transactionAmount,
            "notes": notes,
            "type": type
          },
        ),
      );

      if (res.statusCode == 200) {
        return true;
      } else {
        return true;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Failed");
      print(e);
      return false;
    }
  }

  static Future<List<TransactionElement>> getTransection(
      {required int dokanId,
      required int customerId,
      required String token}) async {
    List<TransactionElement> transactions = [];
    try {
      http.Response res = await http.get(
        Uri.parse('$baseURL/transaction/history/$dokanId/$customerId'),
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
          'x-auth-token': token
        },
      );

      if (res.statusCode == 200) {
        var list = jsonDecode(res.body)['transactions'] as List;
        transactions = list
            .map((transactionJson) =>
                TransactionElement.fromJson(transactionJson))
            .toList();
      }
      return transactions;
    } catch (e) {
      Fluttertoast.showToast(msg: "Failed");
      print("fdfd" + e.toString());
    }
    //print(result);
    return transactions;
  }
}
