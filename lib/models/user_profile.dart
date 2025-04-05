class UserProfile {
  String name;
  String email;
  String bio;
  String avatarUrl;
  List<String> joinedServers;

  UserProfile({
    required this.name,
    required this.email,
    this.bio = '',
    this.avatarUrl = '',
    this.joinedServers = const [],
  });

  // Create a default profile
  factory UserProfile.defaultProfile() {
    return UserProfile(
      name: 'User',
      email: 'user@example.com',
      bio: 'No bio yet',
      avatarUrl: 'https://example.com/default-avatar.jpg',
      joinedServers: [],
    );
  }
} 