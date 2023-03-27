// ignore_for_file: prefer_const_constructors

import 'package:fitness_admin_project/ui/views/admin_login_penel.dart';
import 'package:fitness_admin_project/ui/views/deshbord_screen.dart';
import 'package:get/get.dart';

const String adminLogin = '/adminLogin-screen';
const String dashBord = '/dashBord-screen';

List<GetPage> getPages = [
  GetPage(
    name: adminLogin,
    page: () => AdminLoginPage(),
  ),
  GetPage(
    name: dashBord,
    page: () => DashboardScreen(),
  ),
];
