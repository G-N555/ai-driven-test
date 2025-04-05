import 'package:flutter/material.dart';
import '../models/server.dart';
import '../widgets/user_avatar.dart';
import '../widgets/category_chip.dart';

class ServersScreen extends StatefulWidget {
  const ServersScreen({super.key});

  @override
  State<ServersScreen> createState() => _ServersScreenState();
}

class _ServersScreenState extends State<ServersScreen> {
  String _selectedCategory = 'all';
  final List<String> _categories = [
    'all',
    'sports',
    'life',
    'technologies',
    'entertainment'
  ];

  List<Server> getFilteredServers() {
    if (_selectedCategory == 'all') {
      return mockServers;
    }
    return mockServers
        .where((server) => server.category == _selectedCategory)
        .toList();
  }

  void _onCategorySelected(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  String _capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    final filteredServers = getFilteredServers();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Servers'),
        elevation: 2,
      ),
      body: Column(
        children: [
          _buildCategoryFilter(),
          Expanded(
            child: _buildServersList(filteredServers),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryFilter() {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: CategoryChip(
              label: _capitalizeFirstLetter(category),
              isSelected: _selectedCategory == category,
              onSelected: (selected) => _onCategorySelected(category),
            ),
          );
        },
      ),
    );
  }

  Widget _buildServersList(List<Server> servers) {
    return ListView.builder(
      itemCount: servers.length,
      itemBuilder: (context, index) {
        return _buildServerCard(servers[index]);
      },
    );
  }

  Widget _buildServerCard(Server server) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: ListTile(
        leading: UserAvatar(
          avatarUrl: server.imageUrl,
          fallbackText: server.name[0],
        ),
        title: Text(server.name),
        subtitle: Text(
          server.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: _buildMemberCount(server.memberCount),
        onTap: () {
          // TODO: Navigate to server details
        },
      ),
    );
  }

  Widget _buildMemberCount(int count) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.people),
        Text(count.toString()),
      ],
    );
  }
} 