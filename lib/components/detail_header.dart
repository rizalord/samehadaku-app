import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
    @required this.width,
    this.url,
  }) : super(key: key);

  final double width;
  final String url;

  _launchURL(url) async {
    print('launching $url');
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 24,
            ),
            iconSize: 24,
          ),
          PopupMenuButton(
            onSelected: (value) {
              this._launchURL(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text('Open in Browser'),
                  value: this.url,
                ),
              ];
            },
          ),
        ],
      ),
    );
  }
}
