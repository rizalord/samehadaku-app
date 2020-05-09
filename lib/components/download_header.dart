import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height * .25,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF4CC6E1),
            Colors.lightBlue,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 15,
            left: 15,
            child: Text(
              'Downloads',
              style: GoogleFonts.roboto(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
