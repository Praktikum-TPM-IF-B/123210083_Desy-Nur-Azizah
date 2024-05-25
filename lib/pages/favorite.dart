import 'package:flutter/material.dart';
import 'package:responsi_123210083/services/api_service.dart';
import 'package:responsi_123210083/services/shared_prefs_service.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class FavoritesPage extends StatelessWidget {
  // final ApiService apiService = ApiService();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: FutureBuilder<List<String>>(
        future: PrefService.getFavorites(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load favorites'));
          } else {
            final favorites = snapshot.data ?? [];
            if (favorites.isEmpty) {
              return Center(child: Text('No favorites yet'));
            } else {
              return ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  final id = favorites[index];
                  return FutureBuilder<Map<String, dynamic>?>(
                    future: ApiService().getAmiiboDetail(id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return ListTile(
                          title: Text('Loading...'),
                        );
                      } else if (snapshot.hasError) {
                        return ListTile(
                          title: Text('Error loading favorite'),
                        );
                      } else {
                        final amiibo = snapshot.data!;
                        return ListTile(
                          // leading: CachedNetworkImage(imageUrl: amiibo['image']),
                          title: Text(amiibo['name']),
                          subtitle: Text(amiibo['character']),
                        );
                      }
                    },
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
