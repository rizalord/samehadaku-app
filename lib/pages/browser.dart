import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Browser extends StatefulWidget {
  final String url;

  Browser({this.url = 'https://www13.zippyshare.com/v/QQZuPHtO/file.html'});

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
    url = widget.url;
    super.initState();
  }

  void onUrlChange(String url) {
    if (url.contains('.mkv') || url.contains('.mp4') || url.contains('.3gp')) {
      downloadVideo(url);
    }
    setState(() {
      this.url = url;
    });
  }

  void downloadVideo(String url) {
    Fluttertoast.showToast(
      msg: "Download has been started",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _exitApp(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(url),
          actions: [
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text('Open in Browser'),
                  ),
                ];
              },
            )
          ],
        ),
        body: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          gestureNavigationEnabled: true,
          onWebViewCreated: (WebViewController c) {
            _controller = c;
          },
          onPageStarted: (url) => onUrlChange(url),
        ),
      ),
    );
  }
}
