import 'package:flutter_test/flutter_test.dart';
import 'package:community_service_app/models/server.dart';

void main() {
  group('Server Model Tests', () {
    test('Server creation with valid data', () {
      final server = Server(
        id: '1',
        name: 'Test Server',
        description: 'Test Description',
        category: 'test',
        imageUrl: 'https://example.com/test.jpg',
        memberCount: 100,
      );

      expect(server.id, '1');
      expect(server.name, 'Test Server');
      expect(server.description, 'Test Description');
      expect(server.category, 'test');
      expect(server.imageUrl, 'https://example.com/test.jpg');
      expect(server.memberCount, 100);
    });

    test('Mock servers list contains expected number of servers', () {
      expect(mockServers.length, 8);
    });

    test('Mock servers have valid categories', () {
      final validCategories = ['sports', 'life', 'technologies', 'entertainment'];
      for (var server in mockServers) {
        expect(validCategories.contains(server.category), true);
      }
    });

    test('Mock servers have positive member counts', () {
      for (var server in mockServers) {
        expect(server.memberCount, greaterThan(0));
      }
    });
  });
} 