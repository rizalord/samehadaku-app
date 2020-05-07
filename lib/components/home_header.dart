import 'package:flutter/material.dart';

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
                        onPressed: () {},
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
