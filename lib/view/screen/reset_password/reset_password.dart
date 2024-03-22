import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:kabar/view/screen/congratulation_screen/congratulation_screen.dart';
import 'package:kabar/view/screen/otp_screen/otp_screen.dart';

import '../../../utill/const colors/const_color.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  TextEditingController newPassword=TextEditingController();
  TextEditingController confirmPassword=TextEditingController();
  bool obscureNewPassword = true;
  bool obscureConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: Container(
        decoration: kContainerDecoration,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
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
                    MaterialPageRoute(builder: (context) => const CongratulationScreen()),
                  );

                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Submit",
                      style: kTextStyle.copyWith(color: kWhiteColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Reset\nPassword ?",
              style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 32),
            ),

            const SizedBox(height: 20,),
            SizedBox(
              height: 48,
              child: TextFormField(
                controller: newPassword,
                keyboardType: TextInputType.name,
                obscureText: obscureNewPassword,
                decoration: kInputDecoration.copyWith(
                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  label: const Text("New Password"),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      // Toggle the visibility of the password
                      setState(() {
                        obscureNewPassword = !obscureNewPassword;
                      });
                    },
                    child: Icon(
                      obscureNewPassword ? BootstrapIcons.eye : BootstrapIcons.eye_slash, // Change icons based on the state
                      color: obscureNewPassword ? kTextFieldBorderColor : kTextFieldBorderColor,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: 48,
              child: TextFormField(
                controller: confirmPassword,
                keyboardType: TextInputType.name,
                obscureText: obscureConfirmPassword,
                decoration: kInputDecoration.copyWith(
                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  label: const Text("Confirm new password"),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      // Toggle the visibility of the password
                      setState(() {
                        obscureConfirmPassword = !obscureConfirmPassword;
                      });
                    },
                    child: Icon(
                      obscureConfirmPassword ? BootstrapIcons.eye : BootstrapIcons.eye_slash, // Change icons based on the state
                      color: obscureConfirmPassword ? kTextFieldBorderColor : kTextFieldBorderColor,
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
