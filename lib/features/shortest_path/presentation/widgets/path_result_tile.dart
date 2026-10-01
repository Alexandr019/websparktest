import 'package:flutter/material.dart';

class PathResultTile extends StatelessWidget {
  const PathResultTile({required this.pathString, required this.onTap, super.key});

  final String pathString;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      title: Text(pathString, textAlign: TextAlign.center),
    );
  }
}
