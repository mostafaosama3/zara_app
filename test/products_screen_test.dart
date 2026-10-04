import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zara_app/features/products/products_screen.dart';

void main() {
  testWidgets('selecting a gender filter updates the visible product count', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: ProductsScreen()));
    await tester.pumpAndSettle();

    final beforeText = tester.widget<Text>(find.textContaining('Results Found')).data ?? '';
    final beforeCount = int.parse(beforeText.split(' ').first);

    await tester.tap(find.text('Men'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Women'));
    await tester.pumpAndSettle();

    final afterText = tester.widget<Text>(find.textContaining('Results Found')).data ?? '';
    final afterCount = int.parse(afterText.split(' ').first);

    expect(afterCount, lessThan(beforeCount));
  });
}
