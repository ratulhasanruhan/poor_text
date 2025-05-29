import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:poor_text/poor_text.dart';

void main() {
  testWidgets('PoorText renders basic text', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: PoorText('Testing PoorText'),
      ),
    );

    expect(find.textContaining('Testing'), findsOneWidget);
  });

  testWidgets('PoorText autoShrink reduces font size', (WidgetTester tester) async {
    final longText = 'This is a very long text that should trigger shrinking.';

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: PoorText(
          longText,
          autoShrink: true,
        ),
      ),
    );

    final textWidget = tester.widget<Text>(find.byType(Text));
    expect(textWidget.style!.fontSize! < 14.0, isTrue);
  });

  testWidgets('PoorText strips style tags in pretendRich mode', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: PoorText('<b>Styled?</b>', pretendRich: true),
      ),
    );

    expect(find.textContaining('[STYLE REMOVED]'), findsWidgets);
  });

  testWidgets('PoorTextRich joins spans correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: PoorTextRich([
          PoorTextSpan(text: 'Cheap'),
          PoorTextSpan(text: 'Text'),
        ]),
      ),
    );

    expect(find.textContaining('Cheap [no style] Text'), findsOneWidget);
  });
}
