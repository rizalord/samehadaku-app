import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Blog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      margin: EdgeInsets.only(
        left: 12,
        right: 12,
        top: 6,
      ),
      padding: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SubHeader(width: width),
          SizedBox(height: 10),
          Wrap(
            children: <Widget>[
              Container(
                width: width * .45,
                margin: EdgeInsets.only(right: 12, bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.network(
                        'https://i0.wp.com/samehadaku.vip/wp-content/uploads/2020/05/Go-toubun-no-hanayome-9.jpg?quality=100',
                        fit: BoxFit.cover,
                        height: width * .30),
                    SizedBox(height: 5),
                    Text(
                      'Season Kedua Anime Go Toubun no Hanayome Ditunda Penayangan',
                      style: GoogleFonts.roboto(
                        fontSize: 13,
                        color: Theme.of(context)
                            .textSelectionColor
                            .withOpacity(.77),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Dilansir dari situs website dan akun twitter resmi untuk...',
                      style: GoogleFonts.roboto(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: Theme.of(context)
                              .textSelectionColor
                              .withOpacity(.71)),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    Text(
                      '28 April 2020',
                      style: GoogleFonts.roboto(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic,
                          color: Theme.of(context)
                              .textSelectionColor
                              .withOpacity(.71)),
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                width: width * .45,
                margin: EdgeInsets.only(bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.network(
                        'https://i0.wp.com/samehadaku.vip/wp-content/uploads/2020/05/Go-toubun-no-hanayome-9.jpg?quality=100',
                        fit: BoxFit.cover,
                        height: width * .30),
                    SizedBox(height: 5),
                    Text(
                      'Season Kedua Anime Go Toubun no Hanayome Ditunda Penayangan',
                      style: GoogleFonts.roboto(
                        fontSize: 13,
                        color: Theme.of(context)
                            .textSelectionColor
                            .withOpacity(.77),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Dilansir dari situs website dan akun twitter resmi untuk...',
                      style: GoogleFonts.roboto(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: Theme.of(context)
                              .textSelectionColor
                              .withOpacity(.71)),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    Text(
                      '28 April 2020',
                      style: GoogleFonts.roboto(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic,
                          color: Theme.of(context)
                              .textSelectionColor
                              .withOpacity(.71)),
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                width: width * .45,
                margin: EdgeInsets.only(right: 12, bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.network(
                        'https://i0.wp.com/samehadaku.vip/wp-content/uploads/2020/05/Go-toubun-no-hanayome-9.jpg?quality=100',
                        fit: BoxFit.cover,
                        height: width * .30),
                    SizedBox(height: 5),
                    Text(
                      'Season Kedua Anime Go Toubun no Hanayome Ditunda Penayangan',
                      style: GoogleFonts.roboto(
                        fontSize: 13,
                        color: Theme.of(context)
                            .textSelectionColor
                            .withOpacity(.77),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Dilansir dari situs website dan akun twitter resmi untuk...',
                      style: GoogleFonts.roboto(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: Theme.of(context)
                              .textSelectionColor
                              .withOpacity(.71)),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    Text(
                      '28 April 2020',
                      style: GoogleFonts.roboto(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic,
                          color: Theme.of(context)
                              .textSelectionColor
                              .withOpacity(.71)),
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                width: width * .45,
                margin: EdgeInsets.only(bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.network(
                        'https://i0.wp.com/samehadaku.vip/wp-content/uploads/2020/05/Go-toubun-no-hanayome-9.jpg?quality=100',
                        fit: BoxFit.cover,
                        height: width * .30),
                    SizedBox(height: 5),
                    Text(
                      'Season Kedua Anime Go Toubun no Hanayome Ditunda Penayangan',
                      style: GoogleFonts.roboto(
                        fontSize: 13,
                        color: Theme.of(context)
                            .textSelectionColor
                            .withOpacity(.77),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Dilansir dari situs website dan akun twitter resmi untuk...',
                      style: GoogleFonts.roboto(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: Theme.of(context)
                              .textSelectionColor
                              .withOpacity(.71)),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    Text(
                      '28 April 2020',
                      style: GoogleFonts.roboto(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic,
                          color: Theme.of(context)
                              .textSelectionColor
                              .withOpacity(.71)),
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class SubHeader extends StatelessWidget {
  const SubHeader({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: width,
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Latest Update',
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.left,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Show more',
                        style: Theme.of(context).textTheme.headline2,
                        textAlign: TextAlign.left,
                      ),
                      Icon(Icons.chevron_right)
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
