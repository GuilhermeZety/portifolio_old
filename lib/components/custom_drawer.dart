import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key,
    required this.controller,
  });

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
          ItemDrawer(
            isActive: controller.offset >= 0 && controller.offset < MediaQuery.of(context).size.height * 0.78 + 40, 
            name: 'Home', 
            ontap: () => controller.animateTo(0, duration: const Duration(milliseconds: 200), curve: Curves.linear)
          ),
          ItemDrawer(
            isActive: controller.offset >= MediaQuery.of(context).size.height * 0.78 + 40 && controller.offset < (MediaQuery.of(context).size.height * 0.78 + 40) + 500, 
            name: 'Sobre', 
            ontap: () => controller.animateTo(MediaQuery.of(context).size.height * 0.78 + 40, duration: const Duration(milliseconds: 200), curve: Curves.linear)
          ),
          ItemDrawer(
            isActive: controller.offset >= (MediaQuery.of(context).size.height * 0.78 + 40) + 500 && controller.offset < (MediaQuery.of(context).size.height * 0.78 + 40) + 3500, 
            name: 'Experiência', ontap: () => controller.animateTo((MediaQuery.of(context).size.height * 0.78 + 40) + 500, duration: const Duration(milliseconds: 200), curve: Curves.linear)
          ),
          ItemDrawer(
            isActive: controller.offset >= (MediaQuery.of(context).size.height * 0.78 + 40) + 3500, 
            name: 'Habilidades', ontap: () => controller.animateTo((MediaQuery.of(context).size.height * 0.78 + 40) + 4500, duration: const Duration(milliseconds: 200), curve: Curves.linear)
          ),
        ],
      ),
    );
  }
}

class ItemDrawer extends StatelessWidget {
  const ItemDrawer({super.key, required this.isActive, required this.name, required this.ontap});

  final bool isActive;
  final String name;
  final void Function() ontap;

  @override 
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(left: 10, top: 3, bottom: 3),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color:  isActive ? Theme.of(context).primaryColor : Colors.transparent, width: 3))
        ),      
        child: Text(name),
      ),
    );
  }
}