import 'dart:async';
import 'dart:io';

import 'package:Samehadaku/bloc/download_bloc.dart';
import 'package:Samehadaku/components/download_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import './../components/download_header.dart';
import './../components/download_fill.dart';
import 'package:path/path.dart';

class DownloadPage extends StatefulWidget {
  @override
  _DownloadPageState createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  List data = [];

  @override
  void initState() {
    getFiles();
    super.initState();
    streamTest();
  }

  void streamTest() {
    StreamController<double> controller = StreamController<double>();
    Stream stream = controller.stream;
    stream.listen((event) {
      getFiles();
    });

    double count = 1;
    Timer.periodic(Duration(seconds: 1), (timer) {
      controller.add(count++);
    });
  }

  void getFiles() async {
    try {
      var dir = (await getExternalStorageDirectory()).path +
          Platform.pathSeparator +
          'download';
      var newDirList = await Directory(dir).list().toList();

      // Thumbnail

      // End thumbnail
      var newDirListMap = newDirList
          .map((e) {
            return {
              'prevData': e.statSync(),
              'fileName': basename(e.path),
              'fileSize': e.statSync().size.toString(),
              'filePath': e.path
            };
          })
          .toList()
          .where((element) => int.parse(element['fileSize']) > 41686603)
          .toList();

      setState(() {
        data = newDirListMap;
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Header(width: width),
            BlocBuilder<DownloadBloc, List>(
              builder: (ctx, currentValue) {
                return data.isEmpty && currentValue.isEmpty
                    ? Empty()
                    : FilledDownload(data: data , dataDownload: currentValue);
              },
            ),
          ],
        ),
      ),
    );
  }
}
