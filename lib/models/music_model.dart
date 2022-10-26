import 'package:flutter/material.dart';

class MusicModel {
  String songTitle;
  String artist;
  String album;
  String albumArt;
  // String artWorkImageUrl;
  MusicModel({
    required this.songTitle,
    required this.album,
    required this.albumArt,
    required this.artist,
   
  });
  void func(){
    print(artist);
  }
}
