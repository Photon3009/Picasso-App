import 'package:flutter/material.dart';

class ArtworkDetailsPage extends StatelessWidget {
  final dynamic artwork;

  const ArtworkDetailsPage({super.key, required this.artwork});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(artwork['alt']),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(artwork['src']['large']),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Artist: ${artwork['photographer']}',
                      style: const TextStyle(fontSize: 20)),
                  const SizedBox(height: 10),
                  Text(
                      'Description: ${artwork['alt'] ?? 'No description available'}',
                      style: const TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
