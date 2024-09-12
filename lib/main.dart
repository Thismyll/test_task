import 'package:flutter/material.dart';
import 'package:test_task/view/gallery_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gallery App',
      home: GalleryView(),
    );
  }
}
