import 'package:flutter/material.dart';
import './tab_pages.dart';

class GeneralMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GeneralMainState();
}

class GeneralMainState extends State<GeneralMain> {
  final _pageController = PageController(initialPage: 0);
  int page = 0;

  void changePage(index) {
    page = index;
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 400), curve: Curves.fastOutSlowIn);
  }

  Future<bool> onBackPressed() async {
    print('back pressed');
    if (page != 0) {
      page = 0;
      _pageController.animateToPage(0,
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: <Widget>[
            TabPages(changePage: changePage),
            Text('nice'),
          ],
        ),
      ),
    );
  }
}
