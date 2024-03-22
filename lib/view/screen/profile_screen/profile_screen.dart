import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kabar/view/screen/profile_screen/setting_screen.dart';

import '../../../utill/const colors/const_color.dart';
import 'create_news_screen.dart';
import 'edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin {
  late TabController tabController;
  bool isFollowing = false;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile",
          style: kTextStyle.copyWith(color: kTitleColor, fontSize: 16),
        ),
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  const SettingScreen()),
              );
            },
            child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Image.asset(
                  "assets/icon/setting_icon.png",
                  width: 22,
                  height: 22,
                )),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: AssetImage("assets/image/man.png"), fit: BoxFit.cover)),
                ),
                Column(
                  children: [
                    Text(
                      "2156",
                      style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      "Followers",
                      style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "567",
                      style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      "Following",
                      style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "23",
                      style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      "News",
                      style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Wilson Franci",
                  style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          )),
                      onPressed: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  const EditProfile()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Edit profile",
                            style: kTextStyle.copyWith(color: kWhiteColor, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          )),
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => const LogInScreen()),
                        // );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Website",
                            style: kTextStyle.copyWith(color: kWhiteColor, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                ),
              ],
            ),
            Center(
              child: TabBar(
                controller: tabController,
                indicatorColor: kPrimaryColor,
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: kSubTitleColor,
                labelColor: kTitleColor,
                tabAlignment: TabAlignment.center,
                tabs: const [
                  Tab(text: "News"),
                  Tab(text: "Recent"),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(controller: tabController, children: [
                ListView.builder(
                  itemCount: 10,
                  padding: const EdgeInsets.only(top: 10),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Container(
                              height: 96,
                              width: 96,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                image: const DecorationImage(
                                  image: AssetImage('assets/image/russian_warship.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Europe",
                                  style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 13),
                                ),
                                Text(
                                  "Russian warship: Moskva sinks in Black Sea",
                                  style: kTextStyle.copyWith(color: kTitleColor, fontSize: 16),
                                  maxLines: 2, // Limiting to 2 lines
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true, // Truncating with ellipsis if exceeds 2 lines
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/icon/bbc_NewsAuthor.png",
                                          width: 20,
                                          height: 20,
                                          fit: BoxFit.cover,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "BBC News",
                                          style: kTextStyle.copyWith(color: kSubTitleColor, fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Image.asset(
                                          "assets/icon/time.png",
                                          width: 12,
                                          height: 12,
                                          fit: BoxFit.cover,
                                        ),
                                        const SizedBox(
                                          width: 5,
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
                                    InkWell(
                                      onTap: () {},
                                      child: const Icon(
                                        Icons.more_horiz,
                                        size: 18,
                                        color: kSubTitleColor,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
                ListView.builder(
                  itemCount: 10,
                  padding: const EdgeInsets.only(top: 10),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Container(
                              height: 96,
                              width: 96,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                image: const DecorationImage(
                                  image: AssetImage('assets/image/russian_warship.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Europe",
                                  style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 13),
                                ),
                                Text(
                                  "Russian warship: Moskva sinks in Black Sea",
                                  style: kTextStyle.copyWith(color: kTitleColor, fontSize: 16),
                                  maxLines: 2, // Limiting to 2 lines
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true, // Truncating with ellipsis if exceeds 2 lines
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/icon/bbc_NewsAuthor.png",
                                          width: 20,
                                          height: 20,
                                          fit: BoxFit.cover,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "BBC News",
                                          style: kTextStyle.copyWith(color: kSubTitleColor, fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Image.asset(
                                          "assets/icon/time.png",
                                          width: 12,
                                          height: 12,
                                          fit: BoxFit.cover,
                                        ),
                                        const SizedBox(
                                          width: 5,
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
                                    InkWell(
                                      onTap: () {},
                                      child: const Icon(
                                        Icons.more_horiz,
                                        size: 18,
                                        color: kSubTitleColor,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ]),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: () {

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  const CreateNewsScreen()),
          );
        },
        child: const Icon(
          Icons.add,
          color: kWhiteColor,
        ),
      ),
    );
  }
}
