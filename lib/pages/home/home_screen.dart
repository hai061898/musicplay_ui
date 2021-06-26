import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:music_ui/data/provider/music_data.dart';
import 'package:music_ui/pages/Audio/detail_screen.dart';
// import 'package:music_ui/pages/Audio/detail_screen.dart';
import 'package:music_ui/utils/color.dart';

import 'components/Listmusics.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List music;
  @override
  void initState() {
    super.initState();
    music = getlist();
  }

  List getlist() {
    return datamusic;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimary,
        appBar: AppBar(
          backgroundColor: kPrimary,
          title: Text(
            "Recommended Musics",
            style: TextStyle(
                color: Colors.white70,
                fontStyle: FontStyle.italic,
                fontSize: 20.0),
          ),
        ),
        body: Stack(children: [
          SvgPicture.asset(
            'assets/bg_home_border.svg',
            width: Get.width,
            height: Get.height,
            alignment: AlignmentDirectional.topStart,
          ),
          SvgPicture.asset(
            'assets/bg_moon_home.svg',
            width: Get.width,
            height: Get.height,
            alignment: AlignmentDirectional.topStart,
          ),
          Column(children: [
            //divided into two parts
            //one which consists of list of songs
            Expanded(
              child: ListView.builder(
                  itemCount: getlist().length,
                  itemBuilder: (context, index) => customListView(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailPage(mMusic: music[index],)),
                          );
                        },
                        // =>Get.to(DetailScreen(musics: music[index],)),
                        title: music[index].title,
                        singer: music[index].singer,
                        image: music[index].image,
                      )),
            ),
          ]),
        ]));
  }
}
