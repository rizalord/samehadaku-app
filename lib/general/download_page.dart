import 'package:flutter/material.dart';
import './../components/download_header.dart';
import './../components/download_fill.dart';

class DownloadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Header(width: width),
            // Empty() 
            FilledDownload()
          ],
        ),
      ),
    );
  }
}
