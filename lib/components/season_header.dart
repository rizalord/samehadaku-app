import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: width * .6,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: Image.asset(
              'assets/images/season.png',
              fit: BoxFit.cover,
              width: width,
              height: width * .6,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              alignment: Alignment.center,
              width: 89,
              height: 32,
              // padding: EdgeInsets.symmetric(horizontal: 15 , vertical: 7),
              decoration: BoxDecoration(
                color: Color(0xFFFCFCFC),
                borderRadius: BorderRadius.circular(160),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.black.withOpacity(.25),
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: Text(
                '2020',
                style: GoogleFonts.roboto(
                    fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }
}
