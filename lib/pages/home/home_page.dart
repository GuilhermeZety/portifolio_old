
// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:async';
import 'dart:html' as html;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portifolio/components/custom_drawer.dart';
import 'package:portifolio/components/tab_bar_icons.dart';
import 'package:portifolio/pages/home/widgets/sections/FirstSection.dart';
import 'package:portifolio/pages/home/widgets/sections/SecondSection.dart';
import 'package:portifolio/pages/home/widgets/sections/ThirdSection.dart';
import 'package:portifolio/pages/home/widgets/sections/section.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import '../../components/navbar/nav_bar.dart';
import '../../utils/util.dart';
import 'home_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  var controller = HomeViewModel();
  
  @override
  void initState() {
    super.initState(); 

    controller.setFirstSectionAnimationController(AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this
    ));

    controller.setSecondSectionAnimationController(AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this
    ));

    controller.setFourthSectionAnimationController(AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this
    ));

    ///Periodics
      Timer.periodic(const Duration(milliseconds: 350), (t) {
        setState(() {
          controller.boolColorMyNameFinaly = !controller.boolColorMyNameFinaly;
        });
      });

      Timer.periodic(const Duration(milliseconds: 800), (t) {
        setState(() {
          controller.boolArrowContinue = !controller.boolArrowContinue;
        });
      });

      Timer.periodic(const Duration(milliseconds: 2000), (t) {
        setState(() {
          controller.boxMeColor = !controller.boxMeColor;
        });
      });
    ///
    

    Timer.run(() async => await controller.onLoad(() => setState(() {})));
    
  }

  @override
  void dispose() {
    controller.firstSectionAnimationController.dispose();
    controller.secondSectionAnimationController.dispose();
    controller.fourthSectionAnimationController.dispose();
    controller.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return NotificationListener(
      onNotification: (t) => controller.notificationListenerUptations(context, t),
      child: Title(
        color: Colors.white,
        title: 'Portifólio | Guilherme Martins',
        child: Scaffold(            
            drawer: CustomDrawer(controller: controller.scrollController),
            appBar: NavBar(height: 70, controller: controller.scrollController, aboutIsActive: controller.aboutIsActive, habilitiesIsActive: controller.habilitiesIsActive, homeIsActive: controller.homeIsActive, experienceIsActive: controller.experienceIsActive),
            body: SafeArea(
              child: WebSmoothScroll(
                  animationDuration: 100,
                  controller: controller.scrollController,            
                  child: SingleChildScrollView(
                    physics: isLandscape(context) ? const NeverScrollableScrollPhysics() : const AlwaysScrollableScrollPhysics(),
                    controller: controller.scrollController,              
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children:  [
                          //First section - Inicio
                          FirstSection(controller: controller),
                          //Arrow Continue - Continue
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MouseRegion(
                                onHover: (event) => setState(() {
                                  controller.colorArrowContinue = Theme.of(context).primaryColor;
                                }),
                                onExit: (event) => setState(() {
                                  controller.colorArrowContinue = Colors.grey.shade300;
                                }),
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () => controller.scrollController.animateTo(MediaQuery.of(context).size.height * 0.78 + 40, duration: const Duration(milliseconds: 500), curve: Curves.linearToEaseOut),
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(vertical: 20),
                                    child: Row(
                                      children:  [
                                        AnimatedOpacity(
                                          opacity: controller.boolArrowContinue ? 0 : 1,
                                          duration: const Duration(milliseconds: 300),
                                          child: AnimatedContainer(
                                            height: 40,
                                            duration: const Duration(milliseconds: 1200),
                                            padding: EdgeInsets.only(top: controller.boolArrowContinue ? 0 : 10, bottom: controller.boolArrowContinue ? 10 : 0),
                                            child: Icon(FontAwesomeIcons.anglesDown, size: 14, color: controller.colorArrowContinue)
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        AnimatedContainer(
                                          duration: const Duration(milliseconds: 1200),
                                          child: Center(child: Text('continue', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: controller.colorArrowContinue, letterSpacing: 3)))
                                        ),
                                        const SizedBox(width: 5),
                                        AnimatedOpacity(
                                          opacity: controller.boolArrowContinue ? 0 : 1,
                                          duration: const Duration(milliseconds: 300),
                                          child: AnimatedContainer(
                                            height: 40,
                                            duration: const Duration(milliseconds: 1200),
                                            padding: EdgeInsets.only(top: controller.boolArrowContinue ? 0 : 10, bottom: controller.boolArrowContinue ? 10 : 0),
                                            child: Icon(FontAwesomeIcons.anglesDown, size: 14, color: controller.colorArrowContinue,)
                                          ),
                                        )
                                      ],
                                    )
                                  ),
                                ),
                              )
                            ],
                          ),
                          //Second Section - Sobre
                          SecondSection(controller: controller),
                          //Third Section - Experiencia
                          ThirdSection(controller: controller),             
                          //Fourth Section - Habilidades
                          Section(
                            height: 400,
                            backgroundColor: Theme.of(context).backgroundColor,                      
                            durationOpacity: const Duration(seconds: 1),
                            opacity: controller.fourthSectionVisibility ? 1 : 0,
                            child: Transform.translate(
                                offset: Offset(0, controller.fourthSectionAnimationB != null ? controller.fourthSectionAnimationB!.value : 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 20, top: 20),
                                    child: SelectableText('HABILIDADES', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, ),),
                                  ),
                                  Row(
                                    mainAxisAlignment: isLandscape(context) ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TabBarIcons(
                                        width: isLandscape(context) ? ( w > 950 ?  (w * 0.95) - 250 : (w * 0.95) ) : (w * 0.95) ,
                                        constraints: const BoxConstraints(
                                          maxWidth: 1200 - 300
                                        ),
                                        tabWidth: 200 + (w * 0.05),
                                        height: 310,
                                        tabs: [
                                          SvgPicture.asset('assets/svg/flutter.svg'),
                                          SvgPicture.asset('assets/svg/dart.svg'),
                                          SvgPicture.asset('assets/svg/firebase.svg'),
                                          Container(
                                            padding: isLandscape(context) ? const EdgeInsets.all(10.0) : null,
                                            child: Image.asset('assets/images/database.png'),
                                          ),
                                          Container(
                                            padding: isLandscape(context) ? const EdgeInsets.all(10.0) : null,
                                            child: Image.asset('assets/images/design.png'),
                                          ),
                                          SvgPicture.asset('assets/svg/git.svg'),
                                        ],
                                        items: const [
                                          TabModelIcons(
                                            title: 'Flutter',
                                            content: 'Framework cross-platform bem completo e versátil, confesso que no começo demorei um pouco para entender o core do framework, mas após ver o quão completo e versátil foi uma paixão na certa;',
                                          ),
                                          TabModelIcons(
                                            title: 'Dart',
                                            content: 'Linguagem fortemente tipada, sendo bem rigorosa em muitos aspéctos e muito completa; O fato de que permite que o código criado rode tanto no lado do cliente quanto no servidor, e sendo possivel com o mesmo código rodar em Desktop/Web/Mobile é um grande forte;',
                                          ),
                                          TabModelIcons(
                                            title: 'Firebase/Outros',
                                            content: 'Firebase e Outros como Supabase e afins, é um grande auxiliar do desenvolvimento web como mobile por sua facilidade e ferramentas que possui como databases e autenticação oAuth bem facilitados; ',
                                          ),
                                          TabModelIcons(
                                            title: 'Databases',
                                            content: 'Databases como MySql/Sqlite/MongoDB/GraphQL muito utilizadas em diversos processos de armazenagem de dados, sendo a SqLite a mais utilizada no cenário Mobile;',
                                          ),
                                          TabModelIcons(
                                            title: 'Design UX/UI',
                                            content: 'O que seria da aplicação ou website sem um bom design e uma interface de fácil acesso. A Satisfação do cliente e usuários ao resultado final muitas vezes é relacionada em como sua inteface interfere em sua usabilidade;',
                                          ),
                                          TabModelIcons(
                                            title: 'Versionamento',
                                            content: 'Ferramentas de versionamento como Git é muito importante em projetos mediante de varios desenvolvedores, onde garante total segurança da perca dos códigos e alterações feitas e também ajuda na final organização do mesmo;'
                                          ),
                                        ], 
                                      ),
                                      Container(
                                        width: isLandscape(context) ? ( w > 950 ? w * 0.35 : 0 ) : 0,
                                        constraints: const BoxConstraints(
                                          maxWidth: 250,
                                        ),
                                        child: Image.asset('assets/gifs/cat_sleep.gif'),
                                      ),  
                                    ],                            
                                  ),                                             
                                ],
                              ),
                            ),
                          ),
                          //Footer
                          Section(
                            backgroundColor: Theme.of(context).scaffoldBackgroundColor,                      
                            durationOpacity: const Duration(seconds: 1),
                            opacity: 1,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Text.rich(
                                TextSpan(                                
                                  style: TextStyle(color: Theme.of(context).secondaryHeaderColor, fontSize: 16),
                                  children: [
                                    const TextSpan(
                                      text: 'Desenvolvido com muito ❤ por ', style: TextStyle(fontSize: 18)
                                    ),
                                    TextSpan(
                                      text: 'Guilherme Martins', style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 18),
                                      recognizer: TapGestureRecognizer()..onTap = () => html.window.open('https://www.linkedin.com/in/guilherme-m-l-martins/', '_blank'),
                                    ),
                                  ]
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),                  
                        ],
                      ),
                    ),
                  ),
                ),              
            ),     
          )
        )
      );    
  }
}

