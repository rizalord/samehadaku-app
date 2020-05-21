import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EpsCard extends StatelessWidget {
  final String image, title, episode, author, release;

  EpsCard({
    this.image,
    this.title,
    this.episode,
    this.author,
    this.release,
  });

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
              color: Colors.grey
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Theme.of(context).textSelectionColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text(
                      'Episode $episode',
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
                  Container(
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
                          author,
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
                  Container(
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
                            release,
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
