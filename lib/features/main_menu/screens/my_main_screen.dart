import 'package:ao/config/sizes.dart';
import 'package:ao/config/themes.dart';

import 'package:ao/features/main_menu/widgets/menu_slider.dart';
import 'package:ao/features/shared/data/database_repository.dart';
import 'package:ao/features/shared/data/mockdatabase_repository.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  runApp(const MyMainMenu());
}

class MyMainMenu extends StatefulWidget {
  const MyMainMenu({super.key});

  @override
  State<MyMainMenu> createState() => _MyMainMenuState();
}

class _MyMainMenuState extends State<MyMainMenu> {
  late final DatabaseRepository repository = MockDatabaseRepository();
  @override
  Widget build(BuildContext context) {
    //final List<MenuIcon> icon = _icons;
    return MaterialApp(
      theme: lightTheme,
      home: Scaffold(
        body: Stack(fit: StackFit.expand, children: [
          const Image(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 50,
            left: 100,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Menu",
                    style: TextStyle(
                        fontSize: headlineTextSizeAlt,
                        color: Color.fromARGB(255, 195, 245, 255),
                        fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(height: 3.2 * bigDistance),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 180,
                      width: 180,
                      child: MenuSlider(
                        repository: repository,
                      ),
                    ),
                  ),
                ]),
          ),
        ]),
      ),
    );
  }
}
