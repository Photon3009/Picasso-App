import 'package:curie/artwork_details_page.dart';
import 'package:curie/service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> artworks = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    fetchArtworks('paintings');
  }

  void fetchArtworks(String query) async {
    var data = await ArtworkService.searchPhotos(query);
    setState(() {
      artworks = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Picasso Art Gallery'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.amberAccent, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search artworks...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white, width: 1),
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(0.8),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
                fetchArtworks(searchQuery);
              },
            ),
          ),
        ),
      ),
      body: artworks.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: artworks.length,
                itemBuilder: (context, index) {
                  final artwork = artworks[index];
                  return Card(
                    color: Colors.amberAccent,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10.0),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          artwork['src']['small'],
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        artwork['alt'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        artwork['photographer'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArtworkDetailsPage(
                              artwork: artwork,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
    );
  }
}
