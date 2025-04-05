class Server {
  final String id;
  final String name;
  final String description;
  final String category;
  final String imageUrl;
  final int memberCount;

  Server({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.memberCount,
  });
}

// Mock data for servers
final List<Server> mockServers = [
  Server(
    id: '1',
    name: 'Football Enthusiasts',
    description: 'A community for football lovers to discuss matches and share experiences',
    category: 'sports',
    imageUrl: 'https://example.com/football.jpg',
    memberCount: 1250,
  ),
  Server(
    id: '2',
    name: 'Cooking Tips & Recipes',
    description: 'Share your favorite recipes and cooking techniques',
    category: 'life',
    imageUrl: 'https://example.com/cooking.jpg',
    memberCount: 890,
  ),
  Server(
    id: '3',
    name: 'Tech Innovators',
    description: 'Discuss the latest in technology and innovation',
    category: 'technologies',
    imageUrl: 'https://example.com/tech.jpg',
    memberCount: 2100,
  ),
  Server(
    id: '4',
    name: 'Movie Buffs',
    description: 'Share your thoughts on movies and TV shows',
    category: 'entertainment',
    imageUrl: 'https://example.com/movies.jpg',
    memberCount: 1500,
  ),
  Server(
    id: '5',
    name: 'Basketball Fans',
    description: 'NBA discussions and local basketball meetups',
    category: 'sports',
    imageUrl: 'https://example.com/basketball.jpg',
    memberCount: 980,
  ),
  Server(
    id: '6',
    name: 'Home Decor Ideas',
    description: 'Share home decoration tips and inspiration',
    category: 'life',
    imageUrl: 'https://example.com/decor.jpg',
    memberCount: 750,
  ),
  Server(
    id: '7',
    name: 'AI & Machine Learning',
    description: 'Discuss AI developments and machine learning projects',
    category: 'technologies',
    imageUrl: 'https://example.com/ai.jpg',
    memberCount: 1100,
  ),
  Server(
    id: '8',
    name: 'Music Lovers',
    description: 'Share music recommendations and discuss artists',
    category: 'entertainment',
    imageUrl: 'https://example.com/music.jpg',
    memberCount: 1800,
  ),
]; 