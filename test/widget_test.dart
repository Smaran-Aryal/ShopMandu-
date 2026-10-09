import 'package:flutter_test/flutter_test.dart';
import 'package:shopmandu/main.dart';

void main() {
  testWidgets('ShopMandu app loads', (WidgetTester tester) async {
    await tester.pumpWidget(const ShopManduApp());
    expect(find.text('ShopMandu'), findsOneWidget);
  });
}