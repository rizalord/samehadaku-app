import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DateRelease extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 65),
                  SingleItem(),
                  SingleItem(),
                ],
              ),
            ),
          ),
          Header(width: width)
        ],
      ),
    );
  }
}

class SingleItem extends StatelessWidget {
  const SingleItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      // height: 200,
      margin: EdgeInsets.only(left: 12, right: 12, bottom: 20),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            blurRadius: 4,
            offset: Offset(0, 4),
            color: Colors.black.withOpacity(.11))
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: width,
            height: 45,
            color: Color(0xFFF2F2F2),
            alignment: Alignment.center,
            child: Text(
              'Rabu',
              style: GoogleFonts.roboto(fontSize: 16, color: Color(0xFF333333)),
            ),
          ),
          SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 15,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            runAlignment: WrapAlignment.start,
            children: <Widget>[
              SingleItemsWrap(width: width),
              SingleItemsWrap(width: width),
              SingleItemsWrap(width: width),
            ],
          )
        ],
      ),
    );
  }
}

class SingleItemsWrap extends StatelessWidget {
  const SingleItemsWrap({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width / 2 - (12 * 2) - 5,
      decoration: BoxDecoration(
          // color: Colors.grey,
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ImageRelease(width: width),
          Text(
            'Hachi-nan tte, Sore wa naidesu',
            style: GoogleFonts.roboto(
              fontSize: 16,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 3),
          Text(
            'School, Sports',
            style: GoogleFonts.roboto(
              fontSize: 15,
              color: Colors.black.withOpacity(.46),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8),
          Container(
            height: 32,
            width: width / 2 - (12 * 2) - 5,
            color: Color(0xFFF1F1F1),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.play_arrow, size: 20, color: Color(0xFF888888)),
                SizedBox(width: 2),
                Text(
                  'Update',
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: Color(0xFF888888),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ImageRelease extends StatelessWidget {
  const ImageRelease({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 7),
      child: Stack(
        children: <Widget>[
          Image.network(
            'https://i0.wp.com/samehadaku.vip/wp-content/uploads/2020/05/103429.jpg?quality=100',
            fit: BoxFit.cover,
            height: width / 2.8,
            width: width / 2 - (12 * 2) - 5,
          ),
          Positioned(
            left: 7,
            bottom: 7,
            child: Container(
              height: 29,
              width: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xFF0F5DE2),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Text(
                'TV',
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            right: 7,
            bottom: 7,
            child: Container(
              height: 29,
              padding: EdgeInsets.symmetric(horizontal: 6),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.73),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(
                    Icons.star,
                    color: Color(0xFFFFF500),
                    size: 18,
                  ),
                  Text(
                    '6.50',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: Container(
        width: width,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(360),
            bottomRight: Radius.circular(360),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          'Jadwal Rilis',
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
