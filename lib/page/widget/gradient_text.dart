import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  const GradientText(this.data,
      {Key key,
      @required this.gradient,
      this.style,
      this.textAlign = TextAlign.left})
      : super(key: key);

  final String data;
  final Gradient gradient;
  final TextStyle style;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient.createShader(Offset.zero & bounds.size);
      },
      child: Text(
        data,
        textAlign: textAlign,
        style: (style == null)
            ? const TextStyle(color: Colors.white)
            : style.copyWith(color: Colors.white),
      ),
    );
  }
}
