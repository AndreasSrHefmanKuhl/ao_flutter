import 'package:ao/config/sizes.dart';
import 'package:ao/features/main_menu/widgets/menu_icon.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MenuSlider extends StatelessWidget {
  const MenuSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: ScrollPhysics(parent: BouncingScrollPhysics()),
      dragStartBehavior: DragStartBehavior.start,
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(6.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
      ]),
    );
  }
}
