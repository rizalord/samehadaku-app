import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: 8),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SearchBar(width: width, formKey: _formKey),
                  Flexible(
                    fit: FlexFit.loose,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 5,
                      itemBuilder: (ctx, idx) => ListItem(width: width),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Image.network(
                  'https://i0.wp.com/samehadaku.vip/wp-content/uploads/2020/04/106300.jpg?quality=100',
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
                          '6.50',
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
                    'Hachi-nan tte, Sore wa Nai deshou!',
                    style:
                        GoogleFonts.poppins(fontSize: 15, color: Colors.black),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Ongoing',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Color(0xFF777777),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    child: Row(
                      children: <Widget>[GenreItem(), GenreItem()],
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
                          color: Colors.black.withOpacity(.73),
                        ),
                        SizedBox(width: 6),
                        Text(
                          '2341 Dilihat',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.black.withOpacity(.73),
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
    );
  }
}

class GenreItem extends StatelessWidget {
  const GenreItem({
    Key key,
  }) : super(key: key);

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
        'Comedy',
        style: GoogleFonts.roboto(
          fontSize: 12,
          color: Colors.black.withOpacity(.56),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
    @required this.width,
    @required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final double width;
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 79,
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
                        decoration: InputDecoration.collapsed(
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.black.withOpacity(.6)),
                          hintText: 'Search..',
                        ),
                      ),
                    ),
                    Icon(
                      Icons.close,
                      size: 18,
                      color: Colors.black.withOpacity(.6),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              child: Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}
