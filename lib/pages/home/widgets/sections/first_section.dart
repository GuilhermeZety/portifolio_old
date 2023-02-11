// ignore_for_file: avoid_web_libraries_in_flutter, file_names

import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portifolio/pages/home/widgets/sections/section.dart';
import 'package:portifolio/utils/util.dart';

import 'package:portifolio/components/buttons/button_outlined.dart';
import 'package:portifolio/pages/home/home_viewmodel.dart';


class FirstSection extends StatefulWidget {
  const FirstSection({super.key, required this.controller});

  final HomeViewModel controller;

  @override
  State<FirstSection> createState() => _FirstSectionState();
}

class _FirstSectionState extends State<FirstSection> {
  late HomeViewModel controller;

  @override
  void initState() {
    
    super.initState();
    controller = widget.controller;
  }
  
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return isLandscape(context) ? 
      Section(
        height: MediaQuery.of(context).size.height * 0.75,
        durationOpacity: const Duration(seconds: 1),
        opacity: controller.firstSectionVisibility ? 1 : 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween ,
          mainAxisSize: MainAxisSize.max,
          children: [
            Transform.translate(
              offset: Offset(controller.firstSectionAnimationL != null ? controller.firstSectionAnimationL!.value : 0, 0),
              child: SizedBox(
                // color: Colors.amber,
                width: 397,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start ,
                  children: [
                    SelectionArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Olá, eu sou o', style: TextStyle(fontSize: 32)),
                          TweenAnimationBuilder<int>(
                            tween: IntTween(begin: 0, end: controller.myname.length), 
                            duration: const Duration(seconds: 3), 
                            builder: (BuildContext context, int value, child) {
                              return Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(controller.myname.substring(0, value ).trim(), style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 40, letterSpacing: 3)),
                                  Text('|', style: TextStyle(color: controller.boolColorMyNameFinaly ? Colors.white : Colors.transparent, fontSize: 32)),
                                ],
                              );
                            }
                          ),
                          const Text('Desenvolvedor Flutter', style: TextStyle(fontSize: 32)),
                          const SizedBox(height: 10),
                        ]
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ButtonOutlinded(
                          onTap: () => html.window.open('https://www.linkedin.com/in/guilherme-m-l-martins/', '_blank'), 
                          name: 'Linkedin', 
                          icon: const Icon(FontAwesomeIcons.linkedinIn, color: Color(0xFF0e76a8)), 
                          color: const Color(0xFF0e76a8),
                          tooltipMessage: 'clique para abrir em outra aba o perfil',
                        ),
                        const SizedBox(width: 20),                                      
                        ButtonOutlinded(
                          onTap: () => html.window.open('https://github.com/GuilhermeZety', '_blank'), 
                          name: 'GitHub', 
                          icon: const Icon(FontAwesomeIcons.linkedinIn, color: Color(0xFFD92AF5)), 
                          color: const Color(0xFFD92AF5),
                          tooltipMessage: 'clique para abrir em outra aba o perfil',
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(controller.firstSectionAnimationR != null ? controller.firstSectionAnimationR!.value : 0, controller.firstSectionAnimationRB != null ? controller.firstSectionAnimationRB!.value : 0),
              child: Container(
                // color: Colors.red,
                width:  w > 740 ? MediaQuery.of(context).size.width * 0.40 : MediaQuery.of(context).size.width *0.35,
                constraints: const BoxConstraints(
                  maxWidth: 500,
                  maxHeight: 400
                ),
                child: Image.asset('assets/gifs/spinning_cat.gif'),
              ),
            )
          ],
        ),
      )
    :
    Section(
      height: MediaQuery.of(context).size.height * 0.75,
      durationOpacity: const Duration(seconds: 1),
      opacity: controller.firstSectionVisibility ? 1 : 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Transform.translate(
            offset: Offset(0, controller.firstSectionAnimationL != null ? - controller.firstSectionAnimationL!.value : 0),
            child: SizedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SelectableText('Olá, eu sou o', style: TextStyle(fontSize: 32)),
                  TweenAnimationBuilder<int>(
                    tween: IntTween(begin: 0, end: controller.myname.length), 
                    duration: const Duration(seconds: 3), 
                    builder: (BuildContext context, int value, child) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SelectableText(controller.myname.substring(0, value ).trim(), style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 34, letterSpacing: 3)),
                          
                          Text('|', style: TextStyle(color: controller.boolColorMyNameFinaly ? Colors.white : Colors.transparent, fontSize: 30)),
                        ],
                      );
                    }
                  ),
                  const SelectableText('Desenvolvedor Flutter', style: TextStyle(fontSize: 32)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ButtonOutlinded(
                        onTap: () => html.window.open('https://www.linkedin.com/in/guilherme-m-l-martins/', '_blank'), 
                        name: 'Linkedin', 
                        icon: const Icon(FontAwesomeIcons.linkedinIn, color: Color(0xFF0e76a8)), 
                        color: const Color(0xFF0e76a8),
                        tooltipMessage: 'clique para abrir em outra aba o perfil',
                      ),
                      const SizedBox(width: 20),                                      
                      ButtonOutlinded(
                        onTap: () => html.window.open('https://github.com/GuilhermeZety', '_blank'), 
                        name: 'GitHub', 
                        icon: const Icon(FontAwesomeIcons.linkedinIn, color: Color(0xFFD92AF5)), 
                        color: const Color(0xFFD92AF5),
                        tooltipMessage: 'clique para abrir em outra aba o perfil',
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}