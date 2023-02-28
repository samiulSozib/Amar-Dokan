import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthHelper {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController _controller = TextEditingController();
  phoneAUth(number, context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      // ignore: prefer_interpolation_to_compose_strings
      phoneNumber: '+88' + number,
      verificationCompleted: (PhoneAuthCredential credential) async {
        UserCredential _user = await auth.signInWithCredential(credential);
        print(_user);
        //_user!.uid.isNotEmpty
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          //print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text("Enter Your OTP"),
                content: Column(
                  children: [
                    TextField(
                      controller: _controller,
                    ),
                    TextButton(
                        onPressed: () async {
                          PhoneAuthCredential _phoneAuthCredential =
                              PhoneAuthProvider.credential(
                                  verificationId: verificationId,
                                  smsCode: _controller.text);
                          UserCredential _user = await auth
                              .signInWithCredential(_phoneAuthCredential);
                          print(_user);
                        },
                        child: Text("Submit"))
                  ],
                ),
              );
            });
      },
      timeout: Duration(seconds: 60),
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
