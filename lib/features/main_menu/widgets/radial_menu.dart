import 'package:ao/features/main_menu/widgets/radial_animation.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

// The parent Materiial App
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(body: SizedBox.expand(child: RadialMenu())));
  }
}

// The stateful widget + animation controller
class RadialMenu extends StatefulWidget {
  const RadialMenu({super.key});

  @override
  createState() => _RadialMenuState();
}

class _RadialMenuState extends State<RadialMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return RadialAnimation(controller: controller);
  }
}


// The Animation 
