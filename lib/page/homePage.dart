import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hefish_finalproject/widget/colorPalette.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Palette.background,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
              child: Row(
                children: [
                  TextButton.icon(     // <-- TextButton
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Palette.black,
                      size: 30,
                    ),
                    label: const Text(
                      "Logout",
                      style: TextStyle(
                        color: Palette.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {

                    },
                    icon: const Icon(Icons.account_circle,
                      size: 40,
                    )
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}