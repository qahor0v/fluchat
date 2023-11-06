import 'package:flutter/material.dart';

class MyPage3 extends StatefulWidget {
  const MyPage3({Key? key}) : super(key: key);

  @override
  State<MyPage3> createState() => _MyPage3State();
}

class _MyPage3State extends State<MyPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Flutter"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {},
          child: Text("tap me"),
        ),
      ),
    );
  }
}