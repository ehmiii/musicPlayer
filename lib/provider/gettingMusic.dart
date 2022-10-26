import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:university_project/models/music_model.dart';
import 'package:http/http.dart' as http;

class GettingMusic extends ChangeNotifier {
  List<MusicModel> _musicList = [];
  List<MusicModel> _albumList = [];

  List<MusicModel> get songList {
    return [..._musicList];
  }

  List<MusicModel> get album {
    return [..._albumList];
  }

  Future<void> getMusic(String term) async {
    Uri url = Uri.parse(
        "https://itunes.apple.com/search?term=$term&entity=song&limit=2&attribute=artistTerm");
    final respons =
        await http.get(url, headers: {'Content-Type': 'application/json'});
    if (respons.statusCode == 200) {
      final List<MusicModel> loadedItems = [];
      Map<String, dynamic> responsData =
          json.decode(respons.body) as Map<String, dynamic>;
      for (final dynamic song in responsData['results']) {
        loadedItems.add(MusicModel(
            collectionId: song["collectionId"].toString(),
            trackId: song['trackId'].toString(),
            album: song['collectionViewUrl'],
            songTitle: song['trackName'],
            albumName: song['collectionName'],
            albumArt: song["artworkUrl60"],
            artist: song['artistName'],
            songDuration: (song["trackTimeMillis"] / 1000) / 60));
      }
      _musicList = loadedItems;
    }
    notifyListeners();
  }

  Future<void> getMusicAlbum({required String collectionId}) async {
    Uri url = Uri.parse(
        "https://itunes.apple.com/lookup?id=$collectionId&entity=song");
    final respons =
        await http.get(url, headers: {'Content-Type': 'application/json'});
    if (respons.statusCode == 200) {
      final List<MusicModel> loadedItems = [];
      Map<String, dynamic> responsData =
          json.decode(respons.body) as Map<String, dynamic>;
      for (final dynamic song in responsData['results']) {
        if (song["wrapperType"] == 'collection') {
          continue;
        } else {
          loadedItems.add(MusicModel(
              collectionId: song["collectionId"].toString(),
              trackId: song['trackId'].toString(),
              album: song['collectionViewUrl'],
              songTitle: song['trackName'],
              albumName: song['collectionName'],
              albumArt: song["artworkUrl60"],
              artist: song['artistName'],
              songDuration: (song["trackTimeMillis"] / 1000) / 60));
        }
        _albumList = loadedItems;
      }
      notifyListeners();
    }
  }
}
