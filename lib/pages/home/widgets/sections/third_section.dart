import 'package:flutter/material.dart';
import 'package:portifolio/pages/home/widgets/sections/section.dart';

import 'package:portifolio/components/tab_bar.dart';
import 'package:portifolio/utils/util.dart';
import 'package:portifolio/pages/home/home_viewmodel.dart';
import 'package:portifolio/pages/home/widgets/project_widget.dart';

class ThirdSection extends StatefulWidget {
  const ThirdSection({super.key, required this.controller});

  final HomeViewModel controller;

  @override
  State<ThirdSection> createState() => _ThirdSectionState();
}

class _ThirdSectionState extends State<ThirdSection> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Section(
      durationOpacity: const Duration(seconds: 1),
      opacity: widget.controller.thirdSectionVisibility ? 1 : 0,
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
                padding: isLandscape(context) ? const EdgeInsets.symmetric(vertical: 90) : const EdgeInsets.symmetric(vertical: 30),
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
                        'Flutter - Pleno',
                        'Flutter Developer',
                        'Junior Full Stack'
                      ],
                      items: const [
                        TabModel(
                          title: 'Sempre aberto a novas experiências e desafios',
                          date: '😺',
                          enterprise: '',
                          highlightedText: 'Quem sabe na sua empresa? 👀',
                          content: 'Estou disponível para bater um papo, você pode entrar em contato via e-mail guilherme.zety@outlook.com ✨',
                          keywords: 'Never Stop to Learning🚀',
                        ),
                        TabModel(
                          title: 'Desenvolvedor Flutter - Pleno',
                          date: 'Nov 2022 - Atual',
                          enterprise: 'W2o Softwares e Aplicativos',
                          highlightedText: 'Desenvolvimento Apps',
                          content: 'Gerenciando e comandando equipe de desenvolvimento, implementando padrões de projeto, e novas rotinas de trabalho. '
                          'juntos, desenvolvemos e aprimoramos tanto as novas quanto as antigas aplicações, usando padrões como Clean Architecture, Solid, TDD, entre outros...'
                          ,
                          keywords: 'Flutter, Dart, GetIt, Bloc, Sqlite, Firebase, Agile, Clean Architecture, TDD, SOLID, Git, CI/CD, Scrum, Kanban, Flutter Web',
                          
                        ),
                        TabModel(
                          title: 'Desenvolvedor Flutter',
                          date: 'Dez 2021 - Nov 2022',
                          enterprise: 'Rz Sistemas',
                          highlightedText: 'Desenvolvimento Apps e Websites',
                          content: 'Como um novo desafio, acabei migrando para o flutter para o desenvolvimento de um app de vendas linkado ao "Virtual Market", '
                          'a aplicação foi totalmente desenvolvida com o modelo Offline-First sendo possivel fazer compras de qualquer lugar do planeta sem acesso à internet.'
                          'logo após participei da criação de websites utilizando o flutter;',
                          keywords: 'Flutter, Dart, Provider, Mobx, Sqlite',
                        ),
                        TabModel(
                          title: 'Junior Full Stack',
                          date: 'Mar 2021 - Dez 2021',
                          enterprise: 'Rz Sistemas',
                          highlightedText: 'Desenvolvimento Websites',
                          content: 'Minha primeira oportunidade na área de programação, trabalhando ' 
                          ' na manutenção e finalização de um "Software para força de vendas com e-commerce B2B/B2C" chamado "Virtual Market". '
                          'Utilizando linguagens/frameworks como C# com o .Net no backend e no front Vue.Js, Javascript, Bootstrap, Css, entre outros; '
                          'Fui o principal responsável pela repaginação e re-design do website como um todo.',
                          keywords: 'HTML, CSS, VUE.js, JavaScript, JQuery, Bootstrap, Razor, C#, ASP.NET;',
                        ),
                      ], 
                    ),
                  ],
                ),
              )
            ]
          ),
          //Projects
          isLandscape(context) ? 
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
                    width: w > 800 ? w * 0.1 + 300 : 300,
                    title: 'Portifólio Pessoal',
                    content: 'Totalmente desenvolvido em flutter, usei como apresentacao e também como estudo para novos projetos, atualmente não está atualizado com meus padroes de código, mas logo irei atualizar.',
                    languages: 'Flutter & Dart',
                    imageAsset: 'assets/images/Portifolio.png',
                    linkGithub: 'https://github.com/GuilhermeZety/Portifolio',
                    linkWeb: 'https://guilhermezety.github.io/'      
                  ),
                  ProjectWidget(
                    width: w > 800 ? w * 0.1 + 300 : 300,
                    title: 'Star Wars App',
                    content: 'Projeto simples porém bem completinho sendo totalmente offline apartir do primeiro acesso, com troca de linguagem e tema :); O app consome uma api REST ja existente com todas as informações dos personagens do Star Wars :) sendo filmes, informações, naves e outros; ',
                    languages: 'Flutter & Dart',
                    imageAsset: 'assets/images/StarWarsApp.png',
                    linkGithub: 'https://github.com/GuilhermeZety/star_wars_app',
                    linkWeb: 'https://drive.google.com/file/d/19KLGe-jHW_CuJqx6monjxOd-YPPlzHWl/view?usp=sharing',
                    message: 'Download APK',
                  ),
                  
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:   [
                  ProjectWidget(
                    width: w > 800 ? w * 0.1 + 300 :  300,
                    title: 'RpGaming (Em Desenvolvimento)',
                    content: 'Projetinho em desenvolvimento, será um app/site para a gestão completa de um rpg de mesa, sendo desde as partes das fichas até a parte emocionante das batalhas :).',
                    languages: 'Flutter & Dart',
                    imageAsset: 'assets/images/RpGaming.png',
                    linkGithub: 'https://github.com/GuilhermeZety/RpGaming',
                  ),
                  ProjectWidget(
                    width: w > 800 ? w * 0.1 + 300 : 300,
                    title: 'Em Breve',
                    content: 'Estou sempre estudando, consequentemente milhares de projetos vem em mente, tenho uma vasta lista aqui, porém não vale a pena entrar em muitos detalhes por aqui :)',
                    languages: 'Flutter & Dart',
                    imageAsset: 'assets/images/EmBreve.png',
                    linkGithub: 'https://github.com/GuilhermeZety',
                  ),
                ],
              )
            ]
          )
          :
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [                            
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: SelectableText('PROJETOS', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
              ),
              ProjectWidget(
                width: w * 0.95,
                height: 560 + w * 0.15,
                title: 'Portifólio Pessoal',
                content: 'Totalmente desenvolvido em flutter, usei como apresentacao e também como estudo para novos projetos, atualmente não está atualizado com meus padroes de código, mas logo irei atualizar.',
                languages: 'Flutter & Dart',
                imageAsset: 'assets/images/Portifolio.png',
                linkGithub: 'https://github.com/GuilhermeZety/Portifolio',
                linkWeb: 'https://guilhermezety.github.io/'                
              ),
              ProjectWidget(
                width: w * 0.95,
                height: 600 + w * 0.15 ,
                title: 'Star Wars App',
                content: 'Projeto simples porém bem completinho sendo totalmente offline apartir do primeiro acesso, com troca de linguagem e tema :); O app consome uma api REST ja existente com todas as informações dos personagens do Star Wars :) sendo filmes, informações, naves e outros; ',
                languages: 'Flutter & Dart',
                imageAsset: 'assets/images/StarWarsApp.png',
                linkGithub: 'https://github.com/GuilhermeZety/star_wars_app',
                linkWeb: 'https://drive.google.com/file/d/19KLGe-jHW_CuJqx6monjxOd-YPPlzHWl/view?usp=sharing',
                message: 'Download APK',
              ),            
              ProjectWidget(
                width: w * 0.95,
                height: 520 + w * 0.15,
                title: 'RpGaming (Em Desenvolvimento)',
                content: 'Projetinho em desenvolvimento, será um app/site para a gestão completa de um rpg de mesa, sendo desde as partes das fichas até a parte emocionante das batalhas :).',
                languages: 'Flutter & Dart',
                imageAsset: 'assets/images/RpGaming.png',
                linkGithub: 'https://github.com/GuilhermeZety/RpGaming',
              ),
              ProjectWidget(
                width: w * 0.95,
                height: 520 + w * 0.15,
                title: 'Em Breve',
                content: 'Estou sempre estudando, consequentemente milhares de projetos vem em mente, tenho uma vasta lista aqui, porém não vale a pena entrar em muitos detalhes por aqui :)',
                languages: 'Flutter & Dart',
                imageAsset: 'assets/images/EmBreve.png',
                linkGithub: 'https://github.com/GuilhermeZety',
              )
            ]
          )
        ],
      )
    );
  }
}