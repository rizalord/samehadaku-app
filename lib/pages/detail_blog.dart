import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../setting.dart';
import './../components/detail_header.dart';
import 'package:http/http.dart' as http;

class DetailBlog extends StatefulWidget {
  final String id;

  DetailBlog({this.id});

  @override
  _DetailBlogState createState() => _DetailBlogState();
}

class _DetailBlogState extends State<DetailBlog> {
  Map data;

  @override
  void initState() {
    initData();
    super.initState();
  }

  initData() async {
    var url = Setting().restendpoint + 'blog/read/${widget.id}';

    var response = json.decode((await http.get(url)).body);

    if (this.mounted)
      setState(() {
        data = response;
      });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: data == null
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Header(width: width),
                    SizedBox(height: 10),
                    TextTitle(width: width, title: data['title']),
                    Divider(width: width),
                    Author(
                        width: width,
                        author: data['author'],
                        date: data['date_created']),
                    Thumbnail(width: width, image: data['image_cover']),
                    Divider(width: width, more: true),
                    ListParagraph(width: width, data: data['content']),
                    Tags(width: width, data: data['tags']),
                    Footer(width: width)
                  ],
                ),
              ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Center(
            child: Container(
              height: 2,
              width: width * .1,
              color: Theme.of(context).textSelectionColor.withOpacity(.21),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              'Reached End of Page',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Theme.of(context).textSelectionColor.withOpacity(.53),
              ),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class Tags extends StatelessWidget {
  const Tags({
    Key key,
    @required this.width,
    this.data,
  }) : super(key: key);

  final double width;
  final List data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: width * .05,
        right: width * .05,
        bottom: 12,
        top: 5,
      ),
      width: width,
      child: Wrap(
        direction: Axis.horizontal,
        runAlignment: WrapAlignment.start,
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        spacing: 10,
        children: data
            .map(
              (e) => Tag(
                text: e['title'],
                isMain: e['active'],
              ),
            )
            .toList(),
      ),
    );
  }
}

class Tag extends StatelessWidget {
  const Tag({Key key, this.text, this.isMain = false}) : super(key: key);

  final String text;
  final bool isMain;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isMain ? Colors.blue : Color(0xFFE8E8E8),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5,
      ),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Icons.local_offer,
            size: 14,
            color: isMain ? Colors.white : Color(0xFF999999),
          ),
          SizedBox(width: 5),
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: isMain ? Colors.white : Color(0xFF999999),
            ),
          )
        ],
      ),
    );
  }
}

class ListParagraph extends StatelessWidget {
  ListParagraph({
    Key key,
    @required this.width,
    this.data,
  }) : super(key: key);

  final double width;
  final List data;
  bool image = false;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (ctx, idx) => Container(
          margin: EdgeInsets.only(
            left: width * .05,
            right: width * .05,
            bottom: 12,
          ),
          child: data[idx]['img'] == null
              ? Text(
                  data[idx]['text'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color:
                        Theme.of(context).textSelectionColor.withOpacity(.75),
                  ),
                )
              : Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      data[idx]['text'].trim() == ''
                          ? Container()
                          : Text(
                              'Kohei Amasaki sebagai Kanata Hjuger',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Theme.of(context)
                                    .textSelectionColor
                                    .withOpacity(.75),
                              ),
                            ),
                      data[idx]['text'].trim() == ''
                          ? Container()
                          : SizedBox(height: 7.5),
                      Image.network(
                        data[idx]['img'],
                        width: width,
                        height: width * .5,
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class Author extends StatelessWidget {
  const Author({
    Key key,
    @required this.width,
    this.author,
    this.date,
  }) : super(key: key);

  final double width;
  final String author, date;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: EdgeInsets.only(bottom: 7, top: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.account_circle,
            size: 15,
            color: Colors.black.withOpacity(.34),
          ),
          SizedBox(width: 7),
          Text(
            '$author  - $date',
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: Theme.of(context).textSelectionColor.withOpacity(.34),
            ),
          )
        ],
      ),
    );
  }
}

class AllEpisode extends StatelessWidget {
  const AllEpisode({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 26, bottom: 26),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            blurRadius: 4,
            offset: Offset(0, 4),
            color: Colors.black.withOpacity(.13)),
        BoxShadow(
            blurRadius: 4,
            offset: Offset(0, -4),
            color: Colors.black.withOpacity(.02))
      ]),
      // MKV , MP4 , x265
      child: Column(
        children: <Widget>[
          SingleFormat(width: width),
          SingleFormat(width: width),
          SingleFormat(width: width),
        ],
      ),
    );
  }
}

class SingleFormat extends StatelessWidget {
  const SingleFormat({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      // Quality
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 12, top: 18),
            child: Text(
              'MKV',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SingleQuality(width: width),
          SingleQuality(width: width),
          SingleQuality(width: width),
          SingleQuality(width: width),
        ],
      ),
    );
  }
}

class SingleQuality extends StatelessWidget {
  const SingleQuality({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
      child: Row(
        children: <Widget>[
          Container(
            width: width * .27,
            height: 40,
            color: Colors.lightBlue,
            alignment: Alignment.center,
            child: Text(
              '360P',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            width: (width * .21),
            height: 40,
            color: Color(0xFFEFEFEF),
            alignment: Alignment.center,
            child: Text(
              'ZS',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.lightBlue,
              ),
            ),
          ),
          Container(
            width: (width * .21),
            height: 40,
            color: Color(0xFFEFEFEF),
            alignment: Alignment.center,
            child: Text(
              'GD',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.lightBlue,
              ),
            ),
          ),
          Container(
            width: (width * .21),
            height: 40,
            color: Color(0xFFEFEFEF),
            alignment: Alignment.center,
            child: Text(
              'RU',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.lightBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PrevAllNext extends StatelessWidget {
  const PrevAllNext({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: width,
      height: 45,
      color: Color(0xFFf6f6f6),
      child: Row(
        children: <Widget>[
          Container(
            width: width * .33,
            child: Center(
              child: Icon(Icons.chevron_left),
            ),
          ),
          Container(
            width: width * .33,
            color: Colors.lightBlue,
            child: Center(
              child: Text(
                'All Episode',
                style: GoogleFonts.roboto(fontSize: 14, color: Colors.white),
              ),
            ),
          ),
          Container(
            width: width * .33,
            child: Center(
              child: Icon(Icons.chevron_right),
            ),
          ),
        ],
      ),
    );
  }
}

class Poster extends StatelessWidget {
  const Poster({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .1, vertical: 10),
      child: Text(
        'Diposting oleh ktyg - 19 jam yang lalu',
        style: GoogleFonts.roboto(
          fontSize: 14,
          color: Color(0xFF666666),
        ),
      ),
    );
  }
}

class Thumbnail extends StatelessWidget {
  const Thumbnail({
    Key key,
    @required this.width,
    this.image,
  }) : super(key: key);

  final double width;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 6, bottom: 10),
      width: width,
      height: width * .63,
      decoration: BoxDecoration(
        color: Colors.grey,
      ),
      child: Image.network(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}

class TextEpisode extends StatelessWidget {
  const TextEpisode({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.play_arrow, size: 24, color: Colors.black.withOpacity(.5)),
          SizedBox(width: 5),
          Text(
            'Episode 4',
            style: GoogleFonts.roboto(
              fontSize: 16,
              color: Colors.black.withOpacity(.5),
            ),
          ),
          SizedBox(width: 7),
          Container(
            padding: EdgeInsets.symmetric(vertical: 1.5, horizontal: 4),
            decoration: BoxDecoration(
              color: Color(0xFFEBEBEB),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Text(
              'SUB',
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: Colors.black.withOpacity(.5),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Divider extends StatelessWidget {
  const Divider({
    Key key,
    @required this.width,
    this.more = false,
  }) : super(key: key);

  final double width;
  final bool more;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 1,
      color: Theme.of(context).textSelectionColor.withOpacity(.2),
      margin: EdgeInsets.symmetric(
        horizontal: more ? width * .05 : width * .1,
        vertical: 14,
      ),
    );
  }
}

class TextTitle extends StatelessWidget {
  const TextTitle({
    Key key,
    @required this.width,
    this.title,
  }) : super(key: key);

  final double width;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .1),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 16,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
