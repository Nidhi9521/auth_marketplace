import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? buttonText;
  final Function? onPressed;
  final Widget? prefixIcon;
  final Color? bgColor;
  final Color? borderColor;
  final Size? size;
  final TextStyle? textStyle;
  final double? borderWidth;
  final double? borderRadius;
  final double elevation;
  final Widget? suffixIcon;

  CustomButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.prefixIcon,
    this.bgColor,
    this.borderColor,
    this.borderRadius,
    this.textStyle,
    this.borderWidth,
    this.size,
    this.elevation = 3.0,
    this.suffixIcon, 
    Color? color, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed as void Function()?,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor ?? Theme.of(context).colorScheme.primary,
        padding: kIsWeb ? const EdgeInsets.all(16) : const EdgeInsets.all(10), disabledForegroundColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.38), disabledBackgroundColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: borderWidth ?? 1),
          borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
        ),
        fixedSize: size,
        elevation: elevation,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefixIcon != null) ...[
            prefixIcon!,
            const SizedBox(width: 8.0),
          ],
          Text(
            buttonText!,
            style: textStyle ?? Theme.of(context).textTheme.button,
          ),
          if (suffixIcon != null) ...[
            const SizedBox(width: 8.0),
            suffixIcon!,
          ],
        ],
      ),
    );
  }
}
