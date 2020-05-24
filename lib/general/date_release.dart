import 'dart:convert';
import 'package:Samehadaku/pages/detail_anime.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import '../setting.dart';

class DateRelease extends StatefulWidget {
  @override
  _DateReleaseState createState() => _DateReleaseState();
}

class _DateReleaseState extends State<DateRelease>
    with AutomaticKeepAliveClientMixin {
  List data;

  @override
  void initState() {
    initData();
    super.initState();
  }

  initData() async {
    var url = Setting().restendpoint + 'date-release';

    var response = json.decode((await http.get(url)).body);

    if (this.mounted) {
      setState(() {
        data = response['results'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: <Widget>[
          data == null
              ? Center(child: CircularProgressIndicator())
              : Positioned.fill(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 65),
                      ]..addAll(
                          data
                              .map(
                                (e) =>
                                    SingleItem(day: e['day'], data: e['list']),
                              )
                              .toList(),
                        ),
                    ),
                  ),
                ),
          Header(width: width)
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class SingleItem extends StatelessWidget {
  const SingleItem({Key key, this.day, this.data}) : super(key: key);

  final String day;
  final List data;

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
              day,
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
            children: data
                .map(
                  (e) => SingleItemsWrap(
                      width: width,
                      image: e['image'],
                      title: e['title'],
                      genres: e['genres'],
                      score: e['score'],
                      id: e['linkId']),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}

class SingleItemsWrap extends StatelessWidget {
  const SingleItemsWrap(
      {Key key,
      @required this.width,
      this.image,
      this.title,
      this.genres,
      this.score,
      this.id})
      : super(key: key);

  final double width;
  final String image, title, score, id;
  final List genres;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      activeOpacity: 0.8,
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: DetailAnime(url: id),
          ),
        );
      },
      child: Container(
        width: width / 2 - (12 * 2) - 5,
        decoration: BoxDecoration(
            // color: Colors.grey,
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ImageRelease(
              width: width,
              image: image,
              score: score,
            ),
            Text(
              title,
              style: GoogleFonts.roboto(
                fontSize: 16,
                color: Colors.black,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 3),
            Text(
              genres.sublist(0, 2).join(', '),
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
      ),
    );
  }
}

class ImageRelease extends StatelessWidget {
  const ImageRelease({
    Key key,
    @required this.width,
    this.image,
    this.score,
  }) : super(key: key);

  final double width;
  final String image, score;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 7),
      child: Stack(
        children: <Widget>[
          Image.network(
            image,
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
                    score,
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
