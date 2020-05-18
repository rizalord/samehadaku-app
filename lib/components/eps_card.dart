import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EpsCard extends StatelessWidget {


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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                'https://i0.wp.com/samehadaku.vip/wp-content/uploads/2020/05/2020-05-07_13-52-32.jpg?quality=100',
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
                    'Fruit Basket Season 3',
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
                      'Episode 4',
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
                          'Ktyg -',
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
                        Text(
                          '1 hari yang lalu',
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
