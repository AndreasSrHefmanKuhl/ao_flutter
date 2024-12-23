import 'package:ao/features/chat/screens/chat_screen_bot.dart';
import 'package:ao/features/data_screen_tests/user_list_screen.dart';
import 'package:ao/features/main_menu/widgets/menu_icon.dart';
import 'package:ao/features/shared/data/database_repository.dart';
import 'package:ao/features/shared/data/mockdatabase_repository.dart';

import 'package:flutter/material.dart';

class MenuSlider extends StatefulWidget {
  final DatabaseRepository repository;
  // ignore: unused_field

  const MenuSlider({super.key, required this.repository});

  @override
  State<MenuSlider> createState() => _MenuSliderState();
}

class _MenuSliderState extends State<MenuSlider> {
  late final DatabaseRepository repository = MockDatabaseRepository();
  @override
  Widget build(BuildContext context) {
    final List<MenuIcon> icons = [
      MenuIcon(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BotScreen()),
        ),
        icon: (Icons.speaker_group_outlined),
        text: 'Hier gehts zum Chat',
      ),
      MenuIcon(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => UserListScreen(
                    repository: repository,
                  )),
        ),
        icon: (Icons.person_2),
        text: 'Hier gehts zum Profil... coming soon',
      ),
      MenuIcon(
        icon: (Icons.person_search_outlined),
        text: 'hier kann man sich mit Freunden austauschen... coming soon',
        onTap: () {},
      ),
    ];
    return ListView(
        padding: const EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        semanticChildCount: icons.length,
        children: [
          icons[0],
          const SizedBox(width: 30),
          icons[1],
          const SizedBox(width: 30),
          icons[2],
        ]);
  }
}
