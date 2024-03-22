import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utill/const colors/const_color.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool switchValue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Settings",
          style: kTextStyle.copyWith(
            color: kTitleColor,
            fontSize: 16,
          ),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Image.asset("assets/icon/notification_icon.png",width: 24,height: 24,),
            title:  Text("Notification",style: kTextStyle.copyWith(color: kTitleColor),),
            trailing: const Icon(Icons.arrow_forward_ios_rounded,size: 14,color: kSubTitleColor,),
          ),

          ListTile(
            leading: Image.asset("assets/icon/security_icon.png",width: 24,height: 24,),
            title:  Text("Security",style: kTextStyle.copyWith(color: kTitleColor),),
            trailing: const Icon(Icons.arrow_forward_ios_rounded,size: 14,color: kSubTitleColor,),
          ),

          ListTile(
            leading: Image.asset("assets/icon/help_icon.png",width: 24,height: 24,),
            title:  Text("Help",style: kTextStyle.copyWith(color: kTitleColor),),
            trailing: const Icon(Icons.arrow_forward_ios_rounded,size: 14,color: kSubTitleColor,),
          ),

          ListTile(
            leading: Image.asset("assets/icon/dark_mode.png",width: 24,height: 24,),
            title:  Text("Dark Mode",style: kTextStyle.copyWith(color: kTitleColor),),
            trailing: Transform.scale(
              alignment: FractionalOffset.centerRight,
              scale: 0.60,
              child: CupertinoSwitch(
                // This bool value toggles the switch.
                value: switchValue,

                activeColor: kPrimaryColor,
                onChanged: (bool? value) {
                  // This is called when the user toggles the switch.
                  setState(() {
                    switchValue = value ?? false;
                  });
                },
              ),
            ),
          ),

          ListTile(
            leading: Image.asset("assets/icon/logout_icon.png",width: 24,height: 24,),
            title:  Text("Logout",style: kTextStyle.copyWith(color: kTitleColor),),
          ),
        ],
      ),
    );
  }
}
