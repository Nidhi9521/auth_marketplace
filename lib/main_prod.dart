import 'package:flutter/cupertino.dart';

import 'main_common.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await mainCommon(Environment.prod);
}
