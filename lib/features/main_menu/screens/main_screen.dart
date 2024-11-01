import 'package:ao/config/sizes.dart';
import 'package:ao/config/themes.dart';
import 'package:ao/features/main_menu/widgets/menu_icon.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyMainMenu());
}

class MyMainMenu extends StatefulWidget {
  const MyMainMenu({super.key});

  @override
  State<MyMainMenu> createState() => _MyMainMenuState();
}

class _MyMainMenuState extends State<MyMainMenu> {
  final List<MenuIcon> _icons = const [
    MenuIcon(
        text: 'Hier gehts zum Chat', icon: Icon(Icons.speaker_group_outlined)),
    MenuIcon(text: 'Hier gehts zum Profil', icon: Icon(Icons.person_2)),
    MenuIcon(
        text: 'Hier gelangt man ins Forum',
        icon: Icon(Icons.person_search_outlined))
  ];

  @override
  Widget build(BuildContext context) {
    //final List<MenuIcon> icon = _icons;
    return MaterialApp(
      theme: lightTheme,
      home: const Scaffold(
        body: Stack(fit: StackFit.expand, children: [
          Image(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 50,
            left: 0,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Menu",
                    style: TextStyle(
                        fontSize: headlineTextSizeAlt,
                        color: Color.fromARGB(255, 195, 245, 255),
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(height: 3.2 * bigDistance),
                  SizedBox(
                    height: 200,
                    width: 400,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.all(6.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MenuIcon(
                                icon: Icon(
                                  color: Color.fromARGB(255, 195, 245, 255),
                                  Icons.speaker_group_outlined,
                                  size: bigDistance,
                                ),
                                text: 'Hier gehts zum Chat'),
                            SizedBox(width: smallDistance),
                            MenuIcon(
                                icon: Icon(
                                  color: Color.fromARGB(255, 195, 245, 255),
                                  Icons.person_2,
                                  size: bigDistance,
                                ),
                                text: 'Hier kannst du dein Profil bearbeiten'),
                            SizedBox(width: smallDistance),
                            MenuIcon(
                                icon: Icon(
                                  color: Color.fromARGB(255, 195, 245, 255),
                                  Icons.speaker_group_outlined,
                                  size: bigDistance,
                                ),
                                text: 'Hier gelangst du ins Forum'),
                            SizedBox(width: smallDistance),
                          ]),
                    ),
                  ),
                ]),
          ),
        ]),
      ),
    );
  }
}
