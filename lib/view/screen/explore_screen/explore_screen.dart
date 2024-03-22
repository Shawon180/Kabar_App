import 'package:flutter/material.dart';
import 'package:kabar/utill/const%20colors/const_color.dart';
class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  bool isFollowing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Explore",style: kTextStyle.copyWith(color: kTitleColor,fontSize: 32,fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Topic",
                    style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold,fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => const TrendingScreen()),
                      // );
        
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
            const SizedBox(height: 10,),
              ListView.builder(
                itemCount: 3,
padding: EdgeInsets.zero,
physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (_,index) {
                  return  Row(
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
                  );
                },
              ),
              const SizedBox(height: 10,),
              Text(
                "Popular Topic",
                style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold,fontSize: 16),
              ),
              const SizedBox(height: 10,),
              ListView.builder(
                  itemCount: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_,index){
                    return   Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Column(
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
                    );

                  }),
            ],
          ),
        ),
      ),
    );
  }
}
