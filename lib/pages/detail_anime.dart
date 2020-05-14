import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './../components/detail_header.dart';

class DetailAnime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

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
            ],
          ),
        ),
      ),
    );
  }
}

class Detail extends StatelessWidget {
  const Detail({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      padding: EdgeInsets.only(top: 14, left: 14, right: 14, bottom: 30),
      width: width,
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
                  'Genre',
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    color: Color(0xFF2F2F2F),
                  ),
                ),
                SizedBox(height: 8),
                Wrap(
                  children: <Widget>[
                    SingleGenre(text: 'Action'),
                    SingleGenre(text: 'Adventure'),
                    SingleGenre(text: 'Drama'),
                    SingleGenre(text: 'Comedy'),
                    SingleGenre(text: 'Romance'),
                    SingleGenre(text: 'Fantasy'),
                  ],
                ),
              ],
            ),
          ),
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
          // The text has more than seven lines.
          // TODO: display the prompt message

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
