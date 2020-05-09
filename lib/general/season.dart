import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './../components/season_header.dart';

class Season extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Header(),
            SizedBox(height: 24),
            GridView.count(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: (itemWidth / itemHeight),
              padding: EdgeInsets.symmetric(horizontal: 12),
              crossAxisSpacing: 10,
              mainAxisSpacing: 15,
              children: <Widget>[
                GridSingleItem(itemHeight: itemHeight),
                GridSingleItem(itemHeight: itemHeight),
                GridSingleItem(itemHeight: itemHeight),
                GridSingleItem(itemHeight: itemHeight),
              ],
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class GridSingleItem extends StatelessWidget {
  const GridSingleItem({
    Key key,
    @required this.itemHeight,
  }) : super(key: key);

  final double itemHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ImageSeason(itemHeight: itemHeight),
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
            'Ongoing',
            style: GoogleFonts.roboto(
              fontSize: 15,
              color: Colors.black.withOpacity(.46),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class ImageSeason extends StatelessWidget {
  const ImageSeason({
    Key key,
    @required this.itemHeight,
  }) : super(key: key);

  final double itemHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: itemHeight / 1.38,
      width: 200,
      color: Colors.grey,
      margin: EdgeInsets.only(bottom: 7),
      child: Stack(
        children: <Widget>[
          Image.network(
            'https://i0.wp.com/samehadaku.vip/wp-content/uploads/2020/05/106945.jpg?quality=100',
            fit: BoxFit.cover,
            height: itemHeight / 1.38,
            width: 200,
          ),
          Positioned(
            left: 10,
            bottom: 10,
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
            right: 10,
            bottom: 10,
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
          )
        ],
      ),
    );
  }
}
