import 'package:flutter/material.dart';
import 'package:kabar/view/screen/otp_screen/otp_screen.dart';

import '../../../utill/const colors/const_color.dart';

class ForgetPasswordSubmit extends StatefulWidget {
  const ForgetPasswordSubmit({super.key});

  @override
  State<ForgetPasswordSubmit> createState() => _ForgetPasswordSubmitState();
}

class _ForgetPasswordSubmitState extends State<ForgetPasswordSubmit> {
  bool isChecked = true;
  TextEditingController forgetPassword=TextEditingController();
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
                    MaterialPageRoute(builder: (context) => const OTPScreen()),
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
              "Forgot\nPassword ?",
              style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 32),
            ),
            Text(
              "Don’t worry! it happens. Please select the\nemail or number associated with your\naccount.",
              style: kTextStyle.copyWith(
                color: kSubTitleColor,
              ),
            ),

const SizedBox(height: 20,),
            SizedBox(
              height: 48,
              child: TextFormField(
                controller: forgetPassword,
                keyboardType: TextInputType.name,
                decoration: kInputDecoration.copyWith(
                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  label: const Text("Email ID / Mobile number"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
