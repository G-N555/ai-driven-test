import 'package:flutter/material.dart';
import '../models/server.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Servers'),
        elevation: 2,
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text(
                      category[0].toUpperCase() + category.substring(1),
                      style: TextStyle(
                        color: _selectedCategory == category
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    selected: _selectedCategory == category,
                    onSelected: (selected) {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: getFilteredServers().length,
              itemBuilder: (context, index) {
                final server = getFilteredServers()[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(server.imageUrl),
                      onBackgroundImageError: (_, __) {},
                      child: server.imageUrl.isEmpty
                          ? Text(server.name[0])
                          : null,
                    ),
                    title: Text(server.name),
                    subtitle: Text(
                      server.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.people),
                        Text(server.memberCount.toString()),
                      ],
                    ),
                    onTap: () {
                      // TODO: Navigate to server details
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
} 