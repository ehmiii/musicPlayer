import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/gettingMusic.dart';
import '../widgets/details.dart';
import '../widgets/search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double mediaQueryWidth = MediaQuery.of(context).size.width;
    double mediaQueryHieght = MediaQuery.of(context).size.height;
    double searchSizeWidth = mediaQueryWidth * 0.33;
    final song = Provider.of<GettingMusic>(context, listen: true).album;
    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          children: [
            SearchWidget(
                mediaQueryHieght: mediaQueryHieght,
                mediaQueryWidth: mediaQueryWidth,
                searchSizeWidth: searchSizeWidth),
            Container(
              color: Colors.white,
              width: mediaQueryWidth * 0.67,
              height: mediaQueryHieght,
              child: Column(
                children: [
                  Container(
                      color: Color.fromARGB(255, 253, 217, 217),
                      height: mediaQueryHieght * 0.32,
                      child: Center(
                        child: song.isEmpty
                            ? Image.asset('assets/images/musicIcon.png')
                            : CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    NetworkImage(song.first.albumArt)),
                      )),
                  Container(
                    color: Color.fromARGB(255, 253, 217, 217),
                    height: mediaQueryHieght * 0.15,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: InkWell(
                                  onTap: () {},
                                  child: Image.asset(
                                      'assets/images/previous.png'))),
                          Expanded(
                              child: InkWell(
                                  onTap: () {},
                                  child:
                                      Image.asset('assets/images/resume.png'))),
                          Expanded(
                              child: InkWell(
                                  onTap: () {},
                                  child:
                                      Image.asset('assets/images/next.png'))),
                        ]),
                  ),
                  DetailsWidget(mediaQueryHieght: mediaQueryHieght),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
