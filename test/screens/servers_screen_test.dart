import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:community_service_app/screens/servers_screen.dart';
import 'package:community_service_app/models/server.dart';

void main() {
  group('ServersScreen Tests', () {
    testWidgets('ServersScreen shows all categories', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ServersScreen()));
      await tester.pumpAndSettle();

      // Verify that all category chips are present
      expect(find.text('All'), findsOneWidget);
      expect(find.text('Sports'), findsOneWidget);
      expect(find.text('Life'), findsOneWidget);
      expect(find.text('Technologies'), findsOneWidget);
      expect(find.text('Entertainment'), findsOneWidget);
    });

    testWidgets('ServersScreen shows servers', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ServersScreen()));
      await tester.pumpAndSettle();

      // Verify that servers are displayed
      expect(find.byType(Card), findsWidgets);
    });

    testWidgets('Category filter works correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ServersScreen()));
      await tester.pumpAndSettle();

      // Select 'sports' category
      await tester.tap(find.text('Sports'));
      await tester.pumpAndSettle();

      // Count sports servers
      final sportsServers = mockServers.where((server) => server.category == 'sports').length;
      expect(find.byType(Card), findsNWidgets(sportsServers));
    });

    testWidgets('Server card displays correct information', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ServersScreen()));
      await tester.pumpAndSettle();

      // Verify first server's information is displayed
      expect(find.text(mockServers[0].name), findsOneWidget);
      expect(find.text(mockServers[0].description), findsOneWidget);
      expect(find.text(mockServers[0].memberCount.toString()), findsOneWidget);
    });
  });
} 