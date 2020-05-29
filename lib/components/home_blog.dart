import 'dart:convert';

import 'package:Samehadaku/components/shimmer/blog_card_shimmer.dart';
import 'package:Samehadaku/pages/detail_blog.dart';
import 'package:Samehadaku/setting.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
          data.isEmpty
              // LOADING
              ? Wrap(
                  children: [1, 2, 3, 4].map((e) {
                    var index = [1, 2, 3, 4].indexOf(e);
                    return BlogCardShimmer(width: width, index: index);
                  }).toList(),
                )
              // LOADED
              : Wrap(
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
                        margin: EdgeInsets.only(
                            right: index % 2 == 0 ? 12 : 0, bottom: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            CachedNetworkImage(
                              imageUrl: e['image'],
                              fit: BoxFit.cover,
                              height: width * .30,
                              placeholder: (ctx, proggress) => Container(
                                width: width * .45,
                                height: width * .30,
                                color: Colors.grey.withOpacity(.15),
                              ),
                            ),
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
                  }).toList(),
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
