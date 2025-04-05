import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:community_service_app/screens/profile_screen.dart';

void main() {
  group('ProfileScreen Tests', () {
    testWidgets('ProfileScreen shows all form fields', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProfileScreen()));
      await tester.pumpAndSettle();

      // Verify that all form fields are present
      expect(find.byType(TextFormField), findsNWidgets(3));
      expect(find.text('Name'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Bio'), findsOneWidget);
    });

    testWidgets('Profile form validation works', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProfileScreen()));
      await tester.pumpAndSettle();

      // Clear the name field and try to save
      await tester.enterText(find.widgetWithText(TextFormField, 'Name'), '');
      await tester.tap(find.text('Save Profile'));
      await tester.pumpAndSettle();

      // Verify validation message
      expect(find.text('Please enter your name'), findsOneWidget);
    });

    testWidgets('Profile form accepts valid input', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProfileScreen()));
      await tester.pumpAndSettle();

      // Enter valid data
      await tester.enterText(find.widgetWithText(TextFormField, 'Name'), 'Test User');
      await tester.enterText(find.widgetWithText(TextFormField, 'Email'), 'test@example.com');
      await tester.enterText(find.widgetWithText(TextFormField, 'Bio'), 'Test Bio');
      await tester.pumpAndSettle();

      // Save profile
      await tester.tap(find.text('Save Profile'));
      await tester.pumpAndSettle();

      // Verify success message
      expect(find.text('Profile updated successfully'), findsOneWidget);
    });

    testWidgets('Profile shows joined servers section', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProfileScreen()));
      await tester.pumpAndSettle();

      expect(find.text('Joined Servers'), findsOneWidget);
      expect(find.text('No servers joined yet'), findsOneWidget);
    });
  });
} 