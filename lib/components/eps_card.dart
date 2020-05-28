import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class EpsCard extends StatefulWidget {
  final String image, title, episode, author, release;

  EpsCard({
    this.image,
    this.title,
    this.episode,
    this.author,
    this.release,
  });

  @override
  _EpsCardState createState() => _EpsCardState();
}

class _EpsCardState extends State<EpsCard> {
  bool downloaded = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: width * 0.28,
      margin: EdgeInsets.only(bottom: 8),
      child: Row(
        children: <Widget>[
          Container(
            width: width * .4,
            height: width * 0.28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey.withOpacity(.15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                widget.image,
                fit: BoxFit.cover,
                loadingBuilder: (ctx, child, proggress) {
                  if (proggress == null) {
                    Future.delayed(Duration(microseconds: 0), () {
                      if (this.mounted)
                        setState(() {
                          downloaded = true;
                        });
                    });

                    return child;
                  }

                  return Shimmer(
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
                    ),
                  );
                },
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
                  downloaded == false
                      ? Shimmer(
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
                              widget.title,
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Theme.of(context).textSelectionColor,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                      : Text(
                          widget.title,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Theme.of(context).textSelectionColor,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                  // EPISODE
                  downloaded == false
                      ? Shimmer(
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
                              'Episode ${widget.episode}',
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
                        )
                      : Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Text(
                            'Episode ${widget.episode}',
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
                  // AUTHOR
                  downloaded == false
                      ? Shimmer(
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
                                  widget.author,
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
                        )
                      : Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Row(
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
                                widget.author,
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
                  // DATE RELEASE
                  downloaded == false
                      ? Shimmer(
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
                                    widget.release,
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
                        )
                      : Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Row(
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
                                  widget.release,
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
