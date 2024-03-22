import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../utill/const colors/const_color.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  TextEditingController commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Comments",
          style: kTextStyle.copyWith(
            color: kTitleColor,
            fontSize: 16,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Center(child: Text("No Comment")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 48,
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: TextFormField(
                    controller: commentController,
                    keyboardType: TextInputType.name,
                    decoration: kInputDecoration.copyWith(
                        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        hintText: "Type your comment",
                        hintStyle: kTextStyle.copyWith(color: kButtonTextColor)),
                  ),
                ),
                Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: kPrimaryColor, borderRadius: BorderRadius.circular(6),
                    ),
                    child: Image.asset(
                      "assets/icon/send_icon.png",
                      width: 20,
                      height: 20,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
