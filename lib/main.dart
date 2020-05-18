// Copyright 2020 Rizalord Developer. All rights reserved.
// This App is created for Samehadaku.vip only

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './pages/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseMessaging _fcm = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");

        final snackbar = SnackBar(
          content: Text(message['notification']['title']),
          action: SnackBarAction(
            label: 'Go',
            onPressed: () {},
          ),
        );

        Scaffold.of(context).showSnackBar(snackbar);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      // DARK THEME
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        unselectedWidgetColor:
            Colors.white.withOpacity(.72) // Icon Header Color [Home]
        ,
        tabBarTheme: TabBarTheme(
          unselectedLabelColor: Colors.white,
          labelColor: Colors.lightBlue,
        ),
        sliderTheme: SliderThemeData(
          disabledActiveTrackColor: Color(0xFFC4C4C4),
          activeTrackColor: Color(0xFF4CC6E1),
        ),
        textTheme: TextTheme(
          headline1: GoogleFonts.poppins(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          headline2: GoogleFonts.poppins(
            fontWeight: FontWeight.w300,
            fontSize: 13,
            color: Colors.white.withOpacity(.61),
          ),
        ),
        dividerColor: Colors.white.withOpacity(.08),
        textSelectionColor: Colors.white,
        textSelectionHandleColor: Colors.white.withOpacity(.6),
        canvasColor: Colors.black,
      ),

      // LIGHT THEME
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFCFCFC),
        brightness: Brightness.light,
        unselectedWidgetColor:
            Colors.black.withOpacity(.52), // Icon Header Color [Home]
        sliderTheme: SliderThemeData(
            disabledActiveTrackColor: Color(0xFFC4C4C4),
            activeTrackColor: Color(0xFF4CC6E1)),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.lightBlue,
        ),
        textTheme: TextTheme(
          headline1: GoogleFonts.poppins(
            fontSize: 18,
            color: Colors.lightBlue,
            fontWeight: FontWeight.w500,
          ),
          headline2: GoogleFonts.poppins(
            fontWeight: FontWeight.w300,
            fontSize: 13,
            color: Colors.black.withOpacity(.61),
          ),
        ),
        dividerColor: Colors.black.withOpacity(.08),
        textSelectionColor: Colors.black,
        textSelectionHandleColor: Colors.lightBlue.withOpacity(.5),
        canvasColor: Colors.white,
      ),
      home: SplashScreenPage(),
    );
  }
}
