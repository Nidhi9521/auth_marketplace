import 'package:flutter/material.dart';

class SocialIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final String icon;
  const SocialIconButton({Key? key, required this.onTap, required this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        icon,
        height: 60,
        width: 60,
      ),
    );
  }
}
