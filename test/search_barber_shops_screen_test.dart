import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:haircut_appointment_booking_system/search_barber_shops_screen.dart';

void main() {
  testWidgets('shows barber shops and filters by search query', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SearchBarberShopsScreen(),
      ),
    );

    expect(find.text('Search barber shops'), findsOneWidget);
    expect(find.text('North & Co.'), findsOneWidget);
    expect(find.text('The Good Chair'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'North');
    await tester.pump();

    expect(find.text('1 barber shop found'), findsOneWidget);
    expect(find.text('North & Co.'), findsOneWidget);
    expect(find.text('The Good Chair'), findsNothing);
  });

  testWidgets('shows empty-results state and clears search', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SearchBarberShopsScreen(),
      ),
    );

    await tester.enterText(find.byType(TextField), 'NonExistentBarberShop');
    await tester.pump();

    expect(find.text('No barber shops found'), findsOneWidget);
    expect(find.text('Clear search'), findsOneWidget);

    await tester.tap(find.text('Clear search'));
    await tester.pump();

    expect(find.text('No barber shops found'), findsNothing);
    expect(find.text('North & Co.'), findsOneWidget);
    expect(find.text('The Good Chair'), findsOneWidget);
  });
}
