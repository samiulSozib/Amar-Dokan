import 'package:frontend/features/auth/registration_screen.dart';
import 'package:frontend/features/auth/signin_screen.dart';
import 'package:frontend/features/home/pages/customer_list/customer_transaction_history.dart';
import 'package:frontend/features/home/pages/home_screen.dart';

import 'package:frontend/splash_screen.dart';
import 'package:get/get.dart';

const String splashScreen = '/splash-screen';
const String adminRegistrationScreen = '/admin-registration-screen';
const String adminSignInScreen = '/sign-in-screen';

const String homeScreen = '/home-screen';
const String customerTransectionHistory = '/customer-transaction-history';

List<GetPage> pages = [
  GetPage(
    name: customerTransectionHistory,
    page: () {
      CustomerTransactionHostory _customerTransactionHostory = Get.arguments;
      return _customerTransactionHostory;
    },
  ),
  GetPage(
    name: homeScreen,
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: adminSignInScreen,
    page: () => const SignInScreen(),
  ),
  GetPage(
    name: splashScreen,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: adminRegistrationScreen,
    page: () => const AdminRegistrationScreen(),
  ),
];
