import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:first_ecommerce_app/widgets/widgets.dart';
import 'package:first_ecommerce_app/config/config.dart';

class IntroductionScreen extends StatefulWidget {

  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final PageController _pageController = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (value){
                setState(() => isLastPage = (value == 2));
              },
              children: [
                IntroductionSlide(title: 'We Are Here To Help', image: 'assets/images/slide1.jpg'),
                IntroductionSlide(title: 'Find Your Destiny', image: 'assets/images/slide2.jpg'),
                IntroductionSlide(title: 'Join With Us Now', image: 'assets/images/slide3.jpg'),
              ],
            ),
            Container(
                alignment: AppTheme.alignY008,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: (){
                        _pageController.jumpToPage(2);
                      },
                      child: Text('Skip', style: Theme.of(context).textTheme.bodyText2,),
                    ),
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: 3,
                    ),
                    TextButton(
                      onPressed: (){
                        if(isLastPage){
                          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                        }else{
                          _pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
                        }
                      },
                      child: Text(isLastPage ? 'Done' : 'Next', style: Theme.of(context).textTheme.bodyText2,),
                    ),
                  ],
                )
            ),
          ],
        )
    );
  }
}
