/// poor_text.dart
/// A parody Flutter text widget for broke devs.

import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class PoorText extends StatelessWidget {
  final String text;
  final PoorTextStyle? style;
  final bool laggy;
  final bool autoShrink;
  final bool pretendRich;

  const PoorText(
      this.text, {
        super.key,
        this.style,
        this.laggy = false,
        this.autoShrink = false,
        this.pretendRich = false,
      });

  @override
  Widget build(BuildContext context) {
    final resolvedStyle = style ?? PoorTextStyle();
    final baseText = pretendRich ? _stripStyleTags(text) : text;
    final displayText = laggy ? _simulateLag(baseText) : baseText;

    final effectiveFontSize = autoShrink
        ? max(8.0, 14.0 - (text.length / 10))
        : resolvedStyle.fontSize;

    final textStyle = resolvedStyle.getTextStyle(effectiveFontSize);

    return Text(
      displayText,
      style: textStyle,
      overflow: TextOverflow.ellipsis,
    );
  }

  String _simulateLag(String input) {
    return input.split('').join(' '); // Fakes slowness
  }

  String _stripStyleTags(String input) {
    return input.replaceAll(RegExp(r'<[^>]*>'), '[STYLE REMOVED]');
  }
}

class PoorTextStyle {
  final double fontSize;
  final bool allowColor;
  final Color color;

  PoorTextStyle({
    this.fontSize = 12,
    this.allowColor = false,
    this.color = const Color(0xFF444444),
  });

  TextStyle getTextStyle(double effectiveFontSize) {
    final font = _randomGoogleFont();
    return font(
      textStyle: TextStyle(
        fontSize: effectiveFontSize,
        color: allowColor ? color : const Color(0xFF666666),
      ),
    );
  }

  TextStyle Function({TextStyle? textStyle}) _randomGoogleFont() {
    final fonts = [
      GoogleFonts.pressStart2p,
      GoogleFonts.poorStory,
      GoogleFonts.nanumPenScript,
      GoogleFonts.specialElite,
      GoogleFonts.hennyPenny,
    ];
    return fonts[Random().nextInt(fonts.length)];
  }
}

class PoorTextSpan {
  final String text;
  final PoorTextStyle? style;
  PoorTextSpan({required this.text, this.style});
}

class PoorTextRich extends StatelessWidget {
  final List<PoorTextSpan> spans;

  const PoorTextRich(this.spans, {super.key});

  @override
  Widget build(BuildContext context) {
    final fullText = spans.map((e) => e.text).join(' [no style] ');
    return PoorText(fullText);
  }
}

/// Example usage:
/// PoorText(
///   'This is cheap text.',
///   style: PoorTextStyle(fontSize: 10),
///   autoShrink: true,
///   laggy: true,
/// );