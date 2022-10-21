
// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:async';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portifolio/components/tab_bar_icons.dart';
import 'package:portifolio/components/tab_bar.dart';
import 'package:portifolio/pages/home/widgets/sections/FirstSection.dart';
import 'package:portifolio/pages/home/widgets/sections/SecondSection.dart';
import 'package:portifolio/pages/home/widgets/sections/section.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import '../../components/navbar/nav_bar.dart';
import '../../utils/util.dart';
import 'home_viewmodel.dart';
import 'widgets/project_widget.dart';

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
                          Section(
                            durationOpacity: const Duration(seconds: 1),
                            opacity: controller.thirdSectionVisibility ? 1 : 0,
                            child: Column(
                              children: [
                                //Experience
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: isLandscape(context) ? ( w > 950 ?  300  : 0 ) : 0,
                                      child: Image.asset('assets/gifs/holding_cat.gif'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 90),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SelectionArea(
                                            child: Padding(
                                              padding: EdgeInsets.only(bottom: 20),
                                              child: Text('EXPERIÊNCIA', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                                            ),
                                          ),
                                          TabBarText(
                                            width: isLandscape(context) ? w > 950 ? (w * 0.95) - 300 :  (w * 0.95) : (w * 0.95),
                                            constraints: const BoxConstraints(
                                              maxWidth: 1200 - 300
                                            ),
                                            tabWidth: 100 + (w * 0.05),
                                            height: 300,
                                            tabs: const [
                                              '👀👀',
                                              'Flutter Developer',
                                              'Junior Full Stack'
                                            ],
                                            items: const [
                                              TabModel(
                                                title: 'Sempre aberto a novas experiências e desafios',
                                                date: '😺',
                                                highlightedText: 'Quem sabe na sua empresa? 👀',
                                                content: 'Estou disponível para bater um papo, você pode entrar em contato via e-mail guilherme.zety@outlook.com ✨',
                                              ),
                                              TabModel(
                                                title: 'Desenvolvedor Flutter',
                                                date: 'Dez 2021 - Atual',
                                                highlightedText: 'Desenvolvimento Apps e Websites',
                                                content: 'Minha primeira oportunidade na área da tecnologia, sendo o projeto um aplicativo (porém feito em ReactJS) para empresas (localizadas em Orlando - FL) que fornecem locação de casas/apartamentos, sendo desenvolvido totalmente pensado na responsividade. Sou responsável pelo front-end da aplicação, assim como integração com o backend. Utiliza SCRUM como metodologia ágil, juntamente com Trello. Projeto encaminhando para a fase final de desenvolvimento.',
                                              ),
                                              TabModel(
                                                title: 'Junior Full Stack',
                                                date: 'Mar 2021 - Dez 2021',
                                                highlightedText: 'Desenvolvimento Apps e Websites',
                                                content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                              ),
                                            ], 
                                          ),
                                        ],
                                      ),
                                    )
                                  ]
                                ),
                                //Projects
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [                            
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: SelectableText('PROJETOS', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children:  [
                                        ProjectWidget(
                                          width: isLandscape(context) ? w > 800 ? w * 0.1 + 300 : 300 : 0,
                                          title: 'Portifólio Pessoal',
                                          content: 'Projeto desenvolvido a partir do curso de JavaScript ES6+ completo da Origamid, para por em prática meus estudos iniciais de JS.',
                                          languages: 'Flutter & Dart',
                                          imageAsset: 'assets/images/Portifolio.png',
                                        ),
                                        ProjectWidget(
                                          width: isLandscape(context) ? w > 800 ? w * 0.1 + 300 :  300 : 0,
                                          title: 'RpGaming (Em Desenvolvimento)',
                                          content: 'Projeto desenvolvido a partir do curso de JavaScript ES6+ completo da Origamid, para por em prática meus estudos iniciais de JS.',
                                          languages: 'Flutter & Dart',
                                          imageAsset: 'assets/images/RpGaming.png',
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children:   [
                                        ProjectWidget(
                                          width: isLandscape(context) ? w > 800 ? w * 0.1 + 300 : 300 : 0,
                                          title: 'App Gestão Financeira (Em Breve)',
                                          content: 'Projeto futuro, um app simples, para no meu caso, gerir as contas e emprestimos de dinheiro em minha familia :), tanto quanto fazer pagamentos e ver saldos e afins ',
                                          languages: 'Flutter & Dart',
                                          imageAsset: 'assets/images/EmBreve.png',
                                        ),
                                        ProjectWidget(
                                          width: isLandscape(context) ? w > 800 ? w * 0.1 + 300 : 300 : 0,
                                          title: 'Em Breve',
                                          content: 'Estou sempre estudando, consequentemente milhares de projetos vem em mente, tenho uma vasta lista aqui, porém não vale a pena entrar em muitos detalhes por aqui :)',
                                          languages: 'Flutter & Dart',
                                          imageAsset: 'assets/images/EmBreve.png',
                                        ),
                                      ],
                                    )
                                  ]
                                )
                              ],
                            )
                          ),                    
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
                                        width: isLandscape(context) ? ( w > 950 ?  (w * 0.95) - 250 : (w * 0.95) ) : 0 ,
                                        constraints: const BoxConstraints(
                                          maxWidth: 1200 - 300
                                        ),
                                        tabWidth: 200 + (w * 0.05),
                                        height: 300,
                                        tabs: [
                                          SvgPicture.asset('assets/svg/flutter.svg'),
                                          SvgPicture.asset('assets/svg/dart.svg'),
                                          SvgPicture.asset('assets/svg/firebase.svg'),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Image.asset('assets/images/database.png'),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Image.asset('assets/images/design.png'),
                                          ),
                                          SvgPicture.asset('assets/svg/git.svg'),
                                        ],
                                        items: const [
                                          TabModelIcons(
                                            title: 'Flutter',
                                            content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                          ),
                                          TabModelIcons(
                                            title: 'Dart',
                                            content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                          ),
                                          TabModelIcons(
                                            title: 'Firebase/Outros',
                                            content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                          ),
                                          TabModelIcons(
                                            title: 'Databases',
                                            content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                          ),
                                          TabModelIcons(
                                            title: 'Design UX/UI',
                                            content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                          ),
                                          TabModelIcons(
                                            title: 'Versionamento',
                                            content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
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
                            height: 50,
                            backgroundColor: Theme.of(context).scaffoldBackgroundColor,                      
                            durationOpacity: const Duration(seconds: 1),
                            opacity: 1,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text('Desenvolvido com muito ❤ por ', style: TextStyle(fontSize: 18)),
                                    InkWell(
                                      onTap: () => html.window.open('https://www.linkedin.com/in/guilherme-m-l-martins/', '_blank'),
                                      child: Text('Guilherme Martins', style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 18))
                                    ),
                                  ],
                                )
                              ],
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

