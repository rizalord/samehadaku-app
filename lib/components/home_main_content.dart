import 'package:Samehadaku/pages/detail_episode.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      margin: EdgeInsets.only(
        left: 12,
        right: 12,
        top: 6,
      ),
      padding: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SubHeader(width: width),
          SizedBox(
            height: 10,
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: 5,
            itemBuilder: (ctx, idx) => TouchableOpacity(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: DetailEpisode(),
                  ),
                );
              },
              child: EpsCard(width: width),
            ),
          ),
        ],
      ),
    );
  }
}

class EpsCard extends StatelessWidget {
  const EpsCard({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width * 0.28,
      margin: EdgeInsets.only(bottom: 8),
      child: Row(
        children: <Widget>[
          Container(
            width: width * .4,
            height: width * 0.28,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                'https://i0.wp.com/samehadaku.vip/wp-content/uploads/2020/05/2020-05-07_13-52-32.jpg?quality=100',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Fruit Basket Season 3',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Theme.of(context).textSelectionColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text(
                      'Episode 4',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                        color: Theme.of(context)
                            .textSelectionColor
                            .withOpacity(.8),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Posted by: ',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            color: Theme.of(context)
                                .textSelectionColor
                                .withOpacity(1),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Ktyg -',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            color: Theme.of(context)
                                .textSelectionColor
                                .withOpacity(.8),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Released on: ',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            color: Theme.of(context)
                                .textSelectionColor
                                .withOpacity(1),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '1 hari yang lalu',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            color: Theme.of(context)
                                .textSelectionColor
                                .withOpacity(.8),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SubHeader extends StatelessWidget {
  const SubHeader({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Latest Update',
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.left,
          ),
          Container(
            width: width,
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Update anime terbaru',
                  style: Theme.of(context).textTheme.headline2,
                  textAlign: TextAlign.left,
                ),
                Container(
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
