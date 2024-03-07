import 'dart:convert'; // Import the dart:convert library

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  List<String> imagePaths = [];

  @override
  void initState() {
    super.initState();
    loadAssets();
  }

  Future<void> loadAssets() async {
    try {
      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      final Map<String, dynamic> manifestMap = json.decode(manifestContent); // Use json object from dart:convert

      final Iterable<String> imagePathsIterable = manifestMap.keys.where((String key) => key.contains('assets/') && key.contains('.jpg'));

      setState(() {
        imagePaths = imagePathsIterable.toList();
      });
    } catch (e) {
      print('Error loading asset manifest: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Adjusted to display 4 images in a row
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      itemCount: imagePaths.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.all(10.0), // Add 10px padding around the image
          child: Image.asset(
            imagePaths[index],
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
