import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import './../pages/home_notification.dart';

class Header extends StatelessWidget {
  final Function changePage;

  Header({this.changePage});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      height: 65,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            'assets/images/logo-icon.png',
            height: 40,
          ),
          Container(
            height: 55,
            width: 45 * 2.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 45,
                  height: 55,
                  alignment: Alignment.center,
                  child: Center(
                    child: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          changePage(1);
                        },
                        iconSize: 30,
                        alignment: Alignment.center,
                        color: Theme.of(context).unselectedWidgetColor),
                  ),
                ),
                Container(
                  width: 45,
                  height: 55,
                  alignment: Alignment.center,
                  child: Center(
                    child: IconButton(
                        icon: Icon(Icons.notifications_none),
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              // curve: Curves.fastOutSlowIn,
                              // duration: Duration(milliseconds: 300),
                              type: PageTransitionType.fade,
                              alignment: Alignment.bottomCenter,
                              child: NotifHome(),
                            ),
                          );
                        },
                        iconSize: 30,
                        alignment: Alignment.center,
                        color: Theme.of(context).unselectedWidgetColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
