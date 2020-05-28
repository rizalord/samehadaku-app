import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class EpsCardShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: width * 0.28,
      margin: EdgeInsets.only(bottom: 8),
      child: Row(
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
              width: width * .4,
              height: width * 0.28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // TITLE
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
                      color: Theme.of(context).textSelectionColor,
                      width: double.infinity,
                      child: Text(
                        '',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Theme.of(context).textSelectionColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  // EPISODE
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
                      color: Theme.of(context).textSelectionColor,
                      margin: EdgeInsets.only(top: 8),
                      child: Text(
                        'Episode 8',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          color: Theme.of(context)
                              .textSelectionColor
                              .withOpacity(.8),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),

                  // AUTHOR
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
                      color: Theme.of(context).textSelectionColor,
                      margin: EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Posted by: ',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              color: Theme.of(context)
                                  .textSelectionColor
                                  .withOpacity(1),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Rizalord',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              color: Theme.of(context)
                                  .textSelectionColor
                                  .withOpacity(.8),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // DATE RELEASE
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
                      color: Theme.of(context).textSelectionColor,
                      margin: EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Released on: ',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              color: Theme.of(context)
                                  .textSelectionColor
                                  .withOpacity(1),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Flexible(
                            child: Text(
                              '10 April 2020',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                color: Theme.of(context)
                                    .textSelectionColor
                                    .withOpacity(.8),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
