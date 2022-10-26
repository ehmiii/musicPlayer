import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_project/provider/gettingMusic.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget(
      {required this.mediaQueryHieght,
      required this.mediaQueryWidth,
      required this.searchSizeWidth});
  double mediaQueryWidth;
  double mediaQueryHieght;
  double searchSizeWidth;

  TextEditingController _searchController = TextEditingController();

  void searchMusic(BuildContext context) {
    Provider.of<GettingMusic>(context, listen: false)
        .getMusic(_searchController.text)
        .then((value) {});
  }

  @override
  Widget build(BuildContext context) {
    final songs = Provider.of<GettingMusic>(context, listen: true).songList;
    return Container(
      // color: Colors.red,
      width: mediaQueryWidth * 0.33,
      height: mediaQueryHieght,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: searchSizeWidth,
                child: TextFormField(
                  onChanged: (searchValue) {
                    Provider.of<GettingMusic>(context, listen: false)
                        .getMusic(searchValue);
                  },
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: const OutlineInputBorder(),
                    suffixIcon: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                          if (_searchController.text.isNotEmpty) {
                            searchMusic(context);
                          }
                        },
                        splashColor: Colors.grey,
                        child: const Icon(Icons.search)),
                  ),
                ),
              ),
            ],
          ),
          songs.isEmpty
              ? Expanded(
                  child: Container(),
                )
              : Expanded(
                  child: ListView.builder(
                      itemCount: songs.length,
                      itemBuilder: (ctx, index) {
                        return InkWell(
                          onTap: () async {
                            print('Hello');
                            await Provider.of<GettingMusic>(context,
                                    listen: false)
                                .getMusicAlbum(collectionId: songs[index].collectionId);
                          },
                          child: Card(
                            child: ListTile(
                              leading: Image.network(songs[index].albumArt),
                              title: Text(songs[index].songTitle),
                              subtitle: Text(
                                  "${songs[index].artist}\n${songs[index].albumName}"),
                              trailing: Text(
                                  "${songs[index].songDuration.toInt()}min"),
                            ),
                          ),
                        );
                      }),
                )
        ],
      ),
    );
  }
}
