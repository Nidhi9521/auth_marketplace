import 'package:flutter/material.dart';

import 'main_common.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await mainCommon(Environment.dev);
}