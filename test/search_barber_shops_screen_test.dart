import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:haircut_appointment_booking_system/login_screen.dart';
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

  testWidgets('logging in as Barber opens SearchBarberShopsScreen', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginScreen(),
      ),
    );

    await tester.tap(find.text('Barber'));
    await tester.pump();

    final fields = find.byType(TextFormField);
    await tester.enterText(fields.at(0), 'barber@kapaltime.com');
    await tester.enterText(fields.at(1), 'secret123');
    await tester.pump();

    await tester.ensureVisible(find.text('Log in').last);
    await tester.tap(find.text('Log in').last);
    await tester.pumpAndSettle();

    expect(find.byType(SearchBarberShopsScreen), findsOneWidget);
    expect(find.text('Search barber shops'), findsOneWidget);
  });
}
