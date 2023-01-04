import 'package:flutter/services.dart';

const int kNameMaxLength = 15;
const int kMobileNumberLength = 10;

TextInputFormatter kOnlyAlphabetsFormatter =
    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"));
TextInputFormatter kOnlyNumberFormatter =
    FilteringTextInputFormatter.allow(RegExp("[0-9]"));
