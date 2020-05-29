import 'dart:convert';

import 'package:Samehadaku/components/eps_card.dart';
import 'package:Samehadaku/pages/detail_episode.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:http/http.dart' as http;

class ShowMorePage extends StatefulWidget {
  @override
  _ShowMorePageState createState() => _ShowMorePageState();
}

class _ShowMorePageState extends State<ShowMorePage> {
  var _scrollController = ScrollController();
  var _showLoading = false;
  var _page = 1;
  var _data = [];

  @override
  void initState() {
    getData();
    super.initState();
    onBottomReached();
  }

  getData() async {
    var url = 'https://samehadaku-rest-api.herokuapp.com/page/$_page';

    var response = json.decode((await http.get(url)).body);

    if (this.mounted)
      setState(() {
        _data = response['latest'];
      });
  }

  void onBottomReached() {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge &&
          _scrollController.position.pixels != 0) {
        addMore();
      }
    });
  }

  void addMore() async {
    _page++;
    if (this.mounted)
      setState(() {
        _showLoading = true;
        Future.delayed(Duration(seconds: 0), () async {
          var url = 'https://samehadaku-rest-api.herokuapp.com/page/$_page';
          var response = json.decode((await http.get(url)).body);

          if (this.mounted)
            setState(() {
              _showLoading = false;
              _data.addAll(response['latest']);
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
      body: _data.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              controller: _scrollController,
              itemCount: _data.length,
              itemBuilder: (ctx, idx) => idx != _data.length - 1
                  ? TouchableOpacity(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: DetailEpisode(
                              link: _data[idx]['link'],
                              image: _data[idx]['image'],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 12, right: 12, top: idx == 0 ? 12 : 0),
                        child: EpsCard(
                          image: _data[idx]['image'],
                          title: _data[idx]['title'],
                          episode: _data[idx]['episode'],
                          author: _data[idx]['postedBy'],
                          release: _data[idx]['release_time'],
                        ),
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
                            child: EpsCard(
                              image: _data[idx]['image'],
                              title: _data[idx]['title'],
                              episode: _data[idx]['episode'],
                              author: _data[idx]['postedBy'],
                              release: _data[idx]['release_time'],
                            ),
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
