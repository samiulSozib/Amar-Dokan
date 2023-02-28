import 'package:frontend/features/admin_home/admin_home_screen.dart';
import 'package:frontend/features/auth/registration_screen.dart';
import 'package:frontend/features/auth/signin_screen.dart';
import 'package:frontend/features/staff_home/staff_home_screen.dart';
import 'package:frontend/splash_screen.dart';
import 'package:get/get.dart';

const String splashScreen = '/splash-screen';
const String adminRegistrationScreen = '/admin-registration-screen';
const String adminSignInScreen = '/sign-in-screen';
const String adminHomeScreen = '/admin-home-screen';
const String staffHomeScreen = '/staff-home-screen';

List<GetPage> pages = [
  GetPage(
    name: adminHomeScreen,
    page: () => const AdminHomeScreen(),
  ),
  GetPage(
    name: staffHomeScreen,
    page: () => const StaffHomeScreen(),
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
