import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class Empty extends StatefulWidget {
  @override
  _EmptyState createState() => _EmptyState();
}

class _EmptyState extends State<Empty> {
  bool isRefresh = false;

  void tapRefresh() {
    setState(() {
      isRefresh = !isRefresh;
      Future.delayed(Duration(milliseconds: 300), () {
        setState(() {
          isRefresh = !isRefresh;
        });
      });
    });
  }

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
        child: isRefresh
            ? Center(child: CircularProgressIndicator())
            : TouchableOpacity(
                activeOpacity: .9,
                onTap: tapRefresh,
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
      ),
    );
  }
}
