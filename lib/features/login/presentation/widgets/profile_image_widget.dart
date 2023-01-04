import 'package:flutter/material.dart';
import 'package:auth_marketplace/core/utils/market_place_images.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AllImages().appLogo,
      height: 100,
      width: MediaQuery.of(context).size.width / 3,
    );
  }
}
