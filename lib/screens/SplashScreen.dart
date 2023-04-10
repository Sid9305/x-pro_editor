import 'package:Xpro_editor/screens/MainScreen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return AnimatedSplashScreen(
      splash: 'assets/PiRO.png',
      // backgroundColor: Color.fromRGBO(20, 0, 182, 100),
      nextScreen: MainPage(),
      splashTransition: SplashTransition.decoratedBoxTransition,
      duration: 150,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
    );
  }

}



