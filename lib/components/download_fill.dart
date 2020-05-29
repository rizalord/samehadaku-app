import 'dart:io';

import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_file/open_file.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class FilledDownload extends StatefulWidget {
  final List data, dataDownload;

  FilledDownload({this.data = const [], this.dataDownload = const []});

  @override
  _FilledDownloadState createState() => _FilledDownloadState();
}

class _FilledDownloadState extends State<FilledDownload> {
  @override
  void initState() {
    print('ini adalah init filled');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: Container(
        child: Column(
          children: [SizedBox(height: 14)]..addAll(
              widget.dataDownload.map(
                (e) {
                  return Item(
                    title: e['fileName'],
                    fileSize: filesize(e['fileSize']),
                    downloaded: false,
                    filePath: null,
                    fileDownloaded: filesize(e['fileDownloaded']),
                    percentage: e['percentage'],
                  );
                },
              ).toList()
                ..addAll(
                  widget.data.map((e) {
                    return Item(
                      title: e['fileName'],
                      fileSize: filesize(e['fileSize']),
                      downloaded: true,
                      filePath: e['filePath'],
                      thumbnail: e['thumbnail'],
                    );
                  }).toList(),
                ),
            ),
        ),
      ),
    );
  }
}

class Item extends StatefulWidget {
  const Item({
    Key key,
    this.title,
    this.fileSize,
    this.downloaded,
    this.filePath,
    this.fileDownloaded = null,
    this.percentage,
    this.thumbnail = null,
  }) : super(key: key);

  final String title, fileSize, filePath, fileDownloaded, thumbnail;
  final double percentage;
  final bool downloaded;

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  String title, fileSize, filePath;
  bool downloaded;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        if (widget.filePath != null)
          OpenFile.open(widget.filePath, type: 'video/*');
      },
      child: Container(
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
                  color: Colors.black),
              child: widget.downloaded == true && widget.thumbnail != null
                  ? Image.file(
                      File(widget.thumbnail),
                      fit: BoxFit.cover,
                    )
                  : Container(),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 2),
                  Text(
                    widget.title,
                    style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context)
                            .textSelectionColor
                            .withOpacity(.7)),
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
                        percent:
                            widget.downloaded ? 1 : widget.percentage / 100),
                  ),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        !widget.downloaded
                            // ? Text(
                            //     '6.01MB/s',
                            //     style: GoogleFonts.roboto(
                            //       fontSize: 13,
                            //       color: Theme.of(context)
                            //           .textSelectionColor
                            //           .withOpacity(.77),
                            //     ),
                            //   )
                            ? Container()
                            : Container(),
                        SizedBox(width: 16),
                        Text(
                          '${widget.fileDownloaded == null ? widget.fileSize : widget.fileDownloaded}/${widget.fileSize}',
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
      ),
    );
  }
}
