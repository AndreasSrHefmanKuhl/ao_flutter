import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RadialMenu extends StatefulWidget {
  const RadialMenu({super.key});
  @override
  createState() => _RadialMenuState();
}

class _RadialMenuState extends State<RadialMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return RadialAnimation(
        controller: controller); // Replace with your widget tree
  }
}

class RadialAnimation extends StatelessWidget {
  final AnimationController controller;
  const RadialAnimation({required Key key, required this.controller})
      : super(key: key);

  @override
  build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller, builder: (context, builder) {
          return Stack(alignment:Alignment.center,
          children : [ FloatingActionButton(child:Icon(FontAwesomeIcons.walkieTalkie) )] ))});

    _open() {
      controller.forward();
    }

    _close() {
      controller.reverse();
    }
  }
}
