import 'package:flutter/material.dart';
import 'package:kabar/utill/const%20colors/const_color.dart';

import '../logIn_screen/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final List<String> titles = [
    'Lorem Ipsum is simply dummy',
    'Lorem Ipsum is simply dummy',
    'Lorem Ipsum is simply dummy',
  ];
  final List<String> image = [
    'assets/image/onBoarding_1.png',
    'assets/image/onBoarding_2.png',
    'assets/image/onBoarding_3.png',
  ];
  final List<String> descriptions = [
    'Lorem Ipsum is simply dummy text of\nthe printing and typesetting industry.',
    'Lorem Ipsum is simply dummy text of\nthe printing and typesetting industry.',
    'Lorem Ipsum is simply dummy text of\nthe printing and typesetting industry.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemCount: 3,
              itemBuilder: (context, index) {
                return OnboardingPage(
                  title: titles[index],
                  description: descriptions[index],
                  image: image[index],
                );
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3,
                              (index) => buildIndicator(index),
                        ),
                      ),
                      Row(
                        children: [
                          if (_currentPage != 0) // Show back button on 2nd and 3rd page
                            TextButton(
                              onPressed: () {
                                _pageController.previousPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                              child: Text(
                                'Back',
                                style: kTextStyle.copyWith(color: const Color(0xffB0B3B8)),
                              ),
                            ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: kPrimaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                )),
                            onPressed: () {
                              if (_currentPage == 2) {
                                // Last page, navigate to another screen or perform necessary actions
                                print('Last page reached. Perform necessary actions.');
                                // Navigate to the next screen
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const LogInScreen(),
                                  ),
                                );
                              } else {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              }
                            },
                            child: Text(
                              _currentPage == 2 ? 'Get Started' : 'Next',
                              style: kTextStyle.copyWith(color: kWhiteColor, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIndicator(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? kPrimaryColor : kButtonColor,
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          image, // Replace with your image URL
          height: MediaQuery.of(context).size.height / 1.6,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            title,
            textAlign: TextAlign.start,
            style: kTextStyle.copyWith(
              fontSize: 24,
              color: kTitleColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            description,
            textAlign: TextAlign.start,
            style: kTextStyle.copyWith(fontSize: 16,color: kSubTitleColor),
          ),
        ),
      ],
    );
  }
}

