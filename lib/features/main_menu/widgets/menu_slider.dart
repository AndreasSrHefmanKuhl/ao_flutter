import 'package:ao/features/chat/chat_screen.dart';
import 'package:ao/features/main_menu/widgets/menu_icon.dart';

import 'package:flutter/material.dart';

class MenuSlider extends StatefulWidget {
  // ignore: unused_field

  const MenuSlider({
    super.key,
  });

  @override
  State<MenuSlider> createState() => _MenuSliderState();
}

class _MenuSliderState extends State<MenuSlider> {
  static final List<MenuIcon> _icons = [
   MenuIcon(onTap: () => MaterialPageRoute(
            builder: (BuildContext context) => const ChatScreen()),
      icon: (Icons.speaker_group_outlined),
      text: 'Hier gehts zum Chat',
    ),
     MenuIcon(onTap: () => MaterialPageRoute(
            builder: (BuildContext context) => const ()),,
      icon: (Icons.person_2),
      text: 'Hier gehts zum Profil',
    ),
    const MenuIcon(
        icon: (Icons.person_search_outlined),
        text: 'hier kann man sich mit Freunden austauschen'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        semanticChildCount: _icons.length,
        children: [
          _icons[0],
          const SizedBox(width: 30),
          _icons[1],
          const SizedBox(width: 30),
          _icons[2],
        ]);
  }
}
