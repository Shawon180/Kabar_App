import 'package:flutter/material.dart';
import 'package:kabar/utill/const%20colors/const_color.dart';
class TrendingScreen extends StatefulWidget {
  const TrendingScreen({Key? key}) : super(key: key);

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        actions: const [Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Icon(Icons.more_vert,color: kSubTitleColor,),
        )],
        title: Text("Trending",style: kTextStyle.copyWith(fontSize: 16,fontWeight: FontWeight.bold,color: kTitleColor),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView.builder(
            itemCount: 10,
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
      ),
    );
  }
}
