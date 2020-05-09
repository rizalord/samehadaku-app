import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class FilledDownload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Flexible(
      fit: FlexFit.loose,
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 14),
            Item(),
            Item(),
            Item(),
          ],
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  const Item({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: width * 0.2,
      margin: EdgeInsets.only(left: 14, right: 14, bottom: 10),
      child: Row(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: width * 0.3,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.lightBlue),
            ),
            child: Image.network(
              'https://i0.wp.com/samehadaku.vip/wp-content/uploads/2020/05/2020-05-08_09-58-38.jpg?quality=80&resize=154,104',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 2),
                Text(
                  'Kakushigoto Episode 6',
                  style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color:
                          Theme.of(context).textSelectionColor.withOpacity(.7)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 7),
                Container(
                  child: LinearPercentIndicator(
                    width: width * .58,
                    lineHeight: 8.0,
                    alignment: MainAxisAlignment.start,
                    padding: EdgeInsets.only(left: 5),
                    progressColor: Colors.lightBlue,
                    percent: 1,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        '6.01MB/s',
                        style: GoogleFonts.roboto(
                          fontSize: 13,
                          color: Theme.of(context)
                              .textSelectionColor
                              .withOpacity(.77),
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        '45.50MB/45.50MB',
                        style: GoogleFonts.roboto(
                          fontSize: 13,
                          color: Theme.of(context)
                              .textSelectionColor
                              .withOpacity(.77),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
