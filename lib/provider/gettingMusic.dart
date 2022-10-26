import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:university_project/models/music_model.dart';
import 'package:http/http.dart' as http;

class GettingMusic extends ChangeNotifier {
  List<MusicModel> _musicList = [];
  Future<void> getMusic(String term) async {
    Uri url = Uri.parse(
        "https://itunes.apple.com/search?term=$term&entity=song&limit=2&attribute=artistTerm");
    final respon =
        await http.get(url, headers: {'Content-Type': 'application/json'});
    if (respon.statusCode == 200) {
      Map<String, dynamic> responsData =
          json.decode(respon.body) as Map<String, dynamic>;
      responsData.forEach((song, songData) {
        MusicModel mo = MusicModel(
            songTitle: songData['trackName'],
            album: songData['collectionName'],
            albumArt: songData['artworkUrl100'],
            artist: songData['artistName'],
            artWorkImageUrl: songData['trackViewUrl']);
        print(mo.artist);
      });
    }
  }
}
