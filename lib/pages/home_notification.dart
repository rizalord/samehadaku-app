import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotifHome extends StatefulWidget {
  @override
  _NotifHomeState createState() => _NotifHomeState();
}

class _NotifHomeState extends State<NotifHome> {
  bool _loading = false;

  void loadNotif() {
    setState(() {
      _loading = !_loading;
      Future.delayed(Duration(milliseconds: 300), () {
        setState(() {
          _loading = !_loading;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: <Widget>[
            Container(
              width: width,
              height: 90,
              color: Colors.lightBlue,
              alignment: Alignment.bottomCenter,
              child: Text(
                'Notifications',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white,
                  height: 5,
                ),
              ),
            ),
            Expanded(
              child: _loading == false
                  ? WithIcon(width: width, loadNotif: this.loadNotif)
                  : LoadingIndicator(),
              // child: LoadingIndicator(),
            )
          ],
        ),
      ),
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class WithIcon extends StatelessWidget {
  final Function loadNotif;
  const WithIcon({Key key, @required this.width, this.loadNotif})
      : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loadNotif,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/bell_icon.png',
            width: width * .5,
            height: width * .5,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          Text(
            'Nothing Here !',
            style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).textSelectionColor.withOpacity(.83)),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Tap the notification icon and check again',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Theme.of(context).textSelectionColor.withOpacity(.64),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
