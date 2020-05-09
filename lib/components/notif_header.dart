import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotifHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: width * .2,
      width: width,
      margin: EdgeInsets.only(right : 24, left: 24, bottom : 12),
      decoration: BoxDecoration(
        border: Border(
          bottom:
              BorderSide(color: Color(0xFF4CC6E1).withOpacity(.23), width: 1),
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        '- BLOG -',
        style: GoogleFonts.roboto(
          fontSize: 20,
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.italic,
          color: Color(0xFF4CC6E1)
        ),
      ),
    );
  }
}
