import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late final WebViewController webViewController;

  @override
  void initState() {
    super.initState();

    webViewController = WebViewController()
      ..loadRequest(Uri.parse(
          "https://thehorecastore.com/checkouts/cn/c1-ba6e4c434062c2ad46d126b0630bfb13/information"))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (String url) {},
        onNavigationRequest: (request) {
          print("Request URL : ${request.url}");
          return NavigationDecision.navigate;
        },
        onPageStarted: (url) {
          print("Request URL : ${url}");
        },
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(
        controller: webViewController,
      ),
    );
  }
}
