import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
