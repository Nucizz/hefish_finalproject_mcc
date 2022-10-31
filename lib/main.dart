import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hefish_finalproject/page/loginPage.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Segoe UI',
        ),
      home: const LoginPage()
    );
  }
}
