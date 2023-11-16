import 'package:flutter/material.dart';

class CBText extends StatelessWidget {
  final String text;
  final int? maxCharacters; // Make maxCharacters optional by using int?
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final StrutStyle? strutStyle;
  final TextOverflow overflow;

  const CBText({super.key, 
    required this.text,
    this.maxCharacters,
    this.style,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.strutStyle,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      _truncateText(),
      overflow: overflow,
      style: style,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      strutStyle: strutStyle,
    );
  }

  String _truncateText() {
    if (maxCharacters != null && text.length > maxCharacters!) {
      return '${text.substring(0, maxCharacters!)}...';
    } else {
      return text;
    }
  }
}
