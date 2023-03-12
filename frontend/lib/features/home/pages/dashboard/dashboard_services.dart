import 'dart:convert';

import 'package:frontend/consts/app_string.dart';
import 'package:frontend/model/unpaidTransaction.dart';
import 'package:http/http.dart' as http;

class DashBoardServices {
  static var baseURL = AppString.baseURL;

  static Future<List<Unpaid>> getUnpaidCustomerAndAmount(
      {required String token}) async {
    List<Unpaid> unpaid = [];
    try {
      http.Response res = await http.get(
        Uri.parse('$baseURL/transaction/all-unpaid'),
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
          'x-auth-token': token
        },
      );
      if (res.statusCode == 200) {
        var list = jsonDecode(res.body)['unpaid'] as List;
        unpaid = list.map((unpaidJson) => Unpaid.fromJson(unpaidJson)).toList();
      }
    } catch (e) {
      print(e);
    }
    return unpaid;
  }

  static Future<List<Month>> getUnpaidHistoryByMonth(
      {required String token}) async {
    List<Month> unpaidByMonth = [];
    try {
      http.Response res = await http.get(
        Uri.parse('$baseURL/transaction/all-unpaid'),
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
          'x-auth-token': token
        },
      );
      if (res.statusCode == 200) {
        var list = jsonDecode(res.body)['months'] as List;
        unpaidByMonth =
            list.map((unpaidJson) => Month.fromJson(unpaidJson)).toList();
      }
    } catch (e) {
      print(e);
    }
    return unpaidByMonth;
  }
}
