import 'package:flutter_test/flutter_test.dart';
import 'package:community_service_app/models/user_profile.dart';

void main() {
  group('UserProfile Model Tests', () {
    test('UserProfile creation with required fields', () {
      final profile = UserProfile(
        name: 'Test User',
        email: 'test@example.com',
      );

      expect(profile.name, 'Test User');
      expect(profile.email, 'test@example.com');
      expect(profile.bio, '');
      expect(profile.avatarUrl, '');
      expect(profile.joinedServers, isEmpty);
    });

    test('UserProfile creation with all fields', () {
      final profile = UserProfile(
        name: 'Test User',
        email: 'test@example.com',
        bio: 'Test Bio',
        avatarUrl: 'https://example.com/avatar.jpg',
        joinedServers: ['server1', 'server2'],
      );

      expect(profile.name, 'Test User');
      expect(profile.email, 'test@example.com');
      expect(profile.bio, 'Test Bio');
      expect(profile.avatarUrl, 'https://example.com/avatar.jpg');
      expect(profile.joinedServers, ['server1', 'server2']);
    });

    test('Default profile creation', () {
      final defaultProfile = UserProfile.defaultProfile();

      expect(defaultProfile.name, 'User');
      expect(defaultProfile.email, 'user@example.com');
      expect(defaultProfile.bio, 'No bio yet');
      expect(defaultProfile.avatarUrl, 'https://example.com/default-avatar.jpg');
      expect(defaultProfile.joinedServers, isEmpty);
    });
  });
} 