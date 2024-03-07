import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _currentIndex = 0;
  List<String> imagePaths = [];

  @override
  void initState() {
    super.initState();
    loadAssets();
  }

  Future<void> loadAssets() async {
    try {
      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      final Map<String, dynamic> manifestMap = json.decode(manifestContent);
      final imagePaths = manifestMap.keys
          .where((String key) => key.contains('assets/'))
          .toList();
      setState(() {
        this.imagePaths = imagePaths;
      });
    } catch (e) {
      print('Error loading asset paths: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
IconButton(
  icon: Icon(Icons.arrow_back),
  onPressed: () {
    setState(() {
      _currentIndex = (_currentIndex - 1) % imagePaths.length;
      if (_currentIndex < 0) {
        _currentIndex = imagePaths.length - 1;
      }
    });
  },
),

            Expanded(
              child: Container(
                height: 700, // Set your preferred height
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imagePaths.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              imagePath: imagePaths[index],
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          imagePaths[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
IconButton(
  icon: Icon(Icons.arrow_forward),
  onPressed: () {
    setState(() {
      _currentIndex = (_currentIndex + 1) % imagePaths.length;
    });
  },
),

          ],
        ),
        Container(
          child: Text(
            'Image ${_currentIndex + 1} of ${imagePaths.length}',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}

class DetailPage extends StatelessWidget {
  final String imagePath;

  DetailPage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Detail'),
      ),
      body: Center(
        child: Image.asset(imagePath),
      ),
    );
  }
}
