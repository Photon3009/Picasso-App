import 'package:curie/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ArtGalleryApp());
}

class ArtGalleryApp extends StatelessWidget {
  const ArtGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virtual Art Gallery',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
