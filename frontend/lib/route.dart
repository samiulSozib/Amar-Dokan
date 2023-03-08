import 'package:frontend/features/auth/registration_screen.dart';
import 'package:frontend/features/auth/signin_screen.dart';
import 'package:frontend/features/home/pages/home_screen.dart';

import 'package:frontend/splash_screen.dart';
import 'package:get/get.dart';

const String splashScreen = '/splash-screen';
const String adminRegistrationScreen = '/admin-registration-screen';
const String adminSignInScreen = '/sign-in-screen';

const String homeScreen = '/home-screen';

List<GetPage> pages = [
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
