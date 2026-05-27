import 'package:flutter/material.dart';
import 'package:onboarding_screen/intro_screen/OnBoarding_Items.dart';
import 'package:onboarding_screen/screens/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _controller = PageController();
  final _pageItems = OnboardingItems();
  int currentPage =  0;
  bool isLastPage = false;
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 80),
        child: PageView.builder(
           onPageChanged: (index) {
              setState(() {
                currentPage = index;
                isLastPage = index == _pageItems.items.length - 1;
              });
           },
          controller: _controller,
          itemCount: _pageItems.items.length,
          itemBuilder: (context, index) {

            final item = _pageItems.items[index];

            return Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Image.asset(
                    item.image,
                    height: 300,
                  ),

                  SizedBox(height: 30),

                  Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 20),

                  Text(
                    item.descriptions,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        )
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if(currentPage == 0)
              TextButton(
                onPressed: () {
                  _controller.jumpToPage(_pageItems.items.length - 1);
                },
                child: Text("Skip",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              )
            else
              TextButton(
                  onPressed: () {
                    if(currentPage > 0){
                      _controller.animateToPage(
                      currentPage - 1,
                      duration: const Duration(milliseconds: 600),
                          curve: Curves.easeIn
                      );
                    }
                  },
                  child: Text("Back",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
              ),
            Center(
              child: SmoothPageIndicator(
                  controller: _controller,
                  count: _pageItems.items.length,
                onDotClicked: (index)=> _controller.animateToPage(index,
                    duration: const Duration(milliseconds: 600), curve: Curves.easeIn),
                effect: const WormEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  activeDotColor: Colors.black38,
                ),
              )
            ),
            if (currentPage == _pageItems.items.length - 1)
              TextButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setBool("seenOnboarding", true);
                  
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context)=>Homescreen())
                  );
                },
                child: const Text(
                  "Let's Start",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              )
            else
              TextButton(
                onPressed: () {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: const Text(
                  "Next",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
