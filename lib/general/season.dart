import 'dart:convert';

import 'package:Samehadaku/pages/detail_anime.dart';
import 'package:Samehadaku/setting.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import './../components/season_header.dart';
import 'package:http/http.dart' as http;

class Season extends StatefulWidget {
  @override
  _SeasonState createState() => _SeasonState();
}

class _SeasonState extends State<Season> with AutomaticKeepAliveClientMixin {
  List data;

  @override
  void initState() {
    initData();
    super.initState();
  }

  initData() async {
    var url = Setting().restendpoint + 'season';

    var response = json.decode((await http.get(url)).body);

    if (this.mounted) {
      setState(() {
        data = response['results'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      body: data == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
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
                    children: data
                        .map(
                          (element) => GridSingleItem(
                              itemHeight: itemHeight,
                              image: element['image'],
                              title: element['title'],
                              score: element['score'],
                              status: element['status'],
                              id: element['linkId']),
                        )
                        .toList(),
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class GridSingleItem extends StatelessWidget {
  const GridSingleItem(
      {Key key,
      @required this.itemHeight,
      this.image,
      this.title,
      this.score,
      this.status,
      this.id})
      : super(key: key);

  final double itemHeight;
  final String image, title, score, status, id;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: DetailAnime(url: id),
          ),
        );
      },
      activeOpacity: 0.75,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ImageSeason(
              itemHeight: itemHeight,
              image: image,
              score: score,
            ),
            Text(
              title,
              style: GoogleFonts.roboto(
                fontSize: 16,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 3),
            Text(
              status,
              style: GoogleFonts.roboto(
                fontSize: 15,
                color: Theme.of(context).textSelectionColor.withOpacity(.46),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class ImageSeason extends StatelessWidget {
  const ImageSeason(
      {Key key, @required this.itemHeight, this.image, this.score})
      : super(key: key);

  final double itemHeight;
  final String image, score;

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
            image,
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
                    score == null || score == '' ? '' : score,
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
