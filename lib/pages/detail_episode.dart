import 'dart:convert';

import 'package:Samehadaku/pages/browser.dart';
import 'package:Samehadaku/setting.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import './../components/detail_header.dart';
import 'package:http/http.dart' as http;

class DetailEpisode extends StatefulWidget {
  final String link, image;

  DetailEpisode({this.link, this.image});

  @override
  _DetailEpisodeState createState() => _DetailEpisodeState();
}

class _DetailEpisodeState extends State<DetailEpisode> {
  Map data;

  @override
  void initState() {
    initData();
    super.initState();
  }

  initData() async {
    var id = widget.link.replaceAll('https://samehadaku.vip/', '');
    var url = Setting().restendpoint + 'anime/eps/$id';
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
                  children: <Widget>[
                    Header(
                      width: width,
                      url: widget.link,
                    ),
                    SizedBox(height: 10),
                    TextTitle(width: width, title: data['title']),
                    Divider(width: width),
                    widget.image != null
                        ? Thumbnail(width: width, image: widget.image)
                        : Container(),
                    TextEpisode(eps: data['eps']),
                    Poster(
                        width: width,
                        uploader: data['uploader'],
                        date: data['date_uploaded']),
                    // PrevAllNext(width: width),
                    AllEpisode(
                        width: width,
                        title: data['title'],
                        data: data['downloadEps']),
                    Recomendation(
                        width: width, data: data['recommend'].sublist(0, 2))
                  ],
                ),
              ),
      ),
    );
  }
}

class Recomendation extends StatelessWidget {
  const Recomendation({
    Key key,
    @required this.width,
    this.data,
  }) : super(key: key);

  final double width;
  final List data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            blurRadius: 4,
            offset: Offset(0, -4),
            color: Colors.black.withOpacity(.06))
      ]),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Rekomendasi',
            style: GoogleFonts.poppins(
                fontSize: 17,
                color: Color(0xFF2F2F2F),
                fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: data
                .map((e) => Image.network(
                      e['image'],
                      width: width * .44,
                      height: width * .57,
                      fit: BoxFit.cover,
                    ))
                .toList(),
          ),
          SizedBox(height: 30),
          Center(
            child: Container(
              height: 2,
              width: width * .1,
              color: Colors.black.withOpacity(.21),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              'Reached End of Page',
              style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: Colors.black.withOpacity(.53)),
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

class AllEpisode extends StatelessWidget {
  const AllEpisode({Key key, @required this.width, this.title, this.data})
      : super(key: key);

  final double width;
  final String title;
  final List data;

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
        children: data
            .map(
              (e) => SingleFormat(
                  width: width,
                  title: title,
                  format: e['format'],
                  data: e['data']),
            )
            .toList(),
      ),
    );
  }
}

class SingleFormat extends StatelessWidget {
  const SingleFormat({
    Key key,
    @required this.width,
    this.title,
    this.format,
    this.data,
  }) : super(key: key);

  final double width;
  final String title, format;
  final List data;

  @override
  Widget build(BuildContext context) {
    return Container(
      // Quality
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 12, top: 18),
            child: Text(
              format,
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          // SingleQuality(width: width, title: title),
          // SingleQuality(width: width, title: title),
          // SingleQuality(width: width, title: title),
          // SingleQuality(width: width, title: title),
        ]..addAll(data
            .map(
              (e) => SingleQuality(
                  width: width,
                  title: title,
                  quality: e['quality'],
                  link: e['link']),
            )
            .toList()),
      ),
    );
  }
}

class SingleQuality extends StatefulWidget {
  const SingleQuality(
      {Key key, @required this.width, this.title, this.quality, this.link})
      : super(key: key);

  final double width;
  final String title, quality;
  final Map link;

  @override
  _SingleQualityState createState() => _SingleQualityState();
}

class _SingleQualityState extends State<SingleQuality> {
  List data = [];

  @override
  void initState() {
    convertLink();
    super.initState();
  }

  convertLink() {
    setState(() {
      widget.link.forEach((key, value) {
        data.add({
          'key': key == 'zippyshare' ? 'ZS' : key == 'gdrive' ? 'GD' : 'RU',
          'value': value
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
      child: Row(
        children: <Widget>[
          Container(
            width: widget.width * .27,
            height: 40,
            color: Colors.lightBlue,
            alignment: Alignment.center,
            child: Text(
              widget.quality,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ]..addAll(data
            .map(
              (e) => TouchableOpacity(
                activeOpacity: .7,
                onTap: () {
                  if (e['key'] == 'ZS')
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        alignment: Alignment.bottomCenter,
                        child: Browser(title: widget.title, url: e['value']),
                      ),
                    );
                },
                child: Container(
                  width: (widget.width * .21),
                  height: 40,
                  color: Color(0xFFEFEFEF),
                  alignment: Alignment.center,
                  child: Text(
                    e['key'],
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: e['key'] == 'ZS' ? Colors.lightBlue : Colors.black,
                      decoration: e['key'] == 'ZS'
                          ? TextDecoration.none
                          : TextDecoration.lineThrough,
                    ),
                  ),
                ),
              ),
            )
            .toList()),
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
              child: Icon(Icons.chevron_left, color: Colors.black),
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
              child: Icon(Icons.chevron_right, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class Poster extends StatelessWidget {
  const Poster({Key key, @required this.width, this.uploader, this.date})
      : super(key: key);

  final double width;
  final String uploader, date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .1, vertical: 10),
      child: Text(
        'Diposting oleh $uploader - $date',
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
      margin: EdgeInsets.only(top: 6, bottom: 14),
      width: width * .82,
      height: width * .5,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.lightBlue, width: 1),
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
    this.eps,
  }) : super(key: key);

  final String eps;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.play_arrow,
              size: 24,
              color: Theme.of(context).textSelectionColor.withOpacity(.5)),
          SizedBox(width: 5),
          Text(
            'Episode $eps',
            style: GoogleFonts.roboto(
              fontSize: 16,
              color: Theme.of(context).textSelectionColor.withOpacity(.5),
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
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 1,
      color: Colors.black.withOpacity(.08),
      margin: EdgeInsets.symmetric(horizontal: width * .1, vertical: 14),
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
