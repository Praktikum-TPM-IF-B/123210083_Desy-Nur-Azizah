import 'package:shared_preferences/shared_preferences.dart';

class PrefService {
  static Future<void> setLogin(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', isLoggedIn);
  }

  static Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  static Future<void> addFavorite(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favorites') ?? [];
    favorites.add(id);
    prefs.setStringList('favorites', favorites);
  }

  static Future<void> removeFavorite(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favorites') ?? [];
    favorites.remove(id);
    prefs.setStringList('favorites', favorites);
  }

  static Future<List<String>> getFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('favorites') ?? [];
  }
}
