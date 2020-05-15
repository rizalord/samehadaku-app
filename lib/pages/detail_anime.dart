import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './../components/detail_header.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailAnime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Header(width: width),
              AnimeHeader(width: width),
              Sinopsis(width: width),
              Detail(width: width),
              YoutubePlay(width: width),
              EpisodeList(width: width),
              Rekomendasi(width: width),
              LatestUpdate(width: width)
            ],
          ),
        ),
      ),
    );
  }
}

class LatestUpdate extends StatelessWidget {
  const LatestUpdate({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

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
                Container(
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Show More',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: Colors.black.withOpacity(.61),
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        size: 21,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, idx) => Container(
                width: width * .5,
                height: width,
                margin: EdgeInsets.only(left: 16, right: idx == 2 ? 16 : 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://i0.wp.com/samehadaku.vip/wp-content/uploads/2020/04/106370.jpg?quality=80&resize=150,210',
                          fit: BoxFit.cover,
                          width: width * .5,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '/Blush-DC: Himitsu',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black.withOpacity(.85),
                      ),
                    ),
                    Text(
                      'Sports, Comedy',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.black.withOpacity(.53),
                      ),
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
  const Rekomendasi({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

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
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, idx) => Container(
                width: width * .5,
                height: width,
                margin: EdgeInsets.only(left: 16, right: idx == 2 ? 16 : 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://i0.wp.com/samehadaku.vip/wp-content/uploads/2020/04/106370.jpg?quality=80&resize=150,210',
                          fit: BoxFit.cover,
                          width: width * .5,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '/Blush-DC: Himitsu',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black.withOpacity(.85),
                      ),
                    ),
                    Text(
                      'Sports, Comedy',
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
  const EpisodeList({Key key, this.width}) : super(key: key);

  final double width;

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
              children: <Widget>[
                SingleLink(width: width),
                SingleLink(width: width),
                SingleLink(width: width),
                SingleLink(width: width),
                SingleLink(width: width),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SingleLink extends StatelessWidget {
  const SingleLink({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              '5',
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
                  'Hachi-nan tte, Sore wa Nai deshou Episode 5',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF535353).withOpacity(.83),
                  ),
                ),
                Text(
                  '1 Mei 2020',
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
    );
  }
}

class YoutubePlay extends StatelessWidget {
  YoutubePlay({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'uPo9Cvigf_c',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
      width: width,
      height: width * .53,
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
  }) : super(key: key);

  final double width;

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  double width;
  bool _visible = false;

  @override
  void initState() {
    width = widget.width;
    super.initState();
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
                          children: <Widget>[
                            SingleGenre(text: 'Action'),
                            SingleGenre(text: 'Adventure'),
                            SingleGenre(text: 'Drama'),
                            SingleGenre(text: 'Comedy'),
                            SingleGenre(text: 'Romance'),
                            SingleGenre(text: 'Fantasy'),
                          ],
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
                          children: <Widget>[
                            DetailText(
                                'English', 'The 8th son? Are you kidding me?'),
                            DetailText('Status', 'Ongoing'),
                            DetailText('Source', 'Light Novel'),
                            DetailText('Duration', '23 min. per ep.'),
                            DetailText('Total Episode', '12'),
                            DetailText('Season', 'Spring 2020'),
                            DetailText('Rilis', 'Apr 2, 2020 to ?'),
                          ],
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
  String first, second;

  DetailText(first, second) {
    this.first = first;
    this.second = second;
  }

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
  }) : super(key: key);

  final double width;

  @override
  _SinopsisState createState() => _SinopsisState();
}

class _SinopsisState extends State<Sinopsis> {
  String sinopsisText =
      'Shingo Ichinomiya, seorang pria berusia 25 tahun yang bekerja di sebuah perusahaan firma, sambil memikirkan hari kerja besok yang sibuk, dia pergi tidur. Namun, ketika dia bangun, dia mendapati Shingo Ichinomiya, seorang pria berusia 25 tahun yang bekerja di sebuah perusahaan firma, sambil memikirkan hari kerja besok yang sibuk, dia pergi tidur.';

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
        var text = sinopsisText;
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
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width * .5,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      // color: Colors.black,
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
                'https://i0.wp.com/samehadaku.vip/wp-content/uploads/2020/04/106370.jpg?quality=80&resize=150,210',
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
                        'Hachi-nan tte, Sore wa Nai deshou!',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Ongoing',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.black.withOpacity(.53),
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.star, color: Colors.yellow, size: 24),
                            SizedBox(width: 5),
                            Text(
                              '6.50',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF828282),
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              ' / 4967',
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
