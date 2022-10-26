import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_project/models/music_model.dart';
import 'package:university_project/provider/gettingMusic.dart';

class SearchWidget extends StatelessWidget {
  double mediaQueryWidth;
  double mediaQueryHieght;
  double searchSizeWidth;
  SearchWidget(
      {required this.mediaQueryHieght,
      required this.mediaQueryWidth,
      required this.searchSizeWidth});

  @override
  Widget build(BuildContext context) {
    final songs = Provider.of<GettingMusic>(context, listen: true).songList;
    return Container(
      // color: Colors.red,
      width: mediaQueryWidth * 0.33,
      height: mediaQueryHieght,
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: searchSizeWidth,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: OutlineInputBorder(),
                      suffixIcon: InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {
                            Provider.of<GettingMusic>(context, listen: false)
                                .getMusic('jhon');
                          },
                          splashColor: Colors.grey,
                          child: Icon(Icons.search)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          songs.length == 0
              ? Expanded(
                  child: Container(
                    color: Colors.red,
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                      itemCount: songs.length,
                      itemBuilder: (ctx, index) {
                        print(songs[index].artist);
                        return Card(
                          child: ListTile(
                            leading: Text(songs[index].artist),
                          ),
                        );
                      }),
                )
        ],
      ),
    );
  }
}
