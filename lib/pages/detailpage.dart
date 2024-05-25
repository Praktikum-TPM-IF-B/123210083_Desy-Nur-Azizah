import 'package:flutter/material.dart';
import 'package:responsi_123210083/services/api_service.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class AmiiboDetailPage extends StatelessWidget {
  final String id;
  final ApiService apiService = ApiService();

  AmiiboDetailPage({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Amiibo Detail')),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: apiService.getAmiiboDetail(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load amiibo details: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No details available'));
          } else {
            final amiibo = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // CachedNetworkImage(
                  //   imageUrl: amiibo['image'],
                  //   placeholder: (context, url) => CircularProgressIndicator(),
                  //   errorWidget: (context, url, error) => Icon(Icons.error),
                  // ),
                  SizedBox(height: 16),
                  Text(amiibo['name'], style: TextStyle(fontSize: 24)),
                  Text('Character: ${amiibo['character']}', style: TextStyle(fontSize: 18)),
                  Text('Series: ${amiibo['gameSeries']}', style: TextStyle(fontSize: 18)),
                  Text('Type: ${amiibo['type']}', style: TextStyle(fontSize: 18)),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
