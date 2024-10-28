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
    final icon = _icons;
    return const MaterialApp(
      home: Scaffold(
        body: Stack(fit: StackFit.expand, children: [
          Image(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
          // Positioned(child: MenuCarousel(icon: icon)),
        ]),
      ),
    );
  }
}
