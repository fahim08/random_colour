import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_colour/rc_app.dart';

void main() {
  testWidgets('App displays "Hello there" text', (WidgetTester tester) async {
    await tester.pumpWidget(RCApp());

    // Check if the text is present
    expect(find.text('Hello there'), findsOneWidget);

    // Check if the text style has the correct font weight
    final textWidget = tester.widget<Text>(find.text('Hello there'));
    expect(textWidget.style?.fontWeight, FontWeight.bold);
  });

  testWidgets('Background color changes on tap', (WidgetTester tester) async {
    await tester.pumpWidget(RCApp());

    //Background colour before tapping the screen
    final backgroundColorBeforeTap =
        tester.widget<Scaffold>(find.byType(Scaffold)).backgroundColor;

    await tester.tap(find.byType(Scaffold));
    await tester.pump();

    //New Background colour after tapping the screen
    final backgroundColorAfterTap =
        tester.widget<Scaffold>(find.byType(Scaffold)).backgroundColor;

    //Checks whether the background colour is changed
    expect(backgroundColorAfterTap, isNot(equals(backgroundColorBeforeTap)));
  });
}
