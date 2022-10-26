import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/gettingMusic.dart';

class DetailsWidget extends StatelessWidget {
  double mediaQueryHieght;
  DetailsWidget({Key? key, required this.mediaQueryHieght}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final songs = Provider.of<GettingMusic>(context, listen: true).album;
    return Container(
      // color: Colors.amber,
      height: mediaQueryHieght * 0.53,
      child: Column(
        children: [
          songs.isEmpty
              ? const Center(
                  child: Text(
                    "Welcome",
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                      itemCount: songs.length,
                      itemBuilder: (ctx, index) => Card(
                            child: ListTile(
                              leading: Image.network(songs[index].albumArt),
                              title: Text(songs[index].songTitle),
                            ),
                          ))),
        ],
      ),
    );
  }
}
