import 'package:auth_marketplace/core/core.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocale!.translate('about'),
            style: Theme.of(context).textTheme.headline1!),
      ),
      body: Container()/*WebView(
        initialUrl: 'about:blank',
        onWebViewCreated: (WebViewController webViewController) async {
          String fileText = await rootBundle.loadString('assets/about.html');
          webViewController.loadUrl(Uri.dataFromString(
            fileText,
            mimeType: 'text/html',
          ).toString());
        },
      )*/,
    );
  }
}
