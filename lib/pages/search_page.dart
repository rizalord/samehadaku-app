import 'dart:convert';

import 'package:Samehadaku/setting.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:http/http.dart' as http;

import 'detail_anime.dart';

class SearchPage extends StatefulWidget {
  final Function changePage;

  SearchPage({this.changePage});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _formKey = GlobalKey<FormState>();
  bool firstSearch = false, loading = false, getMore = false;
  int page = 1;
  List data = [];
  String tmpText;

  onQuerySearch(String text) {
    if (this.mounted)
      setState(() {
        firstSearch = true;
        page = 1;
        data = [];
        loading = true;
        tmpText = text;

        Future.delayed(Duration(milliseconds: 0), () async {
          var url = Setting().restendpoint + 'search/$text/$page';

          var response = json.decode((await http.get(url)).body);

          if (this.mounted)
            setState(() {
              loading = false;
              data = response['results'];
            });
        });
      });
  }

  loadMore() async {
    setState(() {
      getMore = true;
      page++;

      Future.delayed(Duration(milliseconds: 0), () async {
        var url = Setting().restendpoint + 'search/$tmpText/$page';

        var response = json.decode((await http.get(url)).body);

        if (this.mounted)
          setState(() {
            getMore = false;
            data.addAll(response['results']);
          });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 0, right: 0, top: 0),
            child: Stack(
              children: <Widget>[
                // IF STARTER
                firstSearch == false
                    ? ListStarter(width: width, height: height)
                    : loading == true
                        ? Center(child: CircularProgressIndicator())
                        : data.isNotEmpty
                            ?

                            // IF DATA NOT EMPTY
                            ListFilled(
                                width: width,
                                data: data,
                                loadMore: loadMore,
                                getMore: getMore)
                            :

                            // IF DATA EMPTY
                            ListEmpty(width: width),

                // SEARCHBAR [DONT REMOVE OR EDIT]
                SearchBar(
                    width: width,
                    formKey: _formKey,
                    changePage: widget.changePage,
                    search: onQuerySearch),
              ],
            ),
          ),
        ));
  }
}

class ListStarter extends StatelessWidget {
  const ListStarter({
    Key key,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      child: Image.asset(
        'assets/images/lime-searching.png',
        // fit: BoxFit.cover,
        alignment: Alignment.center,
        scale: 2,
      ),
    );
  }
}

class ListEmpty extends StatelessWidget {
  const ListEmpty({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 109),
      padding: EdgeInsets.only(left: 30, right: 30),
      width: width,
      height: 50,
      child: Text(
        'Hasil tidak ditemukan, silahkan gunakan kata kunci lain',
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: Theme.of(context).textSelectionColor.withOpacity(.89),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class ListFilled extends StatefulWidget {
  const ListFilled({
    Key key,
    @required this.width,
    this.data,
    this.loadMore,
    this.getMore,
  }) : super(key: key);

  final double width;
  final List data;
  final Function loadMore;
  final bool getMore;

  @override
  _ListFilledState createState() => _ListFilledState();
}

class _ListFilledState extends State<ListFilled> {
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    onBottomReached();
  }

  void onBottomReached() {
    controller.addListener(() {
      if (controller.position.atEdge && controller.position.pixels != 0) {
        widget.loadMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // SearchBar(width: width, formKey: _formKey),
          Flexible(
            fit: FlexFit.loose,
            child: Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 79),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: widget.data.length,
                itemBuilder: (ctx, idx) => widget.getMore == true &&
                        idx == widget.data.length - 1
                    ? Container(
                        child: Column(
                          children: [
                            ListItem(
                              width: widget.width,
                              image: widget.data[idx]['image'],
                              title: widget.data[idx]['title'],
                              status: widget.data[idx]['status'],
                              view: widget.data[idx]['view'],
                              score: widget.data[idx]['score'],
                              genre: widget.data[idx]['genres'].length <= 2
                                  ? widget.data[idx]['genres']
                                  : widget.data[idx]['genres'].sublist(0, 2),
                              id: widget.data[idx]['linkId'],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 16),
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListItem(
                        width: widget.width,
                        image: widget.data[idx]['image'],
                        title: widget.data[idx]['title'],
                        status: widget.data[idx]['status'],
                        view: widget.data[idx]['view'],
                        score: widget.data[idx]['score'],
                        genre: widget.data[idx]['genres'].length <= 2
                            ? widget.data[idx]['genres']
                            : widget.data[idx]['genres'].sublist(0, 2),
                        id: widget.data[idx]['linkId'],
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    Key key,
    @required this.width,
    this.image,
    this.view,
    this.status,
    this.title,
    this.score,
    this.genre,
    this.id,
  }) : super(key: key);

  final double width;
  final String image, title, status, view, score, id;
  final List genre;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      activeOpacity: .7,
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: DetailAnime(
              url: id,
            ),
          ),
        );
      },
      child: Container(
        width: width,
        height: width * .45,
        margin: EdgeInsets.only(bottom: 12),
        child: Row(
          children: <Widget>[
            Container(
              width: width * .34,
              height: width * .45,
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.cover,
                    width: width * .34,
                    height: width * .45,
                  ),
                  Positioned(
                    right: 6,
                    bottom: 6,
                    child: Container(
                      height: 29,
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.53),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Color(0xFFFFF500),
                            size: 18,
                          ),
                          Text(
                            score,
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Theme.of(context).textSelectionColor,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    Text(
                      status,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Theme.of(context)
                            .textSelectionColor
                            .withOpacity(.5),
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      child: Row(
                        children: genre.map((e) => GenreItem(text: e)).toList(),
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.remove_red_eye,
                            size: 13,
                            color: Theme.of(context)
                                .textSelectionColor
                                .withOpacity(.73),
                          ),
                          SizedBox(width: 6),
                          Text(
                            '$view Dilihat',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Theme.of(context)
                                  .textSelectionColor
                                  .withOpacity(.73),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GenreItem extends StatelessWidget {
  const GenreItem({
    Key key,
    this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 6),
      margin: EdgeInsets.only(right: 7),
      decoration: BoxDecoration(
        color: Color(0xFFc4c4c4).withOpacity(.38),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        text,
        style: GoogleFonts.roboto(
          fontSize: 12,
          color: Theme.of(context).textSelectionColor.withOpacity(.56),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  SearchBar({
    Key key,
    @required this.width,
    @required GlobalKey<FormState> formKey,
    this.changePage,
    this.search,
  })  : _formKey = formKey,
        super(key: key);

  final double width;
  final GlobalKey<FormState> _formKey;
  final Function changePage, search;
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 79,
      padding: EdgeInsets.only(left: 16, right: 16, top: 8),
      color: Theme.of(context).scaffoldBackgroundColor,
      width: width,
      child: Form(
        key: _formKey,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 48,
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        onFieldSubmitted: (text) {
                          if (text.toString().trim().isNotEmpty) {
                            search(text.toString().trim());
                            textController.text = text;
                          }
                        },
                        controller: textController,
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration.collapsed(
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.black.withOpacity(.6)),
                          hintText: 'Search..',
                        ),
                      ),
                    ),
                    TouchableOpacity(
                      activeOpacity: .7,
                      onTap: () {
                        textController.clear();
                      },
                      child: Icon(
                        Icons.close,
                        size: 18,
                        color: Colors.black.withOpacity(.6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TouchableOpacity(
              activeOpacity: .7,
              onTap: () => changePage(0),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                child: Text('Cancel'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
