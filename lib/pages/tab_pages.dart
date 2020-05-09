import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import './../general/home.dart';
import './../general/season.dart';
import './../general/date_release.dart';

class TabPages extends StatefulWidget {
  final Function changePage;

  TabPages({this.changePage});

  @override
  _TabPagesState createState() => _TabPagesState();
}

class _TabPagesState extends State<TabPages> {
  PageController _pageController;
  int index = 0;

  // Pages
  List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      Home(changePage: widget.changePage),
      Season(),
      DateRelease(),
      Text('4'),
      Text('5'),
    ];
    _pageController = PageController(initialPage: index);
  }

  changeTab(index) {
    setState(() {
      this.index = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 600), curve: Curves.easeOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          color: Theme.of(context).tabBarTheme.unselectedLabelColor,
          height: 60,
          backgroundColor: Colors.transparent,
          items: <Widget>[
            Tab(
                icon: Icon(Icons.home,
                    color: Theme.of(context).tabBarTheme.labelColor)),
            Tab(
                icon: Icon(Icons.wb_sunny,
                    color: Theme.of(context).tabBarTheme.labelColor)),
            Tab(
                icon: Icon(Icons.date_range,
                    color: Theme.of(context).tabBarTheme.labelColor)),
            Tab(
                icon: Icon(Icons.notifications,
                    color: Theme.of(context).tabBarTheme.labelColor)),
            Tab(
                icon: Icon(Icons.cloud_download,
                    color: Theme.of(context).tabBarTheme.labelColor)),
          ],
          onTap: changeTab,
        ),
        body: SafeArea(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            children: pages,
          ),
        ),
      ),
    );
  }
}
