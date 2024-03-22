import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kabar/view/screen/reset_password/reset_password.dart';
import 'package:pinput/pinput.dart';
import '../../../utill/const colors/const_color.dart';
class OTPScreen extends StatefulWidget {

  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  int _secondsRemaining = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer!.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "OTP Verification",
            style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 32),
            textAlign: TextAlign.center,
          ),
          Text(
            "Enter the OTP sent to +67-1234-5678-9",
            style: kTextStyle.copyWith(
              color: kSubTitleColor,
            ),textAlign: TextAlign.center,
          ),

          const SizedBox(height: 20,),

          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Pinput(
              length: 4,
              focusedPinTheme: PinTheme(
                  height: 55,
                  width: 55,
                  textStyle: const TextStyle(
                      fontSize: 20,
                      color: kTitleColor,
                      fontWeight: FontWeight.w600),
                  decoration: BoxDecoration(
                    color: kError.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: kError),
                  )),
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              defaultPinTheme: PinTheme(
                  height: 55,
                  width: 55,
                  textStyle: const TextStyle(
                      fontSize: 20,
                      color: kTitleColor,
                      fontWeight: FontWeight.w600),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color:
                        const Color.fromRGBO(234, 239, 243, 1)),
                  )),
            ),
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Resend code in ',
                style: kTextStyle.copyWith(color: kSubTitleColor),
              ),
              Text(
                '$_secondsRemaining s',
                style: kTextStyle.copyWith(color: kError,),
              ),
            ],
          ),
        ],
      ),
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
                    MaterialPageRoute(builder: (context) => const ResetPassword()),
                  );

                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Verify",
                      style: kTextStyle.copyWith(color: kWhiteColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
