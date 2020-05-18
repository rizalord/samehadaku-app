import 'package:Samehadaku/components/eps_card.dart';
import 'package:Samehadaku/pages/detail_episode.dart';
import 'package:Samehadaku/pages/show_more_page.dart';
import 'package:flutter/material.dart';
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
              child: EpsCard(),
            ),
          ),
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
