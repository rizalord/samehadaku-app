import 'dart:async';
import 'dart:io';

import 'package:Samehadaku/bloc/download_bloc.dart';
import 'package:Samehadaku/components/download_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:thumbnails/thumbnails.dart';
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

  @override
  void dispose() {
    print('SAYA DISPOSE BANGSAT');
    super.dispose();
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
      var newDirList = await Directory(dir).list().distinct().toList();

      var newDirListMap = newDirList
          .map((e) {
            return {
              'prevData': e.statSync(),
              'fileName': basename(e.path),
              'fileSize': e.statSync().size.toString(),
              'filePath': e.path,
              'exist': e.existsSync()
            };
          })
          .toList()
          .where((element) =>
              int.parse(element['fileSize']) > 41686603 ||
              element['exist'] == true)
          .toList()
          .reversed
          .toList();

      newDirListMap = await Future.wait(
          newDirListMap.map((e) async => await getThumbnail(e)));

      if (this.mounted)
        setState(() {
          data = newDirListMap;
        });
    } catch (e) {
      print('tangkap error $e');
    }
  }

  Future<Map> getThumbnail(e) async {
    e['thumbnail'] = e['exist'] == true
        ? await Thumbnails.getThumbnail(
            thumbnailFolder: (await getExternalStorageDirectory()).path +
                Platform.pathSeparator +
                'thumbnail',
            videoFile: e['filePath'],
            imageType: ThumbFormat.PNG,
            quality: 30,
          )
        : null;

    return e;
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
                print(currentValue);
                return data.isEmpty && currentValue.isEmpty
                    ? Empty()
                    : FilledDownload(
                        data: data,
                        dataDownload: currentValue,
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
