import 'package:flutter/material.dart';

import '../../../../utill/const colors/const_color.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isFollowing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.more_vert,
              color: kSubTitleColor,
            ),
          )
        ],
        title: Text(
          "Notification",
          style: kTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold, color: kTitleColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Today, April 22",
                style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
              ),
              ListView.builder(
                itemCount: 3,
                padding: const EdgeInsets.only(top: 10),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Card(
                      elevation: 0,
                      color: kButtonColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage('assets/icon/bbc_NewsAuthor.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(text: 'BBC News', style: kTextStyle.copyWith(fontWeight: FontWeight.bold, color: kTitleColor)),
                                        TextSpan(
                                            text: ' has posted new europe news “Ukraine\'s President Zele...!', style: kTextStyle.copyWith(color: kTitleColor)),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "14m ago",
                                    style: kTextStyle.copyWith(
                                      color: kSubTitleColor,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              Text(
                "Yesterday, April 21",
                style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
              ),
              ListView.builder(
                itemCount: 3,
                padding: const EdgeInsets.only(top: 10),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Card(
                      elevation: 0,
                      color: kButtonColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage('assets/icon/bbc_NewsAuthor.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(text: 'BBC News', style: kTextStyle.copyWith(fontWeight: FontWeight.bold, color: kTitleColor)),
                                        TextSpan(
                                            text: ' has posted new europe news “Ukraine\'s President Zele...!', style: kTextStyle.copyWith(color: kTitleColor)),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "14m ago",
                                    style: kTextStyle.copyWith(
                                      color: kSubTitleColor,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              Card(
                elevation: 0,
                color: kButtonColor,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/image/man.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(text: 'Omar Merditz ', style: kTextStyle.copyWith(fontWeight: FontWeight.bold, color: kTitleColor)),
                                  TextSpan(text: 'is now following you', style: kTextStyle.copyWith(color: kTitleColor)),
                                ],
                              ),
                            ),
                            Text(
                              "1 day ago",
                              style: kTextStyle.copyWith(
                                color: kSubTitleColor,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isFollowing = !isFollowing;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: isFollowing == true ? kPrimaryColor : kWhiteColor,
                              borderRadius: BorderRadius.circular(6.0),
                              border: Border.all(color: kPrimaryColor)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                isFollowing == true
                                    ? Text(
                                        "Following",
                                        style: kTextStyle.copyWith(
                                          color: kWhiteColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      )
                                    : Row(
                                        children: [
                                          const Icon(
                                            Icons.add,
                                            color: kPrimaryColor,
                                            size: 20,
                                          ),
                                          Text(
                                            "Follow",
                                            style: kTextStyle.copyWith(
                                              color: kPrimaryColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
