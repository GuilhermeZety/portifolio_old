import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portifolio/utils/util.dart';

import 'dart:html' as html;

import '../../../components/buttons/button_outlined.dart';

class ProjectWidget extends StatefulWidget {
  const ProjectWidget({
    super.key,
    required this.width,
    this.height = 700,
    required this.title,
    required this.content,
    required this.languages,
    required this.imageAsset,
    required this.linkGithub,
    this.linkWeb,
    this.message,
  
  });
  final double width;
  final double height;
  final String title;
  final String content;
  final String languages;
  final String imageAsset;
  final String linkGithub;
  final String? linkWeb;
  final String? message;


  @override
  State<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> with SingleTickerProviderStateMixin {  
  late AnimationController animationController;
  Animation<double>? animationAngle;
  Animation<double>? animationScale;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this
    );
    
    animationAngle = Tween(begin: -0.05, end: 0.05).animate(animationController)..addListener(() => setState(() {}));
    animationScale = Tween(begin: 1.0, end: 1.1).animate(animationController)..addListener(() => setState(() {}));
  }

  hooved(p){
    animationController.forward();
  }

  clear(p){
    animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width, 
      constraints: BoxConstraints(
        maxWidth: 550,
        minHeight: widget.height
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            onHover: hooved,
            onExit: clear,
            child: GestureDetector(
              onTap: () => {},
              child: SizedBox(
                width: widget.width,
                child: Stack(
                  children: [
                    Center(
                      child: Transform.rotate(
                        angle: animationAngle != null ? animationAngle!.value : -0.05,
                        child: Transform.scale(                        
                          scale: animationScale != null ? animationScale!.value : 1.0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFD92AF5).withOpacity(0.5),
                              borderRadius: BorderRadius.circular(30)   
                            ),
                            constraints: const BoxConstraints(
                              maxWidth: 500,
                              maxHeight: 275
                            ),
                            width: widget.width - 50,
                            height: widget.width / 2,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Transform.scale(
                        scale: animationScale != null ? animationScale!.value : 1.0,
                        child: Container(    
                          
                            constraints: const BoxConstraints(
                              maxWidth: 500,
                              maxHeight: 275
                            ),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFD92AF5).withOpacity(0.2),
                                blurRadius: 5
                              ),
                              const BoxShadow(
                                color: Colors.black38,
                                blurRadius: 6
                              ),
                            ]
                          ),
                          child: Image.asset(widget.imageAsset, width: widget.width - 50)
                        )
                      )
                    )
                  ],
                ),
              ),
            ),
          ),
          SelectionArea(
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(widget.title, style: TextStyle(fontSize: isLandscape(context) ? 24 : 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Text(widget.content, style: TextStyle(fontSize: isLandscape(context) ? 18 : 14, color: Theme.of(context).secondaryHeaderColor)),
                  const SizedBox(height: 20),
                  Text(widget.languages, style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor)),
                ],
              )
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: isLandscape(context) ?
              widget.width > 300 ?
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.linkWeb != null ?
                  ButtonOutlinded(
                    onTap: () => html.window.open(widget.linkWeb!, '_blank'),
                    name: widget.message ?? 'Acessar', 
                    icon: Icon(FontAwesomeIcons.cloudArrowDown, color: Theme.of(context).primaryColor,),
                    color: Theme.of(context).primaryColor,
                    tooltipMessage: 'clique para acessar o projeto',
                  )
                :                   
                const SizedBox(),
                ButtonOutlinded(
                  onTap: () => html.window.open(widget.linkGithub, '_blank'),
                  name: 'Repositório', 
                  icon: const Icon(FontAwesomeIcons.cloudArrowDown, color: Color(0xFFD92AF5),),
                  color: const Color(0xFFD92AF5),
                  tooltipMessage: 'clique para acessar o repositório no github',
                ),
              ],
            )
              :
            Column(
              children: [
                widget.linkWeb != null ?
                ButtonOutlinded(
                  onTap: () => html.window.open(widget.linkWeb!, '_blank'),
                  name: widget.message ?? 'Acessar', 
                  icon: Icon(FontAwesomeIcons.cloudArrowDown, color: Theme.of(context).primaryColor,),
                  color: Theme.of(context).primaryColor,
                  tooltipMessage: 'clique para acessar o projeto',
                )
                : const SizedBox(),
                const SizedBox(height: 10),
                ButtonOutlinded(
                  onTap: () => html.window.open(widget.linkGithub, '_blank'),
                  name: 'Repositório', 
                  icon: const Icon(FontAwesomeIcons.cloudArrowDown, color: Color(0xFFD92AF5),),
                  color: const Color(0xFFD92AF5),
                  tooltipMessage: 'clique para acessar o repositório no github',
                ),
              ],
            )

            :
            Column(
              children: [
                widget.linkWeb != null ?
                ButtonOutlinded(
                  onTap: () => html.window.open(widget.linkWeb!, '_blank'),
                  name: widget.message ?? 'Acessar', 
                  icon: Icon(FontAwesomeIcons.cloudArrowDown, color: Theme.of(context).primaryColor,),
                  color: Theme.of(context).primaryColor,
                  tooltipMessage: 'clique para acessar o projeto',
                ): const SizedBox(),
                const SizedBox(height: 10),
                ButtonOutlinded(
                  onTap: () => html.window.open(widget.linkGithub, '_blank'),
                  name: 'Repositório', 
                  icon: const Icon(FontAwesomeIcons.cloudArrowDown, color: Color(0xFFD92AF5),),
                  color: const Color(0xFFD92AF5),
                  tooltipMessage: 'clique para acessar o repositório no github',
                ),
              ],
            )
          )                                      
        ],
      ),
    );
  }
}