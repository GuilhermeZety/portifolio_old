
// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:async';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portifolio/components/nav_bar.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import '../../components/ButtonOutlined.dart';
import '../../components/tab_bar_vertical.dart';
import '../../utils/toasts.dart';
import '../../utils/util.dart';
import 'home_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

ScrollController scrollController = ScrollController(initialScrollOffset: 0.0,keepScrollOffset: true);


class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  var controller = HomeViewModel();

  var myname = '           Guilherme Martins.';
  var boolColorMyNameFinaly = false;

  //animations first section
  late AnimationController firstSectionAnimationController;  
  bool firstSectionVisibility = false;
  bool firstSectionHasAnimated = false;
  Animation<double>? firstSectionAnimationL;
  Animation<double>? firstSectionAnimationR;
  Animation<double>? firstSectionAnimationRB;
  
  //arrow continue
  bool boolArrowContinue = true;
  Color colorArrowContinue = Colors.grey.shade300;

  //animations second section
  late AnimationController secondSectionAnimationController;
  bool secondSectionHasAnimated = false;
  bool secondSectionVisibility = false;
  bool boxMeColor = false;
  Animation<double>? secondSectionAnimationT;
  Animation<double>? secondSectionAnimationL;
  Animation<double>? secondSectionAnimationR;

  //animations third section
  late TabController thirdSectionTabController;
  late AnimationController thirdSectionAnimationController;
  bool thirdSectionHasAnimated = false;
  bool thirdSectionVisibility = false;
  Animation<double>? thirdSectionAnimationT;

  @override
  void initState() {
    super.initState();

    firstSectionAnimationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this
    )..addListener(() => setState(() {}));

    secondSectionAnimationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this
    )..addListener(() => setState(() {}));

    thirdSectionTabController = TabController(
      length: 2,
      vsync: this
    )..addListener(() => setState(() {}));

    Timer.run(() async => await onLoad());
  }

  onLoad() async {    
    scrollController.jumpTo(1300);

    Timer.periodic(const Duration(milliseconds: 350), (t) {
        setState(() {
          boolColorMyNameFinaly = !boolColorMyNameFinaly;
        });
    } );
    Timer.periodic(const Duration(milliseconds: 800), (t) {
        setState(() {
          boolArrowContinue = !boolArrowContinue;
        });
    } );
    Timer.periodic(const Duration(milliseconds: 2000), (t) {
        setState(() {
          boxMeColor = !boxMeColor;
        });
    } );

    await addAllAnimations();

    await Future.delayed(const Duration(milliseconds: 500));
    initFirstSectionAnimation();

    setState(() {
      firstSectionVisibility = true;
    });
  }

  addAllAnimations() async {
    firstSectionAnimationL = Tween(begin: -50.0, end: 0.0).animate(firstSectionAnimationController);
    firstSectionAnimationR = Tween(begin: 80.0, end: 40.0).animate(firstSectionAnimationController);
    firstSectionAnimationRB = Tween(begin: 40.0, end: 0.0).animate(firstSectionAnimationController);

    secondSectionAnimationT = Tween(begin: -10.0, end: 0.0).animate(secondSectionAnimationController);
    secondSectionAnimationL = Tween(begin: -5.0, end: 0.0).animate(secondSectionAnimationController);
    secondSectionAnimationR = Tween(begin: 5.0, end: 0.0).animate(secondSectionAnimationController);
    
    secondSectionAnimationT = Tween(begin: -10.0, end: 0.0).animate(secondSectionAnimationController);
    secondSectionAnimationL = Tween(begin: -5.0, end: 0.0).animate(secondSectionAnimationController);
    secondSectionAnimationR = Tween(begin: 5.0, end: 0.0).animate(secondSectionAnimationController);
  }

  initFirstSectionAnimation() async  {
    firstSectionAnimationL = Tween(begin: -50.0, end: 0.0).animate(firstSectionAnimationController);
    firstSectionAnimationR = Tween(begin: 80.0, end: 40.0).animate(firstSectionAnimationController);
    firstSectionAnimationRB = Tween(begin: 40.0, end: 0.0).animate(firstSectionAnimationController);

    setState(() {
      firstSectionHasAnimated = true;
    });
    
    await firstSectionAnimationController.forward();
  }

  initSecondSectionAnimation() async {
    secondSectionAnimationT = Tween(begin: -10.0, end: 0.0).animate(secondSectionAnimationController);
    secondSectionAnimationL = Tween(begin: -5.0, end: 0.0).animate(secondSectionAnimationController);
    secondSectionAnimationR = Tween(begin: 5.0, end: 0.0).animate(secondSectionAnimationController);

    await secondSectionAnimationController.forward();

    setState(() {
      secondSectionHasAnimated = true;
    });
  }

  copyEmail(){
    Clipboard.setData(const ClipboardData(text: "guilherme.zety@outlook.com"));

    showSuccessToast(message: 'E-mail copiado com sucesso', fToast: FToast().init(context));
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    
    return NotificationListener(
      onNotification: (t) {
        if (t is ScrollEndNotification) {
          if(scrollController.offset <= MediaQuery.of(context).size.height * 0.7){         
            controller.setHomeIsActive(true);
          }
          else{                
            controller.setHomeIsActive(false);   
          }

          if(scrollController.offset >= MediaQuery.of(context).size.height * 0.3){            
            setState(() {
              secondSectionVisibility = true;
            });

            if(!secondSectionHasAnimated){
              initSecondSectionAnimation();
            }
          }
          else{
            secondSectionAnimationController.reverse();
            setState(() {
              secondSectionHasAnimated = false;

              secondSectionVisibility = false;
              secondSectionAnimationT = null;
            });
          }

          if(scrollController.offset >= MediaQuery.of(context).size.height * 0.7 && scrollController.offset <= (MediaQuery.of(context).size.height * 0.7) + 550){  

            controller.setAboutIsActive(true);
          }
          else{                
            controller.setAboutIsActive(false);   
          }

          if(scrollController.offset >= (MediaQuery.of(context).size.height * 0.7) + 200){            
            setState(() {
              thirdSectionVisibility = true;
            });

            // if(!secondSectionHasAnimated){
            //   initSecondSectionAnimation();
            // }
          }
          else{
            // secondSectionAnimationController.reverse();
            setState(() {
              thirdSectionVisibility = false;

              // secondSectionHasAnimated = false;
              // secondSectionAnimationT = null;
            });
          }

          if(scrollController.offset >= (MediaQuery.of(context).size.height * 0.7) + 550 && scrollController.offset <= (MediaQuery.of(context).size.height * 0.7) + 1050){         
            controller.setProjectsIsActive(true);
          }
          else{                
            controller.setProjectsIsActive(false);   
          }
        }
        return false;
      },
      child: Title(
        color: Colors.white,
        title: 'Portifólio | Guilherme Martins',
        child: Scaffold(
        appBar: NavBar(height: 70, controller: scrollController, aboutIsActive: controller.aboutIsActive, habilitiesIsActive: controller.habilitiesIsActive, homeIsActive: controller.homeIsActive, projectsIsActive: controller.projectsIsActive),
        body: SafeArea(
          child: WebSmoothScroll(
            animationDuration: 100,
            controller: scrollController,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              controller: scrollController,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 4000,
                child: Column(
                  children:  [
                    //First section
                    Container(
                      height: MediaQuery.of(context).size.height * 0.75,
                      width: w * 0.95,
                      constraints: const BoxConstraints(
                        maxWidth: 1200
                      ),
                      child: AnimatedOpacity(
                        duration: const Duration(seconds: 1),
                        opacity: firstSectionVisibility ? 1 : 0,
                        child: Row(
                          mainAxisAlignment: isLandscape(context) ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Transform.translate(
                              offset: Offset(firstSectionAnimationL != null ? firstSectionAnimationL!.value : 0, 0),
                              child: SizedBox(
                                // color: Colors.amber,
                                width: 397,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: isLandscape(context) ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                                  children: [
                                    const SelectableText('Olá, eu sou o', style: TextStyle(fontSize: 32)),
                                    TweenAnimationBuilder<int>(
                                      tween: IntTween(begin: 0, end: myname.length), 
                                      duration: const Duration(seconds: 3), 
                                      builder: (BuildContext context, int value, child) {
                                        return Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SelectableText(myname.substring(0, value ).trim(), style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 40, letterSpacing: 3)),
                                            Text('|', style: TextStyle(color: boolColorMyNameFinaly ? Colors.white : Colors.transparent, fontSize: 32)),
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
                            ),
                            Transform.translate(
                              offset: Offset(firstSectionAnimationR != null ? firstSectionAnimationR!.value : 0, firstSectionAnimationRB != null ? firstSectionAnimationRB!.value : 0),
                              child: Container(
                                // color: Colors.red,
                                width: isLandscape(context) ? w > 740 ? MediaQuery.of(context).size.width * 0.40 : MediaQuery.of(context).size.width *0.35 : 0,
                                constraints: const BoxConstraints(
                                  maxWidth: 500,
                                  maxHeight: 400
                                ),
                                child: Image.asset('assets/gifs/spinning_cat.gif'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    //Arrow Continue
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MouseRegion(
                          onHover: (event) => setState(() {
                            colorArrowContinue = Theme.of(context).primaryColor;
                          }),
                          onExit: (event) => setState(() {
                            colorArrowContinue = Colors.grey.shade300;
                          }),
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => scrollController.animateTo(MediaQuery.of(context).size.height * 0.78 + 40, duration: const Duration(milliseconds: 500), curve: Curves.linearToEaseOut),
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                children:  [
                                  AnimatedOpacity(
                                    opacity: boolArrowContinue ? 0 : 1,
                                    duration: const Duration(milliseconds: 300),
                                    child: AnimatedContainer(
                                      height: 40,
                                      duration: const Duration(milliseconds: 1200),
                                      padding: EdgeInsets.only(top: boolArrowContinue ? 0 : 10, bottom: boolArrowContinue ? 10 : 0),
                                      child: Icon(FontAwesomeIcons.anglesDown, size: 14, color: colorArrowContinue)
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 1200),
                                    child: Text('continue', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: colorArrowContinue, letterSpacing: 3))
                                  ),
                                  const SizedBox(width: 5),
                                  AnimatedOpacity(
                                    opacity: boolArrowContinue ? 0 : 1,
                                    duration: const Duration(milliseconds: 300),
                                    child: AnimatedContainer(
                                      height: 40,
                                      duration: const Duration(milliseconds: 1200),
                                      padding: EdgeInsets.only(top: boolArrowContinue ? 0 : 10, bottom: boolArrowContinue ? 10 : 0),
                                      child: Icon(FontAwesomeIcons.anglesDown, size: 14, color: colorArrowContinue,)
                                    ),
                                  )
                                ],
                              )
                            ),
                          ),
                        )
                      ],
                    ),
                    //Second Section
                    Container(
                      width: w,                    
                      color: Theme.of(context).backgroundColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 500,
                            width: w * 0.95,
                            constraints: const BoxConstraints(
                              maxWidth: 1200
                            ),
                            child: AnimatedOpacity(
                              duration: const Duration(seconds: 1),
                              opacity: secondSectionVisibility ? 1 : 0,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: isLandscape(context) ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Transform.translate(
                                    offset: Offset(secondSectionAnimationL != null ? secondSectionAnimationL!.value : 0, secondSectionAnimationT != null ? secondSectionAnimationT!.value : 0),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 90),
                                      child: SizedBox(
                                        width: 400,
                                        height: 400,
                                        child: Stack(
                                          children: [
                                            AnimatedContainer(
                                              duration: const Duration(seconds: 2),
                                              width: 300,
                                              height: 300,
                                              decoration: BoxDecoration(
                                                color: boxMeColor ? Theme.of(context).primaryColor : const Color(0xFFD92AF5) , 
                                                borderRadius: BorderRadius.circular(5)
                                              ),
                                            ),
                                            AnimatedPositioned(
                                              duration: const Duration(milliseconds: 400),
                                              left: 6,
                                              top: 6,
                                              child: Container(
                                                width: 300,
                                                height: 300,
                                                decoration: BoxDecoration(
                                                  border: Border(top: BorderSide(color: Theme.of(context).backgroundColor, width: 6), left: BorderSide(color: Theme.of(context).backgroundColor, width: 6))
                                                ), 
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(5),
                                                  child: Image.asset('assets/me.jpg')
                                                )
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Transform.translate(
                                    offset: Offset(secondSectionAnimationR != null ? secondSectionAnimationR!.value : 0, secondSectionAnimationT != null ? secondSectionAnimationT!.value : 0),
                                    child: Container(
                                      width: (w * 0.95) - 500,       
                                      constraints: const BoxConstraints(
                                        maxWidth: 1200 - 500,
                                      ),                             
                                      padding: const EdgeInsets.symmetric(vertical: 90),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: const [
                                              SelectableText('SOBRE MIM', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                                              SizedBox(height: 6),
                                              SelectableText('Blumenau - SC', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                              SizedBox(height: 10),
                                              SelectableText('Um apaixonado em programação que* ' 
                                              'Possuo experiência em Desenvolvimento Web. Trabalhei com projetos envolvendo ECommerce,'  
                                              ' APIs e banco de dados. Atualmente estou focando nas tecnologias voltadas ao FrontEnd. '
                                              'Hoje já entendo tecnologias como ReactJS, Bootstrap, Mysql, etc.'),
                                            ],
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
                                                  onTap: () => copyEmail(), 
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
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Third Section
                    Container(
                      width: w * 0.95,
                      constraints: const BoxConstraints(
                        maxWidth: 1200
                      ),                  
                      child: AnimatedOpacity(
                        opacity: thirdSectionVisibility ? 1 : 0,
                        duration: const Duration(seconds: 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              // color: Colors.red,
                              width: 300,
                              child: Image.asset('assets/gifs/holding_cat.gif'),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 90),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 20),
                                    child: Text('EXPERIÊNCIA', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                                  ),
                                  TabBarVertical(
                                    width: (w * 0.95) - 300,
                                    constraints: const BoxConstraints(
                                      maxWidth: 1200 - 300
                                    ),
                                    tabWidth: 100 + (w * 0.05),
                                    height: 300,
                                    length: 2,
                                    tabs: const [
                                      'Flutter Developer',
                                      'Junior Full Stack'
                                    ],
                                    items: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: const [
                                              SelectableText('Desenvolvedor Flutter', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                                              SelectableText('Dez 2021 - Atual', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          SelectableText('Desenvolvimento Apps e Websites', style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor),),
                                          const SizedBox(height: 20),
                                          const SelectableText('Minha primeira oportunidade na área da tecnologia, sendo o projeto um aplicativo (porém feito em ReactJS) para empresas (localizadas em Orlando - FL) que fornecem locação de casas/apartamentos, sendo desenvolvido totalmente pensado na responsividade. Sou responsável pelo front-end da aplicação, assim como integração com o backend. Utiliza SCRUM como metodologia ágil, juntamente com Trello. Projeto encaminhando para a fase final de desenvolvimento.'),

                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: const [
                                              SelectableText('Junior Full Stack', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                                              SelectableText('Mar 2021 - Dez 2021', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          SelectableText('Desenvolvimento Apps e Websites', style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor),),
                                          const SizedBox(height: 20),
                                          const SelectableText('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),

                                        ],
                                      ),
                                    ], 
                                  ),
                                ],
                              ),
                            )
                          ]
                        ),
                      )
                    )
                  ],
                ),
              ),
            ),
          ),
        ),     
        ),
      ),
    );
  }
}