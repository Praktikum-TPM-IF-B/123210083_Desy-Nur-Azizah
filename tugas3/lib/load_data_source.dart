import 'package:coba/model/albums_model.dart';
import 'package:coba/base_network.dart';
import 'package:coba/model/photo_model.dart';
import 'package:coba/model/users_model.dart';

class DataSource {
  static Future<List<Album>> fetchAlbums() async {
    final data = await BaseNetwork.get('albums');
    final List<Album> fetchedAlbums = (data as List)
        .map((albumJson) => Album.fromJson(albumJson))
        .toList();
    return fetchedAlbums;
  }

  static Future<List<Photo>> fetchPhotos(int albumId) async {
    final data = await BaseNetwork.get('photos?albumId=$albumId');
    final List<Photo> fetchedPhotos = (data as List)
        .map((photoJson) => Photo.fromJson(photoJson))
        .toList();
    return fetchedPhotos;
  }

  static Future<List<User>> fetchUsers() async {
    final data = await BaseNetwork.get('users');
    final List<User> fetchedUsers = (data as List)
        .map((userJson) => User.fromJson(userJson))
        .toList();
    return fetchedUsers;
  }
}
