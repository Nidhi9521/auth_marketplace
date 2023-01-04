import 'package:flutter/material.dart';
import 'package:auth_marketplace/core/utils/market_place_images.dart';
import 'package:flutter/foundation.dart';
import 'package:auth_marketplace/features/login/presentation/widgets/social_icon_button.dart';
import 'social_icon_button.dart';

import 'package:auth_marketplace/features/login/presentation/cubit/login_cubit.dart';

class SocialLoginWidget extends StatelessWidget {
  SocialLoginWidget({required this.loginCubit, Key? key}) : super(key: key);

  final LoginCubit loginCubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          indent: 20,
          thickness: 1.0,
          endIndent: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            "Or Login with...",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: Colors.grey.shade700),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [],
        )
      ],
    );
  }
}
