import 'dart:convert';

import 'package:Samehadaku/pages/detail_blog.dart';
import 'package:Samehadaku/setting.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import './../components/notif_header.dart';
import 'package:http/http.dart' as http;

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Stack(
          children: <Widget>[
            LeftBubble(width: width),
            RightBubble(width: width),
            ListItem(width: width),
            NotHeaderWrapper(),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ListItem extends StatefulWidget {
  const ListItem({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  ScrollController _controller = ScrollController();
  List data;
  int page = 1;

  bool loading = false;

  initData() async {
    var url = Setting().restendpoint + 'blog/$page';

    var response = json.decode((await http.get(url)).body);

    if (this.mounted)
      setState(() {
        data = response['blog'];
      });
  }

  @override
  void initState() {
    initData();
    super.initState();
    onBottomReached();
  }

  void onBottomReached() {
    _controller.addListener(() {
      if (_controller.position.atEdge && _controller.position.pixels != 0) {
        loadMore();
      }
    });
  }

  loadMore() async {
    page++;
    setState(() {
      loading = true;
      Future.delayed(Duration(seconds: 0), () async {
        var url = Setting().restendpoint + 'blog/$page';
        var response = json.decode((await http.get(url)).body);

        if (this.mounted)
          setState(() {
            loading = false;

            data.addAll(response['blog']);
          });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return data == null
        ? Center(child: CircularProgressIndicator())
        : Positioned.fill(
            top: widget.width * .2,
            child: SingleChildScrollView(
              controller: _controller,
              child: Column(
                children: data
                    .map((e) => data.last != e
                        ? SingleItem(
                            image: e['image'],
                            date: e['date'],
                            title: e['title'],
                            sub: e['sub'],
                            id: e['linkId'])
                        : Container(
                            child: Column(
                              children: [
                                SingleItem(
                                  image: e['image'],
                                  date: e['date'],
                                  title: e['title'],
                                  sub: e['sub'],
                                  id: e['linkId'],
                                ),
                                loading
                                    ? Container(
                                        margin: EdgeInsets.only(
                                            top: 14, bottom: 16),
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ))
                    .toList(),
              ),
            ),
          );
  }
}

class NotHeaderWrapper extends StatelessWidget {
  const NotHeaderWrapper({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: NotifHeader(),
    );
  }
}

class SingleItem extends StatelessWidget {
  const SingleItem(
      {Key key, this.image, this.title, this.sub, this.date, this.id})
      : super(key: key);

  final String image, title, sub, date, id;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return TouchableOpacity(
      activeOpacity: .6,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailBlog(id: id),
          ),
        );
      },
      child: Container(
        height: 108,
        width: width,
        margin: EdgeInsets.only(right: 20, left: 20, bottom: 8),
        padding: EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              offset: Offset(0, 4),
              color: Colors.black.withOpacity(.04),
            ),
          ],
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: <Widget>[
            ImageItem(width: width, image: image),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 4),
                  Text(
                    title,
                    style: GoogleFonts.roboto(
                      fontSize: 15,
                      color: Colors.black.withOpacity(.64),
                    ),
                    maxLines: 1,
                    // overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 7),
                  Text(
                    sub.trim(),
                    style: GoogleFonts.roboto(
                      fontSize: 13,
                      color: Colors.black.withOpacity(.71),
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 7),
                  Text(
                    date,
                    style: GoogleFonts.roboto(
                        fontSize: 12,
                        color: Colors.black.withOpacity(.42),
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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

class ImageItem extends StatelessWidget {
  const ImageItem({
    Key key,
    @required this.width,
    this.image,
  }) : super(key: key);

  final double width;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      width: width * .33,
      color: Colors.grey,
      child: CachedNetworkImage(
        imageUrl: image,
        placeholder: (context, url) =>
            Center(child: CircularProgressIndicator()),
        fit: BoxFit.cover,
      ),
    );
  }
}

class RightBubble extends StatelessWidget {
  const RightBubble({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: width * .1,
      bottom: width * 0.3,
      child: Container(
        width: width * 0.17,
        height: width * 0.17,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.17),
          color: Color(0xFF4CC6E1).withOpacity(.2),
        ),
      ),
    );
  }
}

class LeftBubble extends StatelessWidget {
  const LeftBubble({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -(width * .5) / 2,
      top: width * .3,
      child: Container(
        width: width * .5,
        height: width * .5,
        decoration: BoxDecoration(
            color: Color(0xFF4CC6E1).withOpacity(.2),
            borderRadius: BorderRadius.circular(width * .5)),
        child: Stack(
          children: <Widget>[
            Positioned(
              right: width * .088,
              bottom: 45,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
            ),
            Positioned(
              right: width * .075,
              bottom: 35,
              child: Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
