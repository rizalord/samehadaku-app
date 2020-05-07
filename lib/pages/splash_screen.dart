import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import './general_root.dart';

// Splash Screen Only
class SplashScreenPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SplashComponent(height: height, width: width, context: context));
  }
}

class SplashComponent extends StatelessWidget {
  SplashComponent({
    Key key,
    @required this.height,
    @required this.width,
    @required this.context,
  }){
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.scale, alignment: Alignment.bottomCenter, child: GeneralMain()));
    });
  }

  final double height;
  final double width;
  final BuildContext context;

  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
    color: Colors.pink,
    gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF20CDF3), Color(0xFF20CDF3)]),
      ),
      child: Center(
    child: Container(
      margin: EdgeInsets.only(bottom: 50),
      child: Image.asset('assets/images/logo-icon.png'),
    ),
      ),
    );
  }
}
