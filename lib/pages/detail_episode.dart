import 'package:Samehadaku/pages/browser.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import './../components/detail_header.dart';

class DetailEpisode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Header(width: width),
              SizedBox(height: 10),
              TextTitle(width: width),
              Divider(width: width),
              Thumbnail(width: width),
              TextEpisode(),
              Poster(width: width),
              PrevAllNext(width: width),
              AllEpisode(width: width),
              Container(
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
                      children: <Widget>[
                        Image.network(
                          'https://i0.wp.com/samehadaku.vip/wp-content/uploads/2020/04/106229.jpg?quality=100',
                          width: width * .44,
                          height: width * .57,
                          fit: BoxFit.cover,
                        ),
                        Image.network(
                          'https://i0.wp.com/samehadaku.vip/wp-content/uploads/2020/04/106229.jpg?quality=100',
                          width: width * .44,
                          height: width * .57,
                          fit: BoxFit.cover,
                        ),
                      ],
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
              )
            ],
          ),
        ),
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
                  color: Colors.black),
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
          TouchableOpacity(
            activeOpacity: .7,
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  alignment: Alignment.bottomCenter,
                  child: Browser(),
                ),
              );
            },
            child: Container(
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
  }) : super(key: key);

  final double width;

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
        'https://i0.wp.com/samehadaku.vip/wp-content/uploads/2020/05/2020-05-10_00-42-44.jpg?quality=100',
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
          Icon(Icons.play_arrow,
              size: 24,
              color: Theme.of(context).textSelectionColor.withOpacity(.5)),
          SizedBox(width: 5),
          Text(
            'Episode 4',
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
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .1),
      child: Text(
        'Kaguya-sama wa Kokurasetai?: Tensai-tachi no Renai Zunousen Episode 4 Subtitle Indonesia',
        style: GoogleFonts.poppins(
          fontSize: 16,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
