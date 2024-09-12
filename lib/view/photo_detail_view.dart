import 'package:flutter/material.dart';
import '../models/photo.dart';

class PhotoDetailView extends StatelessWidget {
  final Photo photo;

  PhotoDetailView({required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(photo.title)),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Image.network(photo.url),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(photo.title, style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
