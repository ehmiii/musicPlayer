import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:university_project/models/music_model.dart';
import 'package:http/http.dart' as http;

class GettingMusic extends ChangeNotifier {
  List<MusicModel> _musicList = [];

  List<MusicModel> get songList {
    return [..._musicList];
  }

  Future<void> getMusic(String term) async {
    Uri url = Uri.parse(
        "https://itunes.apple.com/search?term=$term&entity=song&limit=2&attribute=artistTerm");
    final respon =
        await http.get(url, headers: {'Content-Type': 'application/json'});
    if (respon.statusCode == 200) {
      final List<MusicModel> loadedItems = [];
      Map<String, dynamic> responsData =
          json.decode(respon.body) as Map<String, dynamic>;
      for (final dynamic song in responsData['results']) {
        loadedItems.add(MusicModel(
          songTitle: song['trackName'],
          album: song['collectionViewUrl'],
          albumArt: song["artworkUrl60"],
          artist: song['artistName'],
        ));
      }
      _musicList = loadedItems;
    }
    notifyListeners();
  }
}
