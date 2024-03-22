import 'package:flutter/material.dart';

import '../../../utill/const colors/const_color.dart';
import '../detail_Screen/detail_screen.dart';
class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({super.key});

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Bookmark",style: kTextStyle.copyWith(color: kTitleColor,fontSize: 32,fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
              ListView.builder(
                itemCount: 10,
                padding: const EdgeInsets.only(top: 10),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,

                itemBuilder: (_,index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  const DetailScreen()),
                            );
                          },
                          child: Padding(
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
            ],
          ),
        ),
      ),
    );
  }
}
