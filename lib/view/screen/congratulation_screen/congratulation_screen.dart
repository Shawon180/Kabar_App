import 'package:flutter/material.dart';
import 'package:kabar/utill/const%20colors/const_color.dart';

import '../select_country/select_country.dart';
import '../topics_screen/topics_screen.dart';
class CongratulationScreen extends StatefulWidget {

  const CongratulationScreen({super.key});

  @override
  State<CongratulationScreen> createState() => _CongratulationScreenState();
}

class _CongratulationScreenState extends State<CongratulationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child:Center(child: Image.asset("assets/icon/app_icon.png",width: 217,height: 66,fit: BoxFit.cover,)) ,
          ),
          const SizedBox(height: 20,),
          Text("Congratulations!",style: kTextStyle.copyWith(color: kSubTitleColor,fontWeight: FontWeight.bold,fontSize: 26),),
          Text("Your account is ready to use",style: kTextStyle.copyWith(color: kSubTitleColor,),)

        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
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
                  MaterialPageRoute(builder: (context) => const TopicScreen()),
                );

              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Go to Homepage",
                    style: kTextStyle.copyWith(color: kWhiteColor, fontWeight: FontWeight.bold),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
