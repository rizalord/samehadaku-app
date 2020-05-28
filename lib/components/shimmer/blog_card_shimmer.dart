
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class BlogCardShimmer extends StatelessWidget {
  const BlogCardShimmer({
    Key key,
    @required this.width,
    @required this.index,
  }) : super(key: key);

  final double width;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * .45,
      margin: EdgeInsets.only(
          right: index % 2 == 0 ? 12 : 0, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Shimmer(
            gradient: LinearGradient(
              stops: [.4, .5, .6],
              begin: Alignment(-1, -1),
              end: Alignment(1, 1),
              colors: [
                Colors.grey.withOpacity(.3),
                Colors.white,
                Colors.grey.withOpacity(.3),
              ],
            ),
            child: Container(
              color: Colors.grey,
              height: width * .30,
            ),
          ),
          SizedBox(height: 5),
          Shimmer(
            gradient: LinearGradient(
              stops: [.4, .5, .6],
              begin: Alignment(-1, -1),
              end: Alignment(1, 1),
              colors: [
                Colors.grey.withOpacity(.3),
                Colors.white,
                Colors.grey.withOpacity(.3),
              ],
            ),
            child: Container(
              color: Colors.grey.withOpacity(.5),
              width: double.infinity,
              child: Text(
                '',
                style: GoogleFonts.roboto(
                  fontSize: 13,
                  color: Theme.of(context)
                      .textSelectionColor
                      .withOpacity(.77),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          SizedBox(height: 5),
          Shimmer(
            gradient: LinearGradient(
              stops: [.4, .5, .6],
              begin: Alignment(-1, -1),
              end: Alignment(1, 1),
              colors: [
                Colors.grey.withOpacity(.3),
                Colors.white,
                Colors.grey.withOpacity(.3),
              ],
            ),
            child: Container(
              color: Colors.grey.withOpacity(.5),
              child: Text(
                'Manga Black Clover lalala',
                style: GoogleFonts.roboto(
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                    color: Colors.transparent),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}