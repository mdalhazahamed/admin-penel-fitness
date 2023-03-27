// ignore_for_file: prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_admin_project/ui/route/route.dart';
import 'package:fitness_admin_project/ui/views/deshbord_screen.dart';
import 'package:fitness_admin_project/ui/widgets/customeButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_text.dart';
import '../widgets/custome_form_field.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  String email = "";
  String uid = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDADADA),
      body: Form(
        key: _formkey,
        autovalidateMode: AutovalidateMode.always,
        child: Center(
          child: Container(
            height: 400,
            width: 400,
            color: Color(0xFFFCFCFC),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          AssetImage("assets/images/admin_img.webp"),
                    ),
                  ),
                  SizedBox(height: 10),
                  CustomText("Email"),
                  customFormField(
                      TextInputType.text, _emailController, context, "Email",
                      (val) {
                    if (val!.isEmpty) {
                      return ("Please Enter Your Email");
                    }
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(val)) {
                      return ("Please Enter a valid email");
                    }
                    return null;
                  }),
                  CustomText("Password"),
                  customFormField(TextInputType.text, _passwordController,
                      context, "Passowrd", (val) {
                    if (val!.isEmpty) {
                      return ("Password is required for login");
                    }
                  }),
                  SizedBox(
                    height: 10,
                  ),
                  customeButton("Login", () async {
                    // if (_formkey.currentState!.validate()) {
                    //   String userEmail = _emailController.text.trim();
                    //   final QuerySnapshot snap = await FirebaseFirestore
                    //       .instance
                    //       .collection("practice")
                    //       .where('email', isEqualTo: userEmail)
                    //       .where("password", isEqualTo: password.toString())
                    //       .get();
                    //   setState(() {
                    //     email = userEmail;
                    //     uid = snap.docs[0]["uid"];
                    //     password = snap.docs[0]["password"];
                    //   });
                    Get.toNamed(dashBord);
                    // }
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
