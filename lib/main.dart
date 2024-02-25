import 'package:flutter/material.dart';
import 'header_component.dart';
import 'gallery.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Home'),
              Tab(text: 'Portfolio'),
              Tab(text: 'About'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HomeTab(),
            PortfolioTab(),
            AboutTab(),

            
          ],
        ),
      ),
    );
  }
}


class PortfolioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Gallery(), // Placing the Gallery widget in the center
    );
  }
}