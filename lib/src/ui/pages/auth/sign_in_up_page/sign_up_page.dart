// ignore_for_file: use_build_context_synchronously

import 'package:fluchat/src/services/auth_services/auth_services.dart';
import 'package:fluchat/src/ui/pages/auth/sign_in_up_page/sign_in_page.dart';
import 'package:fluchat/src/ui/pages/homa.dart';
 import 'package:flutter/material.dart';


class SignUpPage extends StatefulWidget {
  static const String id = "sign_up_page";

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscureText = true;
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final AuthServices services = AuthServices();

  void signUP() async {
    // if (password.text.trim() != confirmPassword.text.trim()) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text(
    //         "Parolni to'g'ri tasdiqlang!",
    //       ),
    //     ),
    //   );
    // } else {
    if (email.text.trim().contains("@")) {
      showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
      final result = await services.signUp(
        email.text.trim(),
        password.text.trim(),
      );
      Navigator.pop(context);
      if (result) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const Home(),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              icon: Icon(
                Icons.error_outline_outlined,
                color: Colors.red,
              ),
              title: Text("Xatolik!"),
              content: Text("Email yoki parol xato terilgan!"),
            );
          },
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Email noto'g'ri formatda kiritildi!",
          ),
        ),
      );
    }
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, SignInPage.id);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff0F1828),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 169, left: 40, right: 40),
              child: Text(
                "Enter Your Username, Email and Password",
                style: TextStyle(
                  fontFamily: 'mulish',
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48, left: 24, right: 24),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                height: 44,
                width: 327,
                decoration: const BoxDecoration(
                  color: Color(0xffF7F7FC),
                ),
                child: const TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Username',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: 'mulish',
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18, left: 24, right: 24),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                height: 44,
                width: 327,
                decoration: const BoxDecoration(
                  color: Color(0xffF7F7FC),
                ),
                child: TextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Email',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: 'mulish',
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 24, right: 24),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                height: 44,
                width: 327,
                decoration: const BoxDecoration(
                  color: Color(0xffF7F7FC),
                ),
                child: TextField(
                  controller: password,
                  obscuringCharacter: "*",
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black87),
                      onPressed: _toggle,
                    ),
                    border: InputBorder.none,
                    hintText: 'Enter Password',
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'mulish',
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                signUP();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 32),
                child: Container(
                  height: 52,
                  width: 327,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xff002DE3),
                  ),
                  child: const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color(0xffF7F7FC),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
