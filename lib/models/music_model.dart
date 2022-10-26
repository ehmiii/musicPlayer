import 'package:flutter/material.dart';

class MusicModel {
  String collectionId;
  String trackId;
  String songTitle;
  String artist;
  String albumName;
  String album;
  String albumArt;
  double songDuration;
  MusicModel({
    required this.trackId,
    required this.collectionId,
    required this.songTitle,
    required this.album,
    required this.albumArt,
    required this.artist,
    required this.songDuration,
    required this.albumName,
  });
}
