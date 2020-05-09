import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './../components/notif_header.dart';

class NotificationPage extends StatelessWidget {
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
}

class ListItem extends StatelessWidget {
  const ListItem({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: width * .2,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SingleItem(),
            SingleItem(),
            SingleItem(),
            SingleItem(),
            SingleItem(),
            SingleItem(),
          ],
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
  const SingleItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
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
          ImageItem(width: width),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 4),
                Text(
                  'Serial Novel Overlord akan tamat',
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    color: Colors.black.withOpacity(.64),
                  ),
                  maxLines: 1,
                  // overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 7),
                Text(
                  'Serial Novel Overlord karya Kugane Maruyama akan berakhir',
                  style: GoogleFonts.roboto(
                      fontSize: 13,
                      color: Colors.black.withOpacity(.71),
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 7),
                Text(
                  '28 April 2020',
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
    );
  }
}

class ImageItem extends StatelessWidget {
  const ImageItem({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      width: width * .33,
      color: Colors.grey,
      child: Image.network(
        'https://i0.wp.com/samehadaku.vip/wp-content/uploads/2020/05/Bungo-to-alchemist-3.jpg?quality=80&resize=270,166',
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
