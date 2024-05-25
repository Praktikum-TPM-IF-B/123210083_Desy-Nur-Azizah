import 'package:flutter/material.dart';
import 'package:responsi_123210083/models/amiibo.dart';
import 'package:responsi_123210083/pages/favorite.dart';
import 'package:responsi_123210083/services/api_service.dart';
import 'package:responsi_123210083/services/shared_prefs_service.dart';
import 'package:responsi_123210083/pages/detailpage.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Amiibo List'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritesPage()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: apiService.getAmiiboList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load amiibos'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                final amiibo = snapshot.data![index];
                return ListTile(
                  // leading: CachedNetworkImage(imageUrl: amiibo['image']),
                  title: Text(amiibo['amiiboSeries']),
                  subtitle: Text(amiibo['character']),

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AmiiboDetailPage(
                            id: amiibo['head'] + amiibo['tail']),
                      ),
                    );
                  },
                  trailing: IconButton(
                    icon: Icon(Icons.favorite),
                    onPressed: () {
                      String id = amiibo['head'] + amiibo['tail'];
                      _addToFavorites(id);
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  void _addToFavorites(String id) {}
}
