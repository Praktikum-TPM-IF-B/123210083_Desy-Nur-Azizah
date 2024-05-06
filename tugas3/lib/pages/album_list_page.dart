import 'package:coba/model/users_model.dart';
import 'package:coba/pages/album_detail_page.dart';
import 'package:coba/model/albums_model.dart';
import 'package:coba/load_data_source.dart';
import 'package:flutter/material.dart';

class AlbumListPage extends StatefulWidget {
  @override
  _AlbumListPageState createState() => _AlbumListPageState();
}

class _AlbumListPageState extends State<AlbumListPage> {
  List<Album> albums = [];
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    _fetchAlbums();
    _fetchUsers();
  }

  Future<void> _fetchAlbums() async {
    final fetchedAlbums = await DataSource.fetchAlbums();
    setState(() {
      albums = fetchedAlbums;
    });
  }

  Future<void> _fetchUsers() async {
    final fetchedUsers = await DataSource.fetchUsers();
    setState(() {
      users = fetchedUsers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums'),
      ),
      body: ListView.builder(
        itemCount: albums.length,
        itemBuilder: (context, index) {
          final album = albums[index];
          final user = users.firstWhere(
            (user) => user.id == album.userId,
          );

          return ListTile(
            title: Text(album.title ?? ''),
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AlbumDetailPage(album),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
