import 'dart:io';

import 'package:Samehadaku/bloc/download_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Browser extends StatefulWidget {
  final String url, title;

  Browser(
      {this.url = 'https://www112.zippyshare.com/v/FVdNHRf6/file.html',
      this.title});

  @override
  _BrowserState createState() => _BrowserState();
}

class _BrowserState extends State<Browser> {
  WebViewController _controller;
  String url;

  Future<bool> _exitApp(BuildContext context) async {
    if (await _controller.canGoBack()) {
      print("back webview");
      _controller.goBack();
      return Future.value(false);
    } else {
      print('back app');
      return Future.value(true);
    }
  }

  @override
  void initState() {
    checkPermission();
    url = widget.url;
    super.initState();
  }

  _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void onUrlChange(String url, DownloadBloc bloc) {
    if (url.contains('.mkv') || url.contains('.mp4') || url.contains('.3gp')) {
      downloadVideo(url, bloc);
    }
    setState(() {
      this.url = url;
    });
  }

  void checkPermission() async {
    if (!await Permission.storage.isGranted) {
      if (await Permission.storage.request().isGranted == false)
        Navigator.pop(context);
    }
  }

  Future<String> get _localPath async {
    final directory = await getExternalStorageDirectory();

    return directory.path.toString() + Platform.pathSeparator + 'download';
  }

  void downloadVideo(String urlDownload, DownloadBloc bloc) async {
    Fluttertoast.showToast(
      msg: "Download has been started",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );

    var dir = await _localPath;
    String fileName =
        urlDownload.replaceAll('p%5b', '[').replaceAll('%5d', ']');
    fileName = fileName.split('/').last;
    Dio dio = Dio();

    // print(dir);
    // print(fileName);

    // menambahkan download ke list download bloc
    List currentState = bloc.state;
    currentState.add({
      'title': widget.title,
      'fileName': fileName,
      'percentage': 0.0,
      'fileSize': 0,
      'fileDownloaded': 0
    });
    bloc.add(currentState);

    Navigator.pop(context);
    try {
      await dio.download(
        urlDownload,
        '${dir}/${fileName}',
        deleteOnError: true,
        onReceiveProgress: (rec, total) {
          if (rec == total) {
            Fluttertoast.showToast(
              msg: "Download Completed",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }

          // Update persentasi download
          List currentState = bloc.state;
          currentState = currentState.map((e) {
            if (e['fileName'] == fileName) {
              e['percentage'] =
                  double.parse(((rec / total) * 100).toStringAsFixed(0));
              e['fileSize'] = total;
              e['fileDownloaded'] = rec;
            }
            return e;
          }).toList();

          // Hapus data pada list ketika download selesai
          if (rec == total) {
            currentState =
                currentState.where((e) => e['fileName'] != fileName).toList();
          }

          bloc.add(currentState);

          print(
              'Rec: $rec , Total: $total , Percentage: ${((rec / total) * 100).toStringAsFixed(0)}%');
        },
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    DownloadBloc downloadBloc = BlocProvider.of<DownloadBloc>(context);
    return WillPopScope(
      onWillPop: () => _exitApp(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(url),
          actions: [
            PopupMenuButton(
              onSelected: (value) {
                this._launchURL();
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text('Open in Browser'),
                    value: true,
                  ),
                ];
              },
            )
          ],
        ),
        body: BlocBuilder<DownloadBloc, List>(
          builder: (context, currentValue) {
            print(currentValue);
            return WebView(
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
              gestureNavigationEnabled: true,
              onWebViewCreated: (WebViewController c) {
                _controller = c;
              },
              onPageStarted: (url) => onUrlChange(url, downloadBloc),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
