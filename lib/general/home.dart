import 'package:flutter/material.dart';
import './../components/home_header.dart';
import './../components/home_carousel.dart';
import './../components/home_main_content.dart';
import './../components/home_blog.dart';

class Home extends StatelessWidget {
  final Function changePage;

  Home({this.changePage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Header(changePage: this.changePage),
            Carousel(),
            MainContent(),
            Blog()
          ],
        ),
      ),
    );
  }
}
