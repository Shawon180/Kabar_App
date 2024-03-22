import 'package:flutter/material.dart';
import 'package:kabar/view/screen/forget_password/forget_password_submit.dart';

import '../../../utill/const colors/const_color.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: Container(
        decoration: kContainerDecoration,
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                    MaterialPageRoute(builder: (context) => const ForgetPasswordSubmit()),
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
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
            Container(
              decoration: kContainerDecoration,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: kContainerDecoration.copyWith(color: kPrimaryColor),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image.asset(
                              "assets/icon/message_icon.png",
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "via Email:",
                              style: kTextStyle.copyWith(color: kButtonTextColor),
                            ),
                            Text(
                              "example@youremail.com",
                              style: kTextStyle.copyWith(color: kTitleColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            isChecked = !isChecked;
                          });
                        },
                        child: isChecked == true
                            ? const Icon(
                                Icons.check_circle,
                                color: kPrimaryColor,
                                size: 30,
                              )
                            : const Icon(
                                Icons.circle_outlined,
                                color: kButtonTextColor,
                                size: 30,
                              )),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: kContainerDecoration,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: kContainerDecoration.copyWith(color: kPrimaryColor),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image.asset(
                              "assets/icon/phone_message.png",
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "via Email:",
                              style: kTextStyle.copyWith(color: kButtonTextColor),
                            ),
                            Text(
                              "+62-8421-4512-2531",
                              style: kTextStyle.copyWith(color: kTitleColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            isChecked = !isChecked;
                          });
                        },
                        child: isChecked == true
                            ? const Icon(
                                Icons.check_circle,
                                color: kPrimaryColor,
                                size: 30,
                              )
                            : const Icon(
                                Icons.circle_outlined,
                                color: kButtonTextColor,
                                size: 30,
                              )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
