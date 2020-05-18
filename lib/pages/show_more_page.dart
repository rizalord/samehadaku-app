import 'package:Samehadaku/components/eps_card.dart';
import 'package:Samehadaku/pages/detail_episode.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class ShowMorePage extends StatefulWidget {
  @override
  _ShowMorePageState createState() => _ShowMorePageState();
}

class _ShowMorePageState extends State<ShowMorePage> {
  var _scrollController = ScrollController();
  var _itemCount = 10;
  var _showLoading = false;

  @override
  void initState() {
    super.initState();
    onBottomReached();
  }

  void onBottomReached() {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge &&
          _scrollController.position.pixels != 0) {
        addMore();
      }
    });
  }

  void addMore() {
    setState(() {
      _showLoading = true;
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          _showLoading = false;
          _itemCount += 5;
          print('tambah 5 data');
          print('total data ${_itemCount}');
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latest Update'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _itemCount,
        itemBuilder: (ctx, idx) => idx != _itemCount - 1
            ? TouchableOpacity(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: DetailEpisode(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(
                      left: 12, right: 12, top: idx == 0 ? 12 : 0),
                  child: EpsCard(),
                ),
              )
            : Column(
                children: [
                  TouchableOpacity(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: DetailEpisode(),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 12, right: 12, top: idx == 0 ? 12 : 0),
                      child: EpsCard(),
                    ),
                  ),
                  Visibility(
                    visible: _showLoading,
                    child: Container(
                      child: CircularProgressIndicator(),
                      margin: EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
