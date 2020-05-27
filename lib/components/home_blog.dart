import 'dart:convert';

import 'package:Samehadaku/pages/detail_blog.dart';
import 'package:Samehadaku/setting.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:touchable_opacity/touchable_opacity.dart';

class Blog extends StatefulWidget {
  final bool loaded;
  final Function changePage;

  Blog({this.loaded, this.changePage});

  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  List data = [];

  @override
  void initState() {
    getBlogData();
    super.initState();
  }

  getBlogData() async {
    var url = '${Setting().restendpoint}blog';

    var response = json.decode((await http.get(url)).body);
    response['blog'].removeRange(4, 10);

    if (this.mounted)
      setState(() {
        data = response['blog'];
      });
  }

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
          SubHeader(
            width: width,
            changePage: widget.changePage,
          ),
          SizedBox(height: 10),
          Wrap(
              children: data.map((e) {
            var index = data.indexOf(e);
            return TouchableOpacity(
              activeOpacity: .7,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailBlog(id: e['linkId']),
                  ),
                );
              },
              child: Container(
                width: width * .45,
                margin:
                    EdgeInsets.only(right: index % 2 == 0 ? 12 : 0, bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.network(e['image'],
                        fit: BoxFit.cover, height: width * .30),
                    SizedBox(height: 5),
                    Text(
                      e['title'],
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
                      e['sub'],
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
                      e['date'],
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
            );
          }).toList()
              // <Widget>[
              //   Container(
              //     width: width * .45,
              //     margin: EdgeInsets.only(right: 12, bottom: 12),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: <Widget>[
              //         Image.network(
              //             'https://i0.wp.com/samehadaku.vip/wp-content/uploads/2020/05/Go-toubun-no-hanayome-9.jpg?quality=100',
              //             fit: BoxFit.cover,
              //             height: width * .30),
              //         SizedBox(height: 5),
              //         Text(
              //           'Season Kedua Anime Go Toubun no Hanayome Ditunda Penayangan',
              //           style: GoogleFonts.roboto(
              //             fontSize: 13,
              //             color: Theme.of(context)
              //                 .textSelectionColor
              //                 .withOpacity(.77),
              //           ),
              //           maxLines: 2,
              //           overflow: TextOverflow.ellipsis,
              //         ),
              //         SizedBox(height: 5),
              //         Text(
              //           'Dilansir dari situs website dan akun twitter resmi untuk...',
              //           style: GoogleFonts.roboto(
              //               fontSize: 13,
              //               fontWeight: FontWeight.w300,
              //               color: Theme.of(context)
              //                   .textSelectionColor
              //                   .withOpacity(.71)),
              //           maxLines: 2,
              //           overflow: TextOverflow.ellipsis,
              //         ),
              //         SizedBox(height: 5),
              //         Text(
              //           '28 April 2020',
              //           style: GoogleFonts.roboto(
              //               fontSize: 13,
              //               fontWeight: FontWeight.w300,
              //               fontStyle: FontStyle.italic,
              //               color: Theme.of(context)
              //                   .textSelectionColor
              //                   .withOpacity(.71)),
              //           maxLines: 1,
              //           textAlign: TextAlign.left,
              //           overflow: TextOverflow.ellipsis,
              //         ),
              //       ],
              //     ),
              //   ),
              //   Container(
              //     width: width * .45,
              //     margin: EdgeInsets.only(bottom: 12),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: <Widget>[
              //         Image.network(
              //             'https://i0.wp.com/samehadaku.vip/wp-content/uploads/2020/05/Go-toubun-no-hanayome-9.jpg?quality=100',
              //             fit: BoxFit.cover,
              //             height: width * .30),
              //         SizedBox(height: 5),
              //         Text(
              //           'Season Kedua Anime Go Toubun no Hanayome Ditunda Penayangan',
              //           style: GoogleFonts.roboto(
              //             fontSize: 13,
              //             color: Theme.of(context)
              //                 .textSelectionColor
              //                 .withOpacity(.77),
              //           ),
              //           maxLines: 2,
              //           overflow: TextOverflow.ellipsis,
              //         ),
              //         SizedBox(height: 5),
              //         Text(
              //           'Dilansir dari situs website dan akun twitter resmi untuk...',
              //           style: GoogleFonts.roboto(
              //               fontSize: 13,
              //               fontWeight: FontWeight.w300,
              //               color: Theme.of(context)
              //                   .textSelectionColor
              //                   .withOpacity(.71)),
              //           maxLines: 2,
              //           overflow: TextOverflow.ellipsis,
              //         ),
              //         SizedBox(height: 5),
              //         Text(
              //           '28 April 2020',
              //           style: GoogleFonts.roboto(
              //               fontSize: 13,
              //               fontWeight: FontWeight.w300,
              //               fontStyle: FontStyle.italic,
              //               color: Theme.of(context)
              //                   .textSelectionColor
              //                   .withOpacity(.71)),
              //           maxLines: 1,
              //           textAlign: TextAlign.left,
              //           overflow: TextOverflow.ellipsis,
              //         ),
              //       ],
              //     ),
              //   ),
              //   Container(
              //     width: width * .45,
              //     margin: EdgeInsets.only(right: 12, bottom: 12),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: <Widget>[
              //         Image.network(
              //             'https://i0.wp.com/samehadaku.vip/wp-content/uploads/2020/05/Go-toubun-no-hanayome-9.jpg?quality=100',
              //             fit: BoxFit.cover,
              //             height: width * .30),
              //         SizedBox(height: 5),
              //         Text(
              //           'Season Kedua Anime Go Toubun no Hanayome Ditunda Penayangan',
              //           style: GoogleFonts.roboto(
              //             fontSize: 13,
              //             color: Theme.of(context)
              //                 .textSelectionColor
              //                 .withOpacity(.77),
              //           ),
              //           maxLines: 2,
              //           overflow: TextOverflow.ellipsis,
              //         ),
              //         SizedBox(height: 5),
              //         Text(
              //           'Dilansir dari situs website dan akun twitter resmi untuk...',
              //           style: GoogleFonts.roboto(
              //               fontSize: 13,
              //               fontWeight: FontWeight.w300,
              //               color: Theme.of(context)
              //                   .textSelectionColor
              //                   .withOpacity(.71)),
              //           maxLines: 2,
              //           overflow: TextOverflow.ellipsis,
              //         ),
              //         SizedBox(height: 5),
              //         Text(
              //           '28 April 2020',
              //           style: GoogleFonts.roboto(
              //               fontSize: 13,
              //               fontWeight: FontWeight.w300,
              //               fontStyle: FontStyle.italic,
              //               color: Theme.of(context)
              //                   .textSelectionColor
              //                   .withOpacity(.71)),
              //           maxLines: 1,
              //           textAlign: TextAlign.left,
              //           overflow: TextOverflow.ellipsis,
              //         ),
              //       ],
              //     ),
              //   ),
              //   Container(
              //     width: width * .45,
              //     margin: EdgeInsets.only(bottom: 12),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: <Widget>[
              //         Image.network(
              //             'https://i0.wp.com/samehadaku.vip/wp-content/uploads/2020/05/Go-toubun-no-hanayome-9.jpg?quality=100',
              //             fit: BoxFit.cover,
              //             height: width * .30),
              //         SizedBox(height: 5),
              //         Text(
              //           'Season Kedua Anime Go Toubun no Hanayome Ditunda Penayangan',
              //           style: GoogleFonts.roboto(
              //             fontSize: 13,
              //             color: Theme.of(context)
              //                 .textSelectionColor
              //                 .withOpacity(.77),
              //           ),
              //           maxLines: 2,
              //           overflow: TextOverflow.ellipsis,
              //         ),
              //         SizedBox(height: 5),
              //         Text(
              //           'Dilansir dari situs website dan akun twitter resmi untuk...',
              //           style: GoogleFonts.roboto(
              //               fontSize: 13,
              //               fontWeight: FontWeight.w300,
              //               color: Theme.of(context)
              //                   .textSelectionColor
              //                   .withOpacity(.71)),
              //           maxLines: 2,
              //           overflow: TextOverflow.ellipsis,
              //         ),
              //         SizedBox(height: 5),
              //         Text(
              //           '28 April 2020',
              //           style: GoogleFonts.roboto(
              //               fontSize: 13,
              //               fontWeight: FontWeight.w300,
              //               fontStyle: FontStyle.italic,
              //               color: Theme.of(context)
              //                   .textSelectionColor
              //                   .withOpacity(.71)),
              //           maxLines: 1,
              //           textAlign: TextAlign.left,
              //           overflow: TextOverflow.ellipsis,
              //         ),
              //       ],
              //     ),
              //   ),
              // ],
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
    this.changePage,
  }) : super(key: key);

  final double width;
  final Function changePage;

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
                TouchableOpacity(
                  onTap: () => changePage(3),
                  activeOpacity: .7,
                  child: Container(
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
