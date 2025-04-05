import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String avatarUrl;
  final double radius;
  final double iconSize;
  final String? fallbackText;

  const UserAvatar({
    super.key,
    required this.avatarUrl,
    this.radius = 40,
    this.iconSize = 40,
    this.fallbackText,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: avatarUrl.isNotEmpty ? NetworkImage(avatarUrl) : null,
      onBackgroundImageError: (_, __) {},
      child: avatarUrl.isEmpty
          ? fallbackText != null
              ? Text(fallbackText!)
              : Icon(Icons.person, size: iconSize)
          : null,
    );
  }
}
