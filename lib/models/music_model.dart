import 'package:flutter/material.dart';

class MusicModel {
  String songTitle;
  String artist;
  String albumName;
  String album;
  String albumArt;
  double songDuration;
  MusicModel({
    required this.songTitle,
    required this.album,
    required this.albumArt,
    required this.artist,
    required this.songDuration,
    required this.albumName,
  });
  void func(){
    print(artist);
  }
}
