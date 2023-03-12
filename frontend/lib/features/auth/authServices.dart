import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/consts/app_string.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../route.dart';

class AuthServices {
  static var client = http.Client();

  //static var baseURL = 'http://amar-dokan.myallproject.xyz/api';
  //static var baseURL = 'http://192.168.43.68:2000/api';
  static var baseURL = AppString.baseURL;
  static var token = "";

  static Future<String> registration(
      {required BuildContext context,
      required String dokanName,
      required String ownerName,
      required String phone,
      required String password,
      required String address}) async {
    String result = "";

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
        print(response.statusCode);
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
        print(response.statusCode);
        if (response.statusCode == 200) {
          token = jsonDecode(response.body)['token'];
          //print(token);
          return token.toString();
        } else {
          return token.toString();
        }
      }
    } catch (e) {
      return token.toString();
    }
  }

  static Future<Map> getUser({required String token}) async {
    Map<String, dynamic> user = {};
    try {
      http.Response response = await http.get(
        Uri.parse('$baseURL/auth/dokanAdmin'),
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
          'x-auth-token': token
        },
      );

      //print(response.statusCode);

      if (response.statusCode == 200) {
        GetStorage().write("user", jsonDecode(response.body));
        //print(jsonDecode(response.body)['type']);
        user = {
          'type': jsonDecode(response.body)['type'],
          'info': jsonDecode(response.body)['info']
        };
        return user;
      } else {
        return user;
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: 'Smoething wrongggg');
      return user;
    }
  }
}
