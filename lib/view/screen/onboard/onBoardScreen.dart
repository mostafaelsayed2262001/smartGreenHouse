import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:smartfarm/utils/themes.dart';
import 'package:smartfarm/view/screen/auth/login_screen.dart';
import 'package:smartfarm/view/layout/text_utiles.dart';


class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const LogInScreen()),
    );
  }



  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('$assetName', width: width,);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0,);

    const pageDecoration = PageDecoration(

      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,

      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      globalHeader: Align(
        alignment: Alignment.topRight,

      ),

      pages: [
        PageViewModel(
          title: "Fractional shares",

          body:
          "Instead of having to buy an entire share, invest any amount you want.",
          image: _buildImage('images/board/boardOne.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Learn as you go",
          body:
          "Download the Stockpile app and master the market with our mini-lesson.",
          image: _buildImage('images/board/boardTwo.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Kids and teens",
          body:
          "Kids and teens can track their stocks 24/7 and place trades that you approve.",
          image: _buildImage('images/board/boardThree.jpg'),
          decoration: pageDecoration,
        ),

      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,


      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back_ios,color: mainColor,size: 20),
      skip:  TextUtils( text: 'Skip', ),
      next: const Icon(Icons.arrow_forward_ios_outlined,color: mainColor,size: 20,),
      done: const TextUtils(text: 'Done'),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),

      dotsDecorator: const DotsDecorator(
        activeColor: mainColor,
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

