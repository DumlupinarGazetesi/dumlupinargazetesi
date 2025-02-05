import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class AutoMarqueeText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Duration pauseAfterRound;
  final double velocity;
  final TextAlign textAlign;
  final bool makeCenter;

  const AutoMarqueeText({
    super.key,
    required this.text,
    this.style,
    this.pauseAfterRound = const Duration(seconds: 2),
    this.velocity = 40.0,
    this.textAlign = TextAlign.center,
    this.makeCenter = true,
  });

  @override
  Widget build(BuildContext context) {
    Widget childText = Text(
      text,
      textAlign: textAlign,
      style: style ?? const TextStyle(),
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final textPainter = TextPainter(
          text: TextSpan(text: text, style: style ?? const TextStyle()),
          maxLines: 1,
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        // Text overflows, use Marquee
        if (textPainter.didExceedMaxLines) {
          return Center(
            child: Marquee(
              text: text,
              style: style ?? const TextStyle(),
              scrollAxis: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.center,
              blankSpace: 20.0,
              velocity: velocity,
              pauseAfterRound: pauseAfterRound,
              accelerationDuration: const Duration(seconds: 1),
              accelerationCurve: Curves.linear,
              decelerationDuration: const Duration(milliseconds: 500),
              decelerationCurve: Curves.easeOut,
            ),
          );
        } else {
          // Text fits within one line
          return makeCenter
              ? Center(
                  child: childText,
                )
              : childText;
        }
      },
    );
  }
}
