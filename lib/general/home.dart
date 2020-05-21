import 'dart:convert';

import 'package:Samehadaku/setting.dart';
import 'package:flutter/material.dart';
import './../components/home_header.dart';
import './../components/home_carousel.dart';
import './../components/home_main_content.dart';
import './../components/home_blog.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  final Function changePage;

  Home({this.changePage});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data;

  @override
  void initState() {
    getHttpData();
    super.initState();
  }

  getHttpData() async {
    var url = Setting().restendpoint;

    var response = json.decode((await http.get(url)).body);
    response['season'].removeRange(5, 10);
    response['latest'].removeRange(5, 14);
    if (this.mounted)
      setState(() {
        data = response;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Header(changePage: widget.changePage),
            Carousel(data: data == null ? [] : data['season']),
            MainContent(data: data == null ? [] : data['latest']),
            Blog()
          ],
        ),
      ),
    );
  }
}
