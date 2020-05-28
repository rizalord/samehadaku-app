import 'package:Samehadaku/components/eps_card.dart';
import 'package:Samehadaku/components/shimmer/eps_card_shimmer.dart';
import 'package:Samehadaku/pages/detail_episode.dart';
import 'package:Samehadaku/pages/show_more_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class MainContent extends StatelessWidget {
  final List data;

  MainContent({this.data});

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
          data.isEmpty
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 2,
                  itemBuilder: (ctx, idx) => EpsCardShimmer(),
                )
              : ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: data.length,
                  itemBuilder: (ctx, idx) => TouchableOpacity(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: DetailEpisode(
                            link: data[idx]['link'],
                            image: data[idx]['image'],
                          ),
                        ),
                      );
                    },
                    child: EpsCard(
                      image: data[idx]['image'],
                      title: data[idx]['title'],
                      episode: data[idx]['episode'],
                      author: data[idx]['postedBy'],
                      release: data[idx]['release_time'],
                    ),
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
