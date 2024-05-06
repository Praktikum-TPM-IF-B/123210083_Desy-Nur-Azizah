import 'package:coba/model/albums_model.dart';
import 'package:coba/load_data_source.dart';
import 'package:coba/model/photo_model.dart';
import 'package:coba/model/users_model.dart';
import 'package:flutter/material.dart';

class AlbumDetailPage extends StatelessWidget {
  final Album album;

  AlbumDetailPage(this.album);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Album Detail'),
      ),
      body: FutureBuilder<User>(
        future:
            _getUserByAlbumId(album.userId), // Menggunakan userId dari album
        builder: (context, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (userSnapshot.hasError) {
            return Center(child: Text('Error: ${userSnapshot.error}'));
          } else if (userSnapshot.hasData) {
            final user = userSnapshot.data!;
            return FutureBuilder<List<Photo>>(
              future: DataSource.fetchPhotos(album.id ?? 0),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  final photos = snapshot.data!;
                  return ListView.builder(
                    itemCount: photos.length,
                    itemBuilder: (context, index) {
                      final photo = photos[index];
                      return ListTile(
                        title: Text(photo.title ?? ''),
                        leading: Image.network(photo.thumbnailUrl ?? ''),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${user.username ?? ''}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('${user.name}'),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return Center(child: Text('No data available'));
                }
              },
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }

  // Fungsi untuk mendapatkan informasi pengguna berdasarkan userId
  Future<User> _getUserByAlbumId(int? userId) async {
    final users = await DataSource.fetchUsers();
    final albumUser = users.firstWhere(
      (user) => user.id == userId,
      orElse: () => User(0, 'Unknown', 'Unknown', '', null, '', '', null),
    );
    return albumUser;
  }
}
