import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utill/const colors/const_color.dart';
import '../author_profile/author_profile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with TickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  late TabController tabController;
  bool isFollowing = false;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            children: [
              SizedBox(
                height: 48,
                child: TextFormField(
                  controller: _searchController,
                  keyboardType: TextInputType.name,
                  decoration: kInputDecoration.copyWith(
                    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    hintText: "Search",
                    hintStyle: kTextStyle.copyWith(color: kButtonTextColor),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        "assets/icon/search.png",
                        width: 24,
                        height: 24,
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        "assets/icon/filter_icon.png",
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TabBar(
                controller: tabController,
                indicatorColor: kPrimaryColor,
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: kSubTitleColor,
                labelColor: kTitleColor,
                tabAlignment: TabAlignment.center,
                tabs: const [
                  Tab(text: "News"),
                  Tab(text: "Topic"),
                  Tab(text: "Author"),
                ],
              ),
              Expanded(
                child: TabBarView(
                    controller: tabController,
                    children: [
                  ListView.builder(
                    itemCount: 10,
                    padding: const EdgeInsets.only(top: 10),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (_,index) {
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
                    itemBuilder: (_,index) {
                      return  Padding(
                        padding: const EdgeInsets.all( 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:  const EdgeInsets.only(right: 10.0),
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                  image: const DecorationImage(
                                    image: AssetImage('assets/image/health.png'),
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
                                    "Health",
                                    style: kTextStyle.copyWith(
                                      color: kTitleColor,
                                      fontSize: 16

                                    ),
                                  ),
                                  Text(
                                    "View the latest health news and explore articles on...",
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
                                width:75,
                                decoration: BoxDecoration(
                                    color: isFollowing == true?kPrimaryColor:kWhiteColor,
                                    borderRadius: BorderRadius.circular(6.0), border: Border.all(color: kPrimaryColor)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [

                                      isFollowing == true?  Text(
                                        "Saved",
                                        style: kTextStyle.copyWith(color:kWhiteColor, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,
                                      ):Row(
                                        children: [
                                          const Icon(
                                            Icons.add,
                                            color: kPrimaryColor,
                                            size: 20,
                                          ),
                                          Text(
                                            "Save",
                                            style: kTextStyle.copyWith(color:kPrimaryColor, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,
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
                      );
                    },
                  ),
                  //AuthorProfile
                  ListView.builder(
                    itemCount: 10,
                    padding: const EdgeInsets.only(top: 10),

                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (_,index) {
                      return  InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const AuthorProfile()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all( 10.0),
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
                                      image: AssetImage('assets/icon/cnn.png'),
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
                                      "BBC News",
                                      style: kTextStyle.copyWith(
                                        color: kTitleColor,
                                        fontSize: 16

                                      ),
                                    ),
                        const SizedBox(height: 10,),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(text:"1.2M ",
                                          style: kTextStyle.copyWith(
                                            color: kSubTitleColor,

                                          ),),
                                          TextSpan(text:"Followers",
                                            style: kTextStyle.copyWith(
                                              color: kSubTitleColor,

                                            ),),
                                        ],
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
                                      color: isFollowing == true?kPrimaryColor:kWhiteColor,
                                      borderRadius: BorderRadius.circular(6.0), border: Border.all(color: kPrimaryColor)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        isFollowing == true?  Text(
                                          "Following",
                                          style: kTextStyle.copyWith(color:kWhiteColor, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,
                                        ):Row(
                                          children: [
                                            const Icon(
                                              Icons.add,
                                              color: kPrimaryColor,
                                              size: 20,
                                            ),
                                            Text(
                                              "Follow",
                                              style: kTextStyle.copyWith(color:kPrimaryColor, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,
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
                      );
                    },
                  ),

                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
