import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kabar/utill/const colors/const_color.dart';
import 'package:kabar/view/screen/fill_your_profile/fill_your_profile.dart';

class ChooseNewsSource extends StatefulWidget {
  const ChooseNewsSource({Key? key}) : super(key: key);

  @override
  State<ChooseNewsSource> createState() => _ChooseNewsSourceState();
}

class _ChooseNewsSourceState extends State<ChooseNewsSource> {
  TextEditingController searchController = TextEditingController();
  List<String> selectedItems = [];
  List<String> filteredItems = [];

  final List<String> allItems = [
    'CNBC',
    'VICE',
    'Vox',
    'BBC News',
    'SCMP',
    'CNN',
  ];

  final List<String> allImage = [
    'assets/icon/cnbc.png',
    'assets/icon/vice.png',
    'assets/icon/vox.png',
    'assets/icon/bbc_news.png',
    'assets/icon/scmp.png',
    'assets/icon/cnn.png',
  ];

  Map<String, bool> followStatus = {};

  @override
  void initState() {
    super.initState();
    filteredItems = allItems;
    // Initialize follow status to false for all items
    allItems.forEach((item) {
      followStatus[item] = false;
    });
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

  void toggleFollowStatus(String item) {
    setState(() {
      followStatus[item] = !followStatus[item]!;
    });
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
          "Choose your News Sources",
          style: kTextStyle.copyWith(color: kTitleColor, fontSize: 16, fontWeight: FontWeight.bold),
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
                    hintText: "Search",
                      hintStyle: kTextStyle.copyWith(color: kButtonTextColor),
                    suffixIcon: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          "assets/icon/search.png",
                          width: 24,
                          height: 24,
                        )),
                  ),
                  onChanged: (value) {
                    filterSearchResults(value);
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: filteredItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: 163,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (_, index) {
                    final item = filteredItems[index];
                    final bool isFollowing = followStatus[item] ?? false;

                    return Container(
                      decoration: kContainerDecoration.copyWith(color: const Color(0xffFAFAFA)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.asset(allImage[index], width: 96),
                            Text(item),
                            const SizedBox(height: 5),
                            InkWell(
                              onTap: () {
                                toggleFollowStatus(item);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 97,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.0),
                                  color: isFollowing ? kPrimaryColor : kWhiteColor,
                                border: Border.all(color:kPrimaryColor,width: 1)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    isFollowing ? "Following" : "Follow",
                                    style: TextStyle(
                                      color: isFollowing ? kWhiteColor : kPrimaryColor, fontWeight: FontWeight.bold// Change text color based on follow status
                                    ),
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
                ),
              ),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FillProfile()),
                );
              }, // Call the method to save selected items
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Next",
                    style: kTextStyle.copyWith(color: kWhiteColor, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
