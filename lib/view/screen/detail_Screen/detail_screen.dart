import 'package:flutter/material.dart';
import 'package:kabar/utill/const%20colors/const_color.dart';

import '../comment_screen/comment_screen.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isFavorite = false;
  bool isBookmark = false;

  bool isFollowing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Row(
              children: [
                Icon(
                  Icons.share_outlined,
                  color: kSubTitleColor,
                ),
                Icon(
                  Icons.more_vert,
                  color: kSubTitleColor,
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                horizontalTitleGap: 5,
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    image: const DecorationImage(
                      image: AssetImage('assets/image/author_profile.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text(
                  "BBC",
                  style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                ),
                subtitle: Text("14m ago",
                    style: kTextStyle.copyWith(
                      color: kSubTitleColor,
                    )),
                trailing: FittedBox(
                  child: SizedBox(
                    width: 120,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            )),
                        onPressed: () {
                          setState(() {
                            isFollowing = !isFollowing;
                          });
                        },
                        child: Text(
                          isFollowing == true ? "Following" : "Follow",
                          style: kTextStyle.copyWith(color: kWhiteColor, fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 307,
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
                height: 10,
              ),
              Text(
                "Europe",
                style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 13),
              ),
              Text(
                "Ukraine's President Zelensky to BBC: Blood money being paid for Russian oil",
                style: kTextStyle.copyWith(color: kTitleColor, fontSize: 16),
              ),
              Text(
                "Ukrainian President Volodymyr Zelensky has accused European countries that continue to buy Russian oil of "
                "earning their money in other people's blood"
                " In an interview with the BBC, President Zelensky singled out Germany and Hungary, accusing them of blocking efforts to embargo energy sales, from which Russia stands to make up to £250bn (\$326bn) this year.There has been a growing frustration among Ukraine's leadership with Berlin, which has backed some sanctions against Russia but so far resisted calls to back tougher action on oil sales.",
                style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 13),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:  SizedBox(
        height: 78,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      InkWell(
                          onTap: (){
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                          child: Image.asset("assets/icon/favorite_icon.png",width: 24,height: 24,color: isFavorite==true?const Color(0xffED2E7E):kSubTitleColor,)),
                      const SizedBox(width: 5,),   Text("24.5K",style: kTextStyle.copyWith(fontSize: 16,color: kTitleColor,),),
                    ],
                  ),
                  const SizedBox(width: 20,),
                  Row(
                    children: [
                      InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CommentScreen()));

                          },
                          child: Image.asset("assets/icon/comment_icon.png",width: 24,height: 24,)),
                      const SizedBox(width: 5,),
                      Text("1K",style: kTextStyle.copyWith(color: kTitleColor,fontSize: 16),),
                    ],
                  ),
                ],
              ),
              IconButton(onPressed: (){
                setState(() {
                  isBookmark = !isBookmark;
                });
              }, icon: isBookmark==true? const Icon(Icons.bookmark,color: kPrimaryColor,):const Icon(Icons.bookmark_border,color: kSubTitleColor,))
            ],
          ),
        ),
      ),
    );
  }
}
