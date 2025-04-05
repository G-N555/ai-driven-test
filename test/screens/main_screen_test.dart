import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:community_service_app/main.dart';

void main() {
  group('MainScreen Tests', () {
    testWidgets('MainScreen shows correct initial screen', (WidgetTester tester) async {
      // Build our app and trigger a frame
      await tester.pumpWidget(const MaterialApp(home: MainScreen()));
      await tester.pumpAndSettle();
      
      // Verify the initial screen is the ServersScreen by checking for its AppBar title
      expect(find.text('Community Servers'), findsOneWidget);
      
      // Verify bottom navigation has both items
      expect(find.text('Servers'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
    });
    
    testWidgets('Navigation to Profile screen works', (WidgetTester tester) async {
      // Build our app and trigger a frame
      await tester.pumpWidget(const MaterialApp(home: MainScreen()));
      await tester.pumpAndSettle();
      
      // Tap on the Profile tab
      await tester.tap(find.text('Profile'));
      await tester.pumpAndSettle();
      
      // Verify we're now on the Profile screen by checking for Profile-specific text
      expect(find.text('Profile'), findsWidgets); // Should find both in nav bar and as title
      expect(find.text('Name'), findsOneWidget); // Profile form label
      
      // Verify ServersScreen is no longer visible
      expect(find.text('Community Servers'), findsNothing);
    });
    
    testWidgets('Navigation back to Servers screen works', (WidgetTester tester) async {
      // Build our app and trigger a frame
      await tester.pumpWidget(const MaterialApp(home: MainScreen()));
      await tester.pumpAndSettle();
      
      // First navigate to Profile
      await tester.tap(find.text('Profile'));
      await tester.pumpAndSettle();
      
      // Then navigate back to Servers
      await tester.tap(find.text('Servers'));
      await tester.pumpAndSettle();
      
      // Verify we're back on the Servers screen
      expect(find.text('Community Servers'), findsOneWidget);
      
      // Verify Profile form is no longer visible
      expect(find.text('Name'), findsNothing);
    });
  });
}
