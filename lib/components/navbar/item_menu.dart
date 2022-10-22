import 'package:flutter/material.dart';

class ItemMenu extends StatefulWidget {
  const ItemMenu({super.key, required this.name, this.isActive = false, required this.onClick});

  final String name;
  final bool isActive;
  final void Function() onClick;

  @override
  State<ItemMenu> createState() => _ItemMenuState();
}

class _ItemMenuState extends State<ItemMenu> {
  var a = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onExit: (event) {
        setState(() {
          a = false;
        });
      },
      onHover: (event) => setState(() {
        a = true;
      }),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onClick,
        child: Container(
          color: Colors.transparent,
          margin: const EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 4,
                width: 100,
              ),
              SizedBox(
                child: Text(widget.name, style: TextStyle(color: widget.isActive ? Colors.white :  (a ? Colors.white : null)),),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                height: 4,
                width: widget.isActive ? 100 : (a ? 100 : 0),
                decoration:  BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5))
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}