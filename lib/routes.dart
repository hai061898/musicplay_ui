import 'package:get/get.dart';
import 'package:music_ui/pages/Audio/detail_screen.dart';
import 'package:music_ui/pages/home/home_screen.dart';

routes() => [
  GetPage(name: '/', page: ()=>HomeScreen()),
  // GetPage(name:'/detail', page: ()=>DetailScreen()),
];

