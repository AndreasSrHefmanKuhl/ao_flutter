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
      padding: EdgeInsets.all(4.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.all(6.0),
          child: SizedBox(
            child: Expanded(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                MenuIcon(
                    icon: Icon(
                  color: Color.fromARGB(255, 195, 245, 255),
                  Icons.phone_in_talk_outlined,
                  size: 4 * smallDistance,
                )),
                Text('Hier gehts zum Chat'),
              ]),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.all(6.0),
          child: SizedBox(
            child: Expanded(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                MenuIcon(
                    icon: Icon(
                  color: Color.fromARGB(255, 195, 245, 255),
                  Icons.person,
                  size: 4 * smallDistance,
                )),
                Text(
                  'Hier gehts zum Profil',
                  strutStyle: StrutStyle(),
                ),
              ]),
            ),
          ),
        ),
        // text: 'Hier kannst du dein Profil bearbeiten'),

        MenuIcon(
            icon: Icon(
          color: Color.fromARGB(255, 195, 245, 255),
          Icons.speaker_group_outlined,
          size: bigDistance,
        )),
      ]),
    );
  }
}
