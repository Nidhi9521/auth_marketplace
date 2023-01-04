import 'package:flutter/material.dart';

class RadioWidget extends StatelessWidget {
  final String val;
  final String groupValue;
  final Function(String? value) callback;

  RadioWidget(
      {Key? key,
      required this.val,
      required this.groupValue,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio(
          value: val,
          groupValue: groupValue,
          onChanged: callback,
        ),
        Text(
          val,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
