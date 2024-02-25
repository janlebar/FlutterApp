import 'package:flutter/material.dart';


class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Home Tab Content',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}

class PortfolioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Portfolio Tab Content',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}

class AboutTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'About Tab Content',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}