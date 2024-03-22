import 'package:flutter/material.dart';
import 'package:kabar/utill/const%20colors/const_color.dart';
import 'package:kabar/view/screen/home_screen/notification/notification.dart';
import 'package:kabar/view/screen/home_screen/search_screen/search_screen.dart';
import 'package:kabar/view/screen/home_screen/trending_screen/treding_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{
  final TextEditingController _searchController = TextEditingController();
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 7, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kWhiteColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/icon/app_icon.png",
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(6.0),
                      boxShadow: [
                        BoxShadow(
                          color: kSubTitleColor.withOpacity(0.1),
                          offset: const Offset(0.0, 2.0),
                          blurRadius: 5.0,
                        )
                      ],
                    ),
                    child: InkWell(
                      onTap: (){ Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NotificationScreen()),
                      );},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/icon/notification_icon.png",
                          width: 18,
                          height: 21,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              pinned: true,
            ),

            SliverPersistentHeader(
              delegate: MySliverPersistentHeaderDelegate(
                PreferredSize(
                  preferredSize: const Size.fromHeight(480),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0,right: 15),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 48,
                          child: TextFormField(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const SearchScreen()),
                              );
                            },
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
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Trending",
                              style: kTextStyle.copyWith(color: kTitleColor,fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const TrendingScreen()),
                                );

                              },
                              child: Text(
                                "See all",
                                style: kTextStyle.copyWith(
                                  color: kSubTitleColor,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 230,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                image: const DecorationImage(
                                  image: AssetImage('assets/image/russian_warship.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Europe",
                              style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 13),
                            ),
                            Text(
                              "Russian warship: Moskva sinks in Black Sea",
                              style: kTextStyle.copyWith(color: kTitleColor, fontSize: 16),
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
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Latest",
                              style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold,fontSize: 16),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "See all",
                                style: kTextStyle.copyWith(
                                  color: kSubTitleColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              pinned: false,
            ),
            SliverPersistentHeader(
              delegate: MySliverPersistentHeaderDelegate(
                PreferredSize(
                  preferredSize: Size.fromHeight(40),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0,),
                    child: Container(
                      color: kWhiteColor,
                      child: TabBar(
                        controller: tabController,
                        padding: EdgeInsets.zero,
                        labelPadding: const EdgeInsets.only(right: 10),
                        indicatorColor: kPrimaryColor,
                        physics: const ScrollPhysics(),
                        dividerColor: Colors.transparent,
                        indicatorSize: TabBarIndicatorSize.label,
                        unselectedLabelColor: kSubTitleColor,
                        automaticIndicatorColorAdjustment: true,
                        labelColor: kTitleColor,
                        isScrollable: true,
                        tabAlignment: TabAlignment.start,
                        tabs: [
                          Tab(text: "All"),
                          Tab(text: "Sports"),
                          Tab(text: "Politics"),
                          Tab(text: "Business"),
                          Tab(text: "Health"),
                          Tab(text: "Travel"),
                          Tab(text: "Science"),
                        ],
                      ),
                    ),
                  ),
                ),

              ),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          controller: tabController,
          clipBehavior:Clip.hardEdge,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            // Your TabBarView contents here
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                itemCount: 10,
                padding: const EdgeInsets.only(top: 10),
                physics: const NeverScrollableScrollPhysics(),
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
            ),
            // Placeholder TextWidgets for other tabs
            Text("Sports"),
            Text("Politics"),
            Text("Business"),
            Text("Health"),
            Text("Travel"),
            Text("Science"),
          ],
        ),
      ),
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final PreferredSizeWidget child;

  MySliverPersistentHeaderDelegate(this.child);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => child.preferredSize.height;

  @override
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(covariant MySliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}


