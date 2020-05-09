import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Empty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Flexible(
      fit: FlexFit.loose,
      child: Container(
        height: height - (height * .3) - 55,
        // color: Colors.red,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/empty-download.png',
              width: width * 0.6,
              height: (width * 0.6) - 9,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 25),
            Text(
              'Tap to Refresh',
              style: GoogleFonts.roboto(
                fontSize: 24,
                fontWeight: FontWeight.w300,
                color: Theme.of(context).textSelectionHandleColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
