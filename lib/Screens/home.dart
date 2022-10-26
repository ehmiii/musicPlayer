import 'package:flutter/material.dart';
import 'package:university_project/widgets/details.dart';
import 'package:university_project/widgets/search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double mediaQueryWidth = MediaQuery.of(context).size.width;
    double mediaQueryHieght = MediaQuery.of(context).size.height;
    double searchSizeWidth = mediaQueryWidth * 0.33;
    return Scaffold(
      body: Row(
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
                      child: Image.asset('assets/images/musicIcon.png'),
                    )),
                Container(
                  color: Color.fromARGB(255, 253, 217, 217),
                  height: mediaQueryHieght * 0.15,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/previous.png'),
                        Image.asset('assets/images/resume.png'),
                        Image.asset('assets/images/next.png'),
                      ]),
                ),
                DetailsWidget(mediaQueryHieght: mediaQueryHieght),
              ],
            ),
          )
        ],
      ),
    );
  }
}
