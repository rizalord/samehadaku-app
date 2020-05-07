import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './mini_component/dots.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: (MediaQuery.of(context).size.width * .65) + 40,
      padding: EdgeInsets.symmetric(vertical: 12),
      // margin: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TitleMusim(),
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(
                  height: MediaQuery.of(context).size.width * .65,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  enableInfiniteScroll: false,
                  initialPage: 0,
                  autoPlay: true,
                  onPageChanged: (int index, reason) {
                    setState(() {
                      this.index = index;
                    });
                  }),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return CarouselSingle();
                  },
                );
              }).toList(),
            ),
          ),
          DotsBottom(index: index)
        ],
      ),
    );
  }
}

class TitleMusim extends StatelessWidget {
  const TitleMusim({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 30,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 12, bottom: 4),
      child: Text(
        'Anime Musim Ini',
        style: Theme.of(context).textTheme.headline1,
        textAlign: TextAlign.left,
      ),
    );
  }
}

class DotsBottom extends StatelessWidget {
  const DotsBottom({
    Key key,
    @required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      margin: EdgeInsets.only(top: 15),
      width: 15 * 5.5,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, idx) => Dots(
          color: idx == index
              ? Theme.of(context).sliderTheme.activeTrackColor
              : Theme.of(context).sliderTheme.disabledActiveTrackColor,
        ),
        scrollDirection: Axis.horizontal,
      ),
      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: <Widget>[
      // Dots(color: Theme.of(context).sliderTheme.activeTrackColor),
      //     Dots(
      //         color:
      //             Theme.of(context).sliderTheme.disabledActiveTrackColor),
      //     Dots(
      //         color:
      //             Theme.of(context).sliderTheme.disabledActiveTrackColor),
      //     Dots(
      //         color:
      //             Theme.of(context).sliderTheme.disabledActiveTrackColor),
      //     Dots(
      //         color:
      //             Theme.of(context).sliderTheme.disabledActiveTrackColor),
      //   ],
      // ),
    );
  }
}

class CarouselSingle extends StatelessWidget {
  const CarouselSingle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 12.0),
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://m.media-amazon.com/images/M/MV5BOTkzZjZiOWItZGM5Ny00N2IxLTg4ZTQtYTBiODhlNmRlM2IxXkEyXkFqcGdeQXVyMzgxODM4NjM@._V1_SY1000_CR0,0,707,1000_AL_.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 4.0, sigmaY: 4.0),
                  child: Container(
                    color: Colors.black.withOpacity(.37),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 5),
                        height:
                            MediaQuery.of(context).size.width *
                                .43,
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Kaguya Sama: Love is War',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              'School, Romance, Comedy',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFCDCDCD),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 7),
                              child: Text(
                                'Sinopsis',
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white
                                      .withOpacity(.95),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              child: Text(
                                'Menceritakan tentang dua murid elit, Kaguya Shinomiya dan Miyuki Shirogane. Keduanya menyukai satu sama lain dan mereka ',
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white
                                      .withOpacity(.95),
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width *
                          .30,
                      height:
                          MediaQuery.of(context).size.width *
                              .43,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                            color: Colors.white, width: 2),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: Image.network(
                          'https://m.media-amazon.com/images/M/MV5BOTkzZjZiOWItZGM5Ny00N2IxLTg4ZTQtYTBiODhlNmRlM2IxXkEyXkFqcGdeQXVyMzgxODM4NjM@._V1_SY1000_CR0,0,707,1000_AL_.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
