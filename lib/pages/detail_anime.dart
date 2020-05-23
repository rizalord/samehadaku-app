import 'dart:convert';

import 'package:Samehadaku/pages/detail_episode.dart';
import 'package:Samehadaku/pages/show_more_page.dart';
import 'package:Samehadaku/setting.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import './../components/detail_header.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;

class DetailAnime extends StatefulWidget {
  final String url;

  DetailAnime({this.url});

  @override
  _DetailAnimeState createState() => _DetailAnimeState();
}

class _DetailAnimeState extends State<DetailAnime> {
  Map data;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    var url = '${Setting().restendpoint}anime/${widget.url}/';

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
                    Header(width: width),
                    AnimeHeader(
                      width: width,
                      image: data['image'],
                      title: data['title'],
                      ratingValue: data['ratingValue'],
                      ratingCount: data['ratingCount'],
                    ),
                    Sinopsis(
                      width: width,
                      text: data['sinopsis'],
                    ),
                    Detail(
                        width: width,
                        genre: data['genre'],
                        detail: data['detail']),
                    YoutubePlay(
                      width: width,
                      id: data['youtube']['id'],
                    ),
                    EpisodeList(
                      width: width,
                      data: data['list_episode'],
                    ),
                    Rekomendasi(
                      width: width,
                      data: data['recommend'],
                    ),
                    LatestUpdate(
                      width: width,
                      data: data['latest'].sublist(0, 5)..shuffle(),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}

class LatestUpdate extends StatelessWidget {
  const LatestUpdate({Key key, @required this.width, this.data})
      : super(key: key);

  final double width;
  final List data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: (width * .6) + 59,
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            offset: Offset(0, 4),
            color: Colors.black.withOpacity(.11),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Update Terbaru',
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    color: Color(0xFF2F2F2F),
                  ),
                ),
                TouchableOpacity(
                  activeOpacity: .7,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShowMorePage()));
                  },
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
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, idx) => Container(
                width: width * .5,
                height: width,
                margin: EdgeInsets.only(
                    left: 16, right: idx == data.length - 1 ? 16 : 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          data[idx]['image'],
                          fit: BoxFit.cover,
                          width: width * .5,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      data[idx]['title'],
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black.withOpacity(.85),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      data[idx]['genre'].sublist(0, 2).join(', '),
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.black.withOpacity(.53),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 18),
          Container(
            width: width,
            alignment: Alignment.center,
            child: Container(
              width: width * .1,
              height: 2,
              color: Colors.black.withOpacity(.21),
            ),
          ),
          SizedBox(height: 8),
          Center(
            child: Text(
              'Reached End of Page',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Colors.black.withOpacity(.59),
              ),
            ),
          ),
          SizedBox(height: 6),
        ],
      ),
    );
  }
}

class Rekomendasi extends StatelessWidget {
  const Rekomendasi({Key key, @required this.width, this.data})
      : super(key: key);

  final double width;
  final List data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width * .6,
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            offset: Offset(0, 4),
            color: Colors.black.withOpacity(.11),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 16),
            child: Text(
              'Rekomendasi',
              style: GoogleFonts.poppins(
                fontSize: 17,
                color: Color(0xFF2F2F2F),
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, idx) => Container(
                width: width * .5,
                height: width,
                margin: EdgeInsets.only(
                    left: 16, right: idx == data.length - 1 ? 16 : 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          data[idx]['image'],
                          fit: BoxFit.cover,
                          width: width * .5,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      data[idx]['title'],
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black.withOpacity(.85),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      data[idx]['genre'].sublist(0, 2).join(', '),
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.black.withOpacity(.53),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class EpisodeList extends StatelessWidget {
  const EpisodeList({Key key, this.width, this.data}) : super(key: key);

  final double width;
  final List data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      // height: width * .5,
      margin: EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            offset: Offset(0, 4),
            color: Colors.black.withOpacity(.11),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Daftar Episode',
            style: GoogleFonts.poppins(
              fontSize: 17,
              color: Color(0xFF2F2F2F),
            ),
          ),
          SizedBox(height: 16),
          Flexible(
            fit: FlexFit.loose,
            child: Column(
                children: data
                    .map((e) => SingleLink(
                        width: width,
                        number: e['episode'],
                        title: e['title'],
                        date: e['date_uploaded'],
                        id: e['id'],
                        link: e['link']))
                    .toList()),
          )
        ],
      ),
    );
  }
}

class SingleLink extends StatelessWidget {
  const SingleLink(
      {Key key,
      @required this.width,
      this.number,
      this.title,
      this.date,
      this.id,
      this.link})
      : super(key: key);

  final double width;
  final String number, title, date, id, link;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      activeOpacity: .9,
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: DetailEpisode(
              link: link,
            ),
          ),
        );
      },
      child: Container(
        width: width,
        margin: EdgeInsets.only(bottom: 8),
        height: 45,
        child: Row(
          children: <Widget>[
            Container(
              width: 45,
              height: 45,
              color: Colors.lightBlue,
              alignment: Alignment.center,
              child: Text(
                number,
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF535353).withOpacity(.83),
                    ),
                  ),
                  Text(
                    date,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                        fontSize: 13, color: Colors.black.withOpacity(.34)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class YoutubePlay extends StatefulWidget {
  YoutubePlay({
    this.width,
    this.id,
  });

  final double width;
  final String id;

  @override
  _YoutubePlayState createState() => _YoutubePlayState();
}

class _YoutubePlayState extends State<YoutubePlay> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.id,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
      width: widget.width,
      height: widget.width * .53,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: Colors.red),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            offset: Offset(0, 4),
            color: Colors.black.withOpacity(.11),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(9),
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.lightBlue,
          progressColors: ProgressBarColors(
            playedColor: Colors.lightBlue,
            handleColor: Colors.lightBlueAccent,
          ),
        ),
      ),
    );
  }
}

class Detail extends StatefulWidget {
  Detail({
    Key key,
    @required this.width,
    this.genre,
    this.detail,
  }) : super(key: key);

  final double width;
  final List genre;
  final Map detail;

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  double width;
  bool _visible = false;
  List detail = [];

  @override
  void initState() {
    width = widget.width;
    initDetail();
    super.initState();
  }

  initDetail() {
    widget.detail.forEach((key, value) {
      detail.add({'key': key, 'value': value});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 20),
            padding: EdgeInsets.only(
                top: 14, left: 14, right: 14, bottom: !_visible ? 30 : 14),
            width: widget.width,
            // height: width * .7,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  color: Colors.black.withOpacity(.11),
                ),
              ],
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  // height: 1000,
                  child: Wrap(
                    direction: Axis.vertical,
                    runAlignment: WrapAlignment.start,
                    children: <Widget>[
                      Text(
                        'Genre',
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          color: Color(0xFF2F2F2F),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: widget.width,
                        child: Wrap(
                          children: widget.genre
                              .map((e) => SingleGenre(text: e['text']))
                              .toList(),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Anime Detail',
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          color: Color(0xFF2F2F2F),
                        ),
                      ),
                      SizedBox(height: 8),
                      Visibility(
                        visible: _visible,
                        child: Wrap(
                          direction: Axis.vertical,
                          children: detail
                              .map((e) => DetailText(e['key'], e['value']))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                !_visible
                    ? Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white.withOpacity(.1),
                                Colors.white.withOpacity(.8),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          !_visible
              ? Positioned(
                  bottom: 0,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.lightBlue,
                    ),
                    alignment: Alignment.center,
                    child: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _visible = true;
                        });
                      },
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

class DetailText extends StatelessWidget {
  final String first, second;

  DetailText(this.first, this.second);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            first,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: Colors.black.withOpacity(.5),
            ),
          ),
          Text(
            second,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: Colors.black.withOpacity(.5),
            ),
          )
        ],
      ),
    );
  }
}

class SingleGenre extends StatelessWidget {
  SingleGenre({Key key, this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      margin: EdgeInsets.only(right: 12, bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 1, color: Colors.lightBlue),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
            fontWeight: FontWeight.w300,
            fontSize: 13,
            color: Colors.black.withOpacity(.75)),
      ),
    );
  }
}

class Sinopsis extends StatefulWidget {
  Sinopsis({
    Key key,
    @required this.width,
    this.text,
  }) : super(key: key);

  final double width;
  final String text;

  @override
  _SinopsisState createState() => _SinopsisState();
}

class _SinopsisState extends State<Sinopsis> {
  // String sinopsisText =
  //     'Shingo Ichinomiya, seorang pria berusia 25 tahun yang bekerja di sebuah perusahaan firma, sambil memikirkan hari kerja besok yang sibuk, dia pergi tidur. Namun, ketika dia bangun, dia mendapati Shingo Ichinomiya, seorang pria berusia 25 tahun yang bekerja di sebuah perusahaan firma, sambil memikirkan hari kerja besok yang sibuk, dia pergi tidur.';

  bool overflow = true;
  double width = 0;

  @override
  void initState() {
    setState(() {
      width = widget.width;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        var text = widget.text;
        final span = TextSpan(
          text: text,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w300,
            fontSize: 14,
            color: Colors.black.withOpacity(.69),
          ),
        );
        final tp = TextPainter(
            text: span, maxLines: 7, textDirection: TextDirection.ltr);
        tp.layout(maxWidth: size.maxWidth);

        if (tp.didExceedMaxLines && overflow == true) {
          overflow = true;

          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  padding:
                      EdgeInsets.only(top: 14, left: 14, right: 14, bottom: 30),
                  width: widget.width,
                  // height: width * .7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        color: Colors.black.withOpacity(.11),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Sinopsis',
                              style: GoogleFonts.poppins(
                                fontSize: 17,
                                color: Color(0xFF2F2F2F),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              text,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                                color: Colors.black.withOpacity(.69),
                              ),
                              maxLines: 7,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white.withOpacity(0),
                                Colors.white.withOpacity(.99),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.lightBlue,
                  ),
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        overflow = false;
                      });
                    },
                  ),
                ),
              ),
            ],
          );
        } else {
          overflow = false;

          return Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
            width: widget.width,
            // height: width * .7,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  color: Colors.black.withOpacity(.11),
                ),
              ],
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Sinopsis',
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          color: Color(0xFF2F2F2F),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        text,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          color: Colors.black.withOpacity(.69),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }
      },

      // child: Stack(
      //   children: <Widget>[
      //     Container(
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: <Widget>[
      //           Text(
      //             'Sinopsis',
      //             style: GoogleFonts.poppins(
      //               fontSize: 17,
      //               color: Color(0xFF2F2F2F),
      //             ),
      //           ),
      //           SizedBox(height: 8),
      //           Text(
      //             'Shingo Ichinomiya, seorang pria berusia 25 tahun yang bekerja di sebuah perusahaan firma, sambil memikirkan hari kerja besok yang sibuk, dia pergi tidur. Namun, ketika dia bangun, dia mendapati',
      //             style: GoogleFonts.poppins(
      //               fontWeight: FontWeight.w300,
      //               fontSize: 14,
      //               color: Colors.black.withOpacity(.69),
      //             ),
      //           ),
      //         ],
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}

class AnimeHeader extends StatelessWidget {
  const AnimeHeader({
    Key key,
    @required this.width,
    this.title,
    this.image,
    this.ratingCount,
    this.ratingValue,
  }) : super(key: key);

  final double width;
  final String image, title, ratingValue, ratingCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width * .5,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: <Widget>[
          Container(
            width: width * .35,
            height: width * .5,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.lightBlue, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 5),
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Theme.of(context).textSelectionColor,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Ongoing',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Theme.of(context)
                              .textSelectionColor
                              .withOpacity(.53),
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.star, color: Colors.yellow, size: 24),
                            SizedBox(width: 5),
                            Text(
                              ratingValue,
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF828282),
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              ' / $ratingCount',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w300,
                                color: Color(0xFF6F6F6F),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.lightBlue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                        child: Text(
                          'Episode Pertama',
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        onPressed: () {},
                      ),
                      Container(
                        width: 37,
                        height: 37,
                        decoration: BoxDecoration(
                            color: Color(0xFF565656),
                            borderRadius: BorderRadius.circular(7)),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.share,
                          color: Colors.white,
                          size: 24,
                        ),
                      )
                    ],
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
