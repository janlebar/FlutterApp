import 'package:flutter/material.dart';

class Gallery extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/Neimenovano.jpg',
    // Add more image paths as needed
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // You can adjust the number of grid columns here
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      itemCount: imagePaths.length,
      itemBuilder: (BuildContext context, int index) {
        return Image.asset(
          imagePaths[index],
          fit: BoxFit.cover,
        );
      },
    );
  }
}
