import 'package:flutter/material.dart';
import 'package:portifolio/pages/home/home_page.dart';
import 'package:portifolio/utils/util.dart';

import 'item_menu.dart';
import 'logo.dart';

class NavBar extends StatefulWidget with PreferredSizeWidget{
  const NavBar({
    super.key, 
    this.width = 100, 
    required this.height, 
    required this.controller,
    this.homeIsActive = false,
    this.aboutIsActive = false,
    this.habilitiesIsActive = false,
    this.projectsIsActive = false,
  });
  
  final double height;
  final double width;
  final ScrollController controller;

  final bool homeIsActive;
  final bool aboutIsActive;
  final bool habilitiesIsActive;
  final bool projectsIsActive;

  @override
  State<NavBar> createState() => _NavBarState();
  
  @override
  Size get preferredSize => Size(width, height);
}

class _NavBarState extends State<NavBar> {

  @override
  Widget build(BuildContext context) {    
    var w = MediaQuery.of(context).size.width;

    return Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          border: const Border(bottom: BorderSide(color: Color(0xFF29292E), width: 1)),
          color: Theme.of(context).backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              width: w * 0.95,
              constraints: const BoxConstraints(
                maxWidth: 1200
              ),
              child: Row(     
                mainAxisAlignment: MainAxisAlignment.spaceBetween,     
                mainAxisSize: MainAxisSize.min,
                children: [
                  Logo(controller: scrollController,),
                  isLandscape(context) ?
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ItemMenu(name: 'Home', onClick: () {
                          widget.controller.animateTo(0, duration: const Duration(milliseconds: 200), curve: Curves.linear);
                        } , isActive: widget.homeIsActive),
                        ItemMenu(name: 'Sobre', onClick: () {
                          widget.controller.animateTo(MediaQuery.of(context).size.height * 0.78 + 40, duration: const Duration(milliseconds: 500), curve: Curves.linear);
                          build(context);
                        }, isActive: widget.aboutIsActive,),
                        ItemMenu(name: 'Projetos', onClick: () {
                          widget.controller.animateTo((MediaQuery.of(context).size.height * 0.78 + 40) + 500, duration: const Duration(milliseconds: 500), curve: Curves.linear);
                        }, isActive: widget.projectsIsActive),
                        ItemMenu(name: 'Habilidades', onClick: () {
                          widget.controller.animateTo(1500, duration: const Duration(milliseconds: 500), curve: Curves.linear);
                        }, isActive: widget.habilitiesIsActive,),
                        // Container(
                        //   padding: const EdgeInsets.symmetric(horizontal: 5),
                        //   decoration: BoxDecoration(
                        //     border: Border.all(color: const Color(0xFF29292E), width: 1),
                        //     borderRadius: BorderRadius.circular(6)
                        //   ),
                        //   child: const Text("Pt")
                        // )
                      ],
                    ): 
                    IconButton(onPressed: () => {}, icon: const Icon(Icons.menu))
                ],
              ),
            ),
          ],
        ),
      );
  }
}