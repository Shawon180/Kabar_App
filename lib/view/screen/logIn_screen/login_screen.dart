import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:kabar/utill/const%20colors/const_color.dart';
import 'package:kabar/view/screen/forget_password/forget_password.dart';

import '../navbar_screen.dart';
import '../signup_screen/signup_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25.0, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 48),
                  ),
                  Text(
                    "Again!",
                    style: kTextStyle.copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 48),
                  ),
                  Text(
                    "Welcome back you’ve\nbeen missed",
                    style: kTextStyle.copyWith(
                      color: kSubTitleColor,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 48,
                    child: TextFormField(
                      controller: userNameController,
                      keyboardType: TextInputType.name,
                      decoration: kInputDecoration.copyWith(
                        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        label: const Text("Username"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 48,
                    child: TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.name,
                      obscureText: obscurePassword,
                      decoration: kInputDecoration.copyWith(
                        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        label: const Text("Password"),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            // Toggle the visibility of the password
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },
                          child: Icon(
                            obscurePassword ? BootstrapIcons.eye : BootstrapIcons.eye_slash, // Change icons based on the state
                            color: obscurePassword ? kTextFieldBorderColor : kTextFieldBorderColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Checkbox(
                        value: isChecked,
                        checkColor: kWhiteColor,
                        activeColor: kPrimaryColor,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                    ),
                    Text("Remember me ", style: kTextStyle.copyWith(color: kSubTitleColor)),
                  ],
                ),
                TextButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ForgetPassword()),
                    );
                  },
                  child: Text(
                    "Forgot the password ?",
                    style: kTextStyle.copyWith(
                      color: const Color(0xff5890FF),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            )),
                        onPressed: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const NavHomeScreen()),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Login",
                              style: kTextStyle.copyWith(color: kWhiteColor, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "or continue with",
                    style: kTextStyle.copyWith(color: kSubTitleColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2.4,
                        decoration: kContainerDecoration,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icon/facebook_icon.png',
                                height: 21,
                                width: 21,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Facebook",
                                style: kTextStyle.copyWith(color: kButtonTextColor, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2.4,
                        decoration: kContainerDecoration,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icon/google_icon.png',
                                height: 21,
                                width: 21,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Google",
                                style: kTextStyle.copyWith(color: kButtonTextColor, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account?",
                        style: kTextStyle.copyWith(color: kSubTitleColor),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const SignUpScreen()),
                            );
                          },
                          child: Text(
                            "Sign up",
                            style: kTextStyle.copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold),
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
