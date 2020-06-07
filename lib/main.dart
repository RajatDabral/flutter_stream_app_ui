import 'package:flutter/material.dart';
import 'package:music_app_ui/bottom_navigation_page.dart';
import 'package:music_app_ui/data/data_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => DataModel(),
      child: MaterialApp(
        title: 'Flutter Streaming App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BottomNavigationPage(),
      ),
    );
  }
}