// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mobileweb_hospitalapp/main.dart';

void main() {
  testWidgets('Timeout', (WidgetTester tester) async {
    group('complicated algorithm tests', () {
      // ...
    }, skip: "the algorithm isn't quite right");

    test('error-checking test', () {
      // ...
    }, skip: 'TODO: add error-checking.');
   });
}
