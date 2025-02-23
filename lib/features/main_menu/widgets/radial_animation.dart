import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vector_math/vector_math_64.dart' show radians;
import 'package:vector_math/vector_math_64.dart' as vector_math;

class RadialAnimation extends StatelessWidget {
  RadialAnimation({super.key, required this.controller})
      : scale = Tween<double>(
          begin: 1.5,
          end: 0.0,
        ).animate(
          CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn),
        ),
        translation = Tween<double>(
          begin: 0.0,
          end: 100.0,
        ).animate(
          CurvedAnimation(parent: controller, curve: Curves.linear),
        ),
        rotation = Tween<double>(
          begin: 0.0,
          end: 360.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.3,
              0.9,
              curve: Curves.decelerate,
            ),
          ),
        );

  final AnimationController controller;
  final Animation<double> scale;
  final Animation<double> translation;
  final Animation<double> rotation;

  @override
  build(context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, builder) {
          return Stack(alignment: Alignment.center, children: [
            _buildButton(0,
                color: Colors.red, icon: FontAwesomeIcons.thumbtack),
            _buildButton(45,
                color: Colors.green, icon: FontAwesomeIcons.sprayCan),
            _buildButton(90, color: Colors.orange, icon: FontAwesomeIcons.fire),
            _buildButton(135,
                color: Colors.blue, icon: FontAwesomeIcons.kiwiBird),
            _buildButton(180, color: Colors.black, icon: FontAwesomeIcons.cat),
            _buildButton(225, color: Colors.indigo, icon: FontAwesomeIcons.paw),
            _buildButton(270, color: Colors.pink, icon: FontAwesomeIcons.bong),
            _buildButton(315,
                color: Colors.yellow, icon: FontAwesomeIcons.bolt),
            Transform.scale(
              scale: scale.value -
                  1.5, // subtract the beginning value to run the opposite animation
              child: FloatingActionButton(
                  onPressed: _close,
                  backgroundColor: Colors.red,
                  child: const Icon(FontAwesomeIcons.circleXmark)),
            ),
            Transform.scale(
              scale: scale.value,
              child: FloatingActionButton(
                  onPressed: _open,
                  child: const Icon(FontAwesomeIcons.solidCircleDot)),
            )
          ]);
        });
  }

  _buildButton(double angle, {Color? color, IconData? icon}) {
    final double rad = radians(angle);
    return Transform(
        transform: vector_math.Matrix4.identity()
          ..translate(
              (translation.value) * cos(rad), (translation.value) * sin(rad)),
        child: FloatingActionButton(
            backgroundColor: color,
            onPressed: _close,
            elevation: 0,
            child: Icon(icon)));
  }

  _open() {
    controller.forward();
  }

  _close() {
    controller.reverse();
  }
}
