import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import './../general/home.dart';
import './../general/season.dart';
import './../general/date_release.dart';
import './../general/notification_page.dart';
import './../general/download_page.dart';

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
      Home(changePage: widget.changePage, changeTab: this.changeTab),
      Season(),
      DateRelease(),
      NotificationPage(),
      DownloadPage(),
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
        bottomNavigationBar: ConvexAppBar(
          height: 60,
          items: [
            TabItem(icon: Icons.home),
            TabItem(icon: Icons.wb_sunny),
            TabItem(icon: Icons.date_range),
            TabItem(icon: Icons.notifications),
            TabItem(icon: Icons.cloud_download),
          ],
          onTap: changeTab,
          initialActiveIndex: index,
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
