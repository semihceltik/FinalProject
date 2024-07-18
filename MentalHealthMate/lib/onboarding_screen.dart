import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled/HomePage.dart';
import 'package:untitled/Intro_Page_6.dart';
import 'package:untitled/intro_page_1.dart';
import 'package:untitled/intro_page_2.dart';
import 'package:untitled/intro_page_3.dart';
import 'package:untitled/intro_page_4.dart';
import 'package:untitled/intro_page_5.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller  = PageController();

  // keep track of if we are on the last page or not
  bool onLastPage= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index){
              setState(() {
                onLastPage = (index ==5);
              });
            },
            children: [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
              IntroPage4(),
              IntroPage5(),
              IntroPage6(),

            ],
          ),
          Container(
              alignment: Alignment(0,0.85),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Skip
                  GestureDetector(
                      onTap: (){
                        _controller.jumpToPage(5);
                      },
                      child: Text('Skip')),
                  SmoothPageIndicator(controller: _controller, count: 6),
                  // Next or done
                  onLastPage ?
                  GestureDetector(
                      onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Homepage();
                      }));

                      },
                      child: Text('Done')
                  ):
                  GestureDetector(
                      onTap: (){
                        _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn,
                        );
                      },
                      child: Text('Next')
                  ),
                ],
              ))
        ],
      )
    );
  }
}
