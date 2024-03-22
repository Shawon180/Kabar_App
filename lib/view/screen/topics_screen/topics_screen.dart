
import 'package:flutter/material.dart';
import 'package:kabar/utill/const%20colors/const_color.dart';

import '../choose_your_news_sources/choose_your_news_sources.dart';

class TopicScreen extends StatefulWidget {
  const TopicScreen({super.key});

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  TextEditingController searchController = TextEditingController();
  List<String> selectedItems = [];
  List<String> filteredItems = [];

  final List<String> allItems = [
    'National',
    'International',
    'Sport',
    'Lifestyle',
    'Business',
    'Health',
    'Fashion',
    'Technology',
    'Science',
    'Art',
    'Politics'
  ];

  @override
  void initState() {
    super.initState();
    filteredItems = allItems;
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = [];
    dummySearchList.addAll(allItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        filteredItems.clear();
        filteredItems.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        filteredItems.clear();
        filteredItems.addAll(allItems);
      });
    }
  }

  void saveSelectedItems() {
    // You can perform your save operation here, for example:
    // print(selectedItems);
    // You can also navigate to the next screen with the selected items
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => NextScreen(selectedItems: selectedItems)),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Choose your Topics",
          style: kTextStyle.copyWith(color: kTitleColor,fontSize: 16,fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
          SizedBox(
                    height: 48,
                    child: TextFormField(
                      controller: searchController,
                      keyboardType: TextInputType.name,
                      decoration: kInputDecoration.copyWith(
                          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          hintText: "search",
                          suffixIcon: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(
                                "assets/icon/search.png",
                                width: 24,
                                height: 24,
                              )),
                          hintStyle: kTextStyle.copyWith(color: kButtonTextColor)),
                      onChanged: (value) {
                        filterSearchResults(value);
                      },
                    ),
                  ),
              const SizedBox(height: 10,),
              Align(
                alignment: Alignment.topLeft,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: filteredItems.map((item) {
                    final isSelected = selectedItems.contains(item);

                    return InkWell(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedItems.remove(item);
                          } else {
                            selectedItems.add(item);
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: isSelected ? kPrimaryColor : kPrimaryColor),
                          color: isSelected ? kPrimaryColor : kWhiteColor,
                        ),
                        child: Text(
                          item,
                          style: TextStyle(color: isSelected ? kWhiteColor : kPrimaryColor, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: kContainerDecoration,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    )),
                onPressed: () {
                  saveSelectedItems();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChooseNewsSource()),
                  );

                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Next",
                      style: kTextStyle.copyWith(color: kWhiteColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
