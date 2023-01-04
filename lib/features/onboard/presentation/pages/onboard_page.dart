import 'dart:async';
import 'package:auth_marketplace/core/core.dart';
import '../../../../core/utils/market_place_images.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => NavigationService().pushAndPopUntil(context, Routes.kRouteHome),
    );
  }

  @override
  Widget build(BuildContext context) {
    var imageSize = MediaQuery.of(context).size.width / 4;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Replace below image with your app logo
            Image.asset(
              AllImages().appLogo,
              width: imageSize,
              height: imageSize,
            ),
            SizedBox(height: 20),
            Text(
              'MasonTest',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
