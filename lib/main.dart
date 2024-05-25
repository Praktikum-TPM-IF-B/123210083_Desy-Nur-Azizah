import 'package:flutter/material.dart';

import 'package:responsi_123210083/pages/login.dart';
import 'package:responsi_123210083/pages/homepage.dart';
import 'package:responsi_123210083/services/shared_prefs_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amiibo App',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<bool>(
        future: PrefService.isLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            return snapshot.data == true ? HomePage() : LoginPage();
          }
        },
      ),
    );
  }
}
