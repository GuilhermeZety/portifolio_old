import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, required this.controller});
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => controller.animateTo(0, duration: const Duration(milliseconds: 200), curve: Curves.linear),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('GM', style: TextStyle(fontFamily: 'Press Start 2P', color: Colors.white, fontSize: 20)),
              Text('.', style: TextStyle(fontFamily: 'Press Start 2P', color: Theme.of(context).primaryColor, fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}