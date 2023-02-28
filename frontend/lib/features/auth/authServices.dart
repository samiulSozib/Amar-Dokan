import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  static var client = http.Client();
  static var baseURL = 'http://amar-dokan.myallproject.xyz/api';
  static String result = "";
  static String? token;
  static Future<String> registration(
      {required BuildContext context,
      required String dokanName,
      required String ownerName,
      required String phone,
      required String password,
      required String address}) async {
    try {
      // var response = await client.post(
      //     Uri.parse('$baseURL/auth/dokanAdmin/register'),
      //     headers: {'Content-type': 'application/json; charset=UTF-8'},
      //     body: jsonEncode({dokanName, ownerName, phone, password, address}));
      http.Response response = await http.post(
        Uri.parse('$baseURL/auth/dokanAdmin/register'),
        headers: {'Content-type': 'application/json; charset=UTF-8'},
        body: jsonEncode(
          {
            "dokanName": dokanName,
            "ownerName": ownerName,
            "phone": phone,
            "password": password,
            "address": address
          },
        ),
      );

      if (response.statusCode == 200) {
        result = "success";
        return result;
      } else {
        return result;
      }
    } catch (e) {
      return result;
    }
  }

  static Future<String> signIn(
      {required BuildContext context,
      required String phone,
      required String password,
      required String type}) async {
    try {
      if (type == "admin") {
        http.Response response = await http.post(
          Uri.parse('$baseURL/auth/dokanAdmin/signin'),
          headers: {'Content-type': 'application/json; charset=UTF-8'},
          body: jsonEncode(
            {
              "phone": phone,
              "password": password,
            },
          ),
        );
        if (response.statusCode == 200) {
          token = jsonDecode(response.body)['token'];
          return token.toString();
        } else {
          return token.toString();
        }
      } else {
        http.Response response = await http.post(
          Uri.parse('$baseURL/auth/dokanStaff/signin'),
          headers: {'Content-type': 'application/json; charset=UTF-8'},
          body: jsonEncode(
            {
              "phone": phone,
              "password": password,
            },
          ),
        );
        if (response.statusCode == 200) {
          token = jsonDecode(response.body)['token'];
          return token.toString();
        } else {
          return token.toString();
        }
      }
    } catch (e) {
      return token.toString();
    }
  }
}
