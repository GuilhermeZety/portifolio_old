import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portifolio/pages/home/widgets/sections/section.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:portifolio/components/buttons/button_outlined.dart';
import 'package:portifolio/utils/util.dart';
import 'package:portifolio/pages/home/home_viewmodel.dart';

class SecondSection extends StatefulWidget {
  const SecondSection({super.key, required this.controller});

  final HomeViewModel controller;
  
  @override
  State<SecondSection> createState() => _SecondSectionState();
}

class _SecondSectionState extends State<SecondSection> {
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
        height: 500,
        backgroundColor: Theme.of(context).colorScheme.background,                      
        durationOpacity: const Duration(seconds: 1),
        opacity: controller.secondSectionVisibility ? 1 : 0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Transform.translate(
              offset: Offset(controller.secondSectionAnimationL != null ? controller.secondSectionAnimationL!.value : 0, controller.secondSectionAnimationB != null ? controller.secondSectionAnimationB!.value : 0),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 90),
                margin: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  width: w > 800 ? 320 : 250 ,
                  height: w > 800 ? 320  :  250 ,
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(seconds: 2),
                        width:  w > 800 ? 300 : 230,
                        height:  w > 800 ? 300 : 230,
                        decoration: BoxDecoration(
                          color: controller.boxMeColor ? Theme.of(context).primaryColor : const Color(0xFFD92AF5) , 
                          borderRadius: BorderRadius.circular(5)
                        ),
                      ),
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 400),
                        left: 6,
                        top: 6,
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 2),
                          width: w > 800 ? 300 : 230,
                          height: w > 800 ? 300 : 230,
                          decoration: BoxDecoration(
                            border: Border(top: BorderSide(color: Theme.of(context).colorScheme.background, width: 6), left: BorderSide(color: Theme.of(context).colorScheme.background, width: 6))
                          ), 
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset('assets/images/me.jpeg')
                          )
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(controller.secondSectionAnimationR != null ? controller.secondSectionAnimationR!.value : 0, controller.secondSectionAnimationB != null ? controller.secondSectionAnimationB!.value : 0),
              child: Container(
                width: w > 800 ? (w * 0.95) - 400  :  (w * 0.95) - 280,       
                constraints: const BoxConstraints(
                  maxWidth: 1200 - 400,
                ),                             
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SelectionArea(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('SOBRE MIM', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 6),
                          const Text('Blumenau - SC', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          Text.rich(
                            TextSpan(
                              style: TextStyle(color: Theme.of(context).secondaryHeaderColor, fontSize: 16),
                              children: [
                                const TextSpan(
                                  text: '''Tenho 19 anos; Apaixonado por programação desde pequeno, estou ''',
                                ),
                                TextSpan(
                                  text: '''trabalhando na área de programação a 2 anos, ''',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple.shade200, fontSize: 17)
                                ),
                                const TextSpan(
                                  text: 'tendo iniciado no desenvolvimento web no '
                                  'front-end durante o periodo do estágio e tendo migrado para full stack logo após, '
                                  'lá trabalhei com frameworks e linguagens diversas como  '
                                ),
                                TextSpan(
                                  text: '''Vue.Js/Javascript/.Net core/C#/Bootstrap''',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple.shade200, fontSize: 17)
                                ),
                                const TextSpan(
                                  text: '''. porém uma oportunidade dentro da empresa me trouxe ao desenvolvimento com '''
                                ),
                                TextSpan(
                                  text: 'flutter',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple.shade200, fontSize: 17)
                                ),
                                const TextSpan(
                                  text: ''', aí a paixão veio de primeira, atualmente ja estou '''
                                ),
                                TextSpan(
                                  text: '''a 1 ano no desenvolvimento com flutter''',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple.shade200, fontSize: 17)
                                ),
                                const TextSpan(
                                  text: '''. Amo mexer com design(Tanto que esse do portifólio ficou bonitinho😁)'''
                                ),
                                const TextSpan(
                                  text: '''. Sou muito autodidata, e meus objetivos são grandes, seguirei sempre focado para alcança-los.'''
                                ),
                              ] 
                            ),
                          )
                        ],
                      ),
                    ),                                        
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: ButtonOutlinded(
                              onTap: () => html.window.open('https://github.com/GuilhermeZety/GuilhermeZety/files/9729893/Guilherme_Martins.pdf', '_blank'), 
                              name: 'Currículo', 
                              icon: Icon(FontAwesomeIcons.cloudArrowDown, color: Theme.of(context).primaryColor,),
                              color: Theme.of(context).primaryColor,
                              tooltipMessage: 'clique para baixar o curiculo',
                            ),
                          ),
                          ButtonOutlinded(
                            onTap: () => controller.copyEmail(context), 
                            name: 'E-mail', 
                            icon: const Icon(FontAwesomeIcons.cloudArrowDown, color: Color(0xFFD92AF5),),
                            color: const Color(0xFFD92AF5),
                            tooltipMessage: 'clique para copiar o email',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ),
          ],
        ),
      )
    :
    Section(
      height: 500,
      backgroundColor: Theme.of(context).colorScheme.background,                      
      durationOpacity: const Duration(seconds: 1),
      opacity: controller.secondSectionVisibility ? 1 : 0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.translate(
            offset: Offset(controller.secondSectionAnimationR != null ? controller.secondSectionAnimationR!.value : 0, controller.secondSectionAnimationB != null ? controller.secondSectionAnimationB!.value : 0),
            child: Container(
              width: (w * 0.95),
              padding: const EdgeInsets.symmetric(vertical: 35),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('SOBRE MIM', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  const Text('Blumenau - SC', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text.rich(
                    TextSpan(
                      style: TextStyle(color: Theme.of(context).secondaryHeaderColor, fontSize: 14),
                      children: [
                        const TextSpan(
                          text: '''Tenho 19 anos; Apaixonado por programação desde pequeno, estou ''',
                        ),
                        TextSpan(
                          text: '''trabalhando na área de programação a 2 anos, ''',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple.shade200, fontSize: 15)
                        ),
                        const TextSpan(
                          text: 'tendo iniciado no desenvolvimento web no '
                          'front-end durante o periodo do estágio e tendo migrado para full stack logo após, '
                          'lá trabalhei com frameworks e linguagens diversas como  '
                        ),
                        TextSpan(
                          text: '''Vue.Js/Javascript/.Net core/C#/Bootstrap''',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple.shade200, fontSize: 15)
                        ),
                        const TextSpan(
                          text: '''. porém uma oportunidade dentro da empresa me trouxe ao desenvolvimento com '''
                        ),
                        TextSpan(
                          text: 'flutter',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple.shade200, fontSize: 15)
                        ),
                        const TextSpan(
                          text: ''', aí a paixão veio de primeira, atualmente ja estou '''
                        ),
                        TextSpan(
                          text: '''a 1 ano no desenvolvimento com flutter''',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple.shade200, fontSize: 15)
                        ),
                        const TextSpan(
                          text: '''. Amo mexer com design(Tanto que esse do portifólio ficou bonitinho😁)'''
                        ),
                        const TextSpan(
                          text: '''. Sou muito autodidata, e meus objetivos são grandes, seguirei sempre focado para alcança-los.'''
                        ),
                      ] 
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: ButtonOutlinded(
                            onTap: () => html.window.open('https://github.com/GuilhermeZety/GuilhermeZety/files/9729893/Guilherme_Martins.pdf', '_blank'), 
                            name: 'Currículo', 
                            icon: Icon(FontAwesomeIcons.cloudArrowDown, color: Theme.of(context).primaryColor,),
                            color: Theme.of(context).primaryColor,
                            tooltipMessage: 'clique para baixar o curiculo',
                          ),
                        ),
                        ButtonOutlinded(
                          onTap: () => controller.copyEmail(context), 
                          name: 'E-mail', 
                          icon: const Icon(FontAwesomeIcons.cloudArrowDown, color: Color(0xFFD92AF5),),
                          color: const Color(0xFFD92AF5),
                          tooltipMessage: 'clique para copiar o email',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}