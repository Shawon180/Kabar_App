import 'package:flutter/material.dart';
import 'package:kabar/utill/const%20colors/const_color.dart';
import 'package:kabar/view/screen/profile_screen/profile_screen.dart';

import 'bookmark_screen/bookmark_screen.dart';
import 'explore_screen/explore_screen.dart';
import 'home_screen/home_screen.dart';
class NavHomeScreen extends StatefulWidget {
  const NavHomeScreen({super.key});

  @override
  State<NavHomeScreen> createState() => _NavHomeScreenState();
}

class _NavHomeScreenState extends State<NavHomeScreen> {
  int _currentIndex = 0;
  final _pages = [
    const HomeScreen(),

    const ExploreScreen(),
    const BookMarkScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int value) {
          setState(() {
            _currentIndex = value;
          });
        },
        currentIndex: _currentIndex,
        backgroundColor: kWhiteColor,
        fixedColor: kPrimaryColor,
        unselectedItemColor: const Color(0xff82757C),
        type: BottomNavigationBarType.fixed,
        items:   [
          BottomNavigationBarItem(
              icon:Image.asset("assets/icon/home_icon.png",width: 18,height: 18,),
            label: 'Home',
            activeIcon: Image.asset("assets/icon/home_active_icon.png",width: 18,height: 18,color: kPrimaryColor,),
          ),
          BottomNavigationBarItem(
            icon:Image.asset("assets/icon/explore_icon.png",width: 20,height: 20,),
            label: 'Explore',
            activeIcon: Image.asset("assets/icon/explore_active_icon.png",width: 20,height: 20,color: kPrimaryColor,),
          ),
          BottomNavigationBarItem(
              icon:Image.asset("assets/icon/bookmark_icon.png",width: 20,height: 20,),
            label: 'BookMark',
            activeIcon: Image.asset("assets/icon/bookmark_active_icon.png",width: 20,height: 20,color: kPrimaryColor,),
          ),
          BottomNavigationBarItem(
              icon:Image.asset("assets/icon/profile_icon.png",width: 20,height: 20,fit: BoxFit.cover,),
            label: 'Profile',
            activeIcon: Image.asset("assets/icon/profile_active_icon.png",width: 20,height: 20,color: kPrimaryColor,fit: BoxFit.cover,),
          ),
        ],
      ),
      body: _pages[_currentIndex],
    );
  }
}
