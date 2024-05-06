import 'package:coba/pages/album_list_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Post App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AlbumListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
