import 'package:flutter/material.dart';
import '../models/photo.dart';

class PhotoItem extends StatelessWidget {
  final Photo photo;
  final VoidCallback onTap;

  PhotoItem({required this.photo, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(photo.thumbnailUrl),
      title: Text(photo.title),
      onTap: onTap,
    );
  }
}
