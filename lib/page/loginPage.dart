import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hefish_finalproject/page/homePage.dart';
import 'package:hefish_finalproject/page/registerPage.dart';
import 'package:hefish_finalproject/widget/colorPalette.dart';
import 'package:hefish_finalproject/widget/customTextField.dart';

import '../widget/animatedPageRoute.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController unameCtrl = TextEditingController();
  TextEditingController pwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Palette.background,
        body: Container(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset("assets/images/HEfish logo no-text.png", height: 150, fit: BoxFit.fitHeight),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Palette.accent,
                    fontSize: 40
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Sign in to continue.",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Palette.black,
                    fontSize: 20
                  ),
                ),
              ),
              Column(
                children: [
                  CustomTextField(
                    controller: unameCtrl,
                    top: 25,
                    hintText: "Username",
                    keyboardType: TextInputType.emailAddress,
                    suffixIcon: Icons.person,
                  ),
                  CustomTextField(
                    controller: pwordCtrl,
                    top: 25,
                    hintText: "Password",
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: Icons.visibility,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Material(
                          textStyle: const TextStyle(
                            color: Palette.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            backgroundColor: Color.fromARGB(255, 232, 239, 239)
                          ),
                          child: InkWell(
                            child: const Text("Password Recovery"),
                            onTap: () {
                              Navigator.of(context).push(AnimatedPageRoute(child: const HomePage()));
                            },
                          )
                        )
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Palette.accent,
                              blurRadius: 15,
                              spreadRadius: 0,
                              offset: Offset(
                                0.0,
                                0.0,
                              ),
                            ),
                          ]
                        ),
                        child: TextButton(
                          onPressed: () {
                            RegExp pwordReg = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[-_!@#\$&*~]).{8,}$');
                            String errorMsg = "Login Success";
                            Color snackBG;
                            if(unameCtrl.text.isEmpty || pwordCtrl.text.isEmpty){
                               errorMsg = "Please fill in your credentials!";
                               snackBG = Palette.error;
                            }
                            else if(unameCtrl.text.length < 4 || pwordCtrl.text.length < 8 || !pwordReg.hasMatch(pwordCtrl.text)){
                              errorMsg = "Please insert a valid credentials!";
                              snackBG = Palette.error;
                            }
                            else{
                              if(1 < 4){
                                Navigator.of(context).push(AnimatedPageRoute(child: const HomePage()));
                                snackBG = Palette.success;
                              }
                              else{
                                errorMsg = "Credentials doesn't belong to any account!";
                                snackBG = Palette.error;
                              }
                            }
                            final message = SnackBar(
                              content: Text(errorMsg),
                              backgroundColor: snackBG,
                              );
                            ScaffoldMessenger.of(context).showSnackBar(message);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Palette.accent),
                            foregroundColor: MaterialStateProperty.all<Color>(Palette.white),
                            textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            )),
                            shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                          ),
                          child: const Text("Login")
                        )
                      )
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      children: const [
                        Expanded(child: Divider(color: Palette.grey, thickness: 1,)),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Or continue with",
                              style: TextStyle(
                                color: Palette.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        ),
                        Expanded(child: Divider(color: Palette.grey, thickness: 1,)),
                      ],
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: SizedBox(
                      width: 45,
                      height: 45,
                      child: FloatingActionButton(
                        elevation: 2,
                        backgroundColor: Palette.white,
                        onPressed: () {
                          
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Image.asset("assets/images/Google logo.png", fit: BoxFit.fitHeight),
                        )
                      )
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Dont have an account? ",
                          style: TextStyle(
                            fontSize: 12,
                            color: Palette.black
                          )
                        ),
                        InkWell(
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 12,
                              color: Palette.link
                            )
                          ),
                          onTap: () {
                            Navigator.of(context).push(AnimatedPageRoute(child: const RegisterPage()));
                          },
                        )
                      ],
                    )
                  )
                ],
              )
            ]
          )
        ),
      )
    );
  }
}