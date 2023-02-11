// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';

import 'package:portifolio/utils/toasts.dart';

part 'home_viewmodel.g.dart';

class HomeViewModel = _HomeViewModel with _$HomeViewModel;

abstract class _HomeViewModel with Store {
  ///SCROLL CONTROLLER
    @observable
    ScrollController scrollController = ScrollController(initialScrollOffset: 0.0,keepScrollOffset: true);
  ///


  ///INFORMAÇÔES NAVBAR
  ///Bools para informar qual seção está ativa
    @observable
    bool homeIsActive = true;
    @action 
    void setHomeIsActive(bool _) => homeIsActive = _;

    @observable
    bool aboutIsActive = false;
    @action 
    void setAboutIsActive(bool _) => aboutIsActive = _;

    @observable
    bool habilitiesIsActive = false;
    @action 
    void setHabilitiesIsActive(bool _) => habilitiesIsActive = _;

    @observable
    bool experienceIsActive = false;
    @action 
    void setExperienceIsActive(bool _) => experienceIsActive = _;
  ///
  

  ///FIRST SECTION
    @observable
    late AnimationController firstSectionAnimationController;
    @action 
    void setFirstSectionAnimationController(AnimationController _) => firstSectionAnimationController = _;

    @observable
    bool firstSectionVisibility = false;
    @action 
    void setFirstSectionVisibility(bool _) => firstSectionVisibility = _;

    @observable
    Animation<double>? firstSectionAnimationL;
    @action 
    void setFirstSectionAnimationL(Animation<double> _) => firstSectionAnimationL = _;
    
    @observable
    Animation<double>? firstSectionAnimationR;
    @action 
    void setFirstSectionAnimationR(Animation<double> _) => firstSectionAnimationR = _;

    @observable
    Animation<double>? firstSectionAnimationRB;
    @action 
    void setFirstSectionAnimationRB(Animation<double> _) => firstSectionAnimationRB = _;
  ///
  
  
  ///SECOND SECTION  
    @observable
    late AnimationController secondSectionAnimationController;
    @action 
    void setSecondSectionAnimationController(AnimationController _) => secondSectionAnimationController = _;
    
    @observable
    bool secondSectionVisibility = false;
    @action 
    void setSecondSectionVisibility(bool _) => secondSectionVisibility = _;

    bool boxMeColor = false;

    @observable
    Animation<double>? secondSectionAnimationB;
    @action 
    void setSecondSectionAnimationB(Animation<double> _) => secondSectionAnimationB = _;

    @observable
    Animation<double>? secondSectionAnimationL;
    @action 
    void setSecondSectionAnimationL(Animation<double> _) => secondSectionAnimationL = _;

    @observable
    Animation<double>? secondSectionAnimationR;
    @action 
    void setSecondSectionAnimationR(Animation<double> _) => secondSectionAnimationR = _;
  ///


  ///THIRD SECTION  
    @observable
    bool thirdSectionVisibility = false;
    @action 
    void setThirdSectionVisibility(bool _) => thirdSectionVisibility = _;
  ///
  

  ///FOURTH SECTION
    @observable
    bool fourthSectionVisibility = false;
    @action 
    void setFourthSectionVisibility(bool _) => fourthSectionVisibility = _;

    @observable
    late AnimationController fourthSectionAnimationController;
    @action 
    void setFourthSectionAnimationController(AnimationController _) => fourthSectionAnimationController = _;

    @observable
    Animation<double>? fourthSectionAnimationB;
    @action 
    void setFourthSectionAnimationB(Animation<double> _) => fourthSectionAnimationB = _;
  ///


  ///INFORMAÇÕES ANIMAÇÃO NOME
    String myname = '           Guilherme Martins.';
    
    bool boolColorMyNameFinaly = false;
  ///
  
  

  ///INFORMATIONS ARROW CONTINUE  
    bool boolArrowContinue = true;

    Color colorArrowContinue = Colors.grey.shade300;
  ///

  Future<void> onLoad(setS) async {    
    await addAllAnimations(setS);

    await Future.delayed(const Duration(milliseconds: 500));

    setFirstSectionVisibility(true);

    initFirstSectionAnimation();
  }

  Future<void> addAllAnimations(setS) async {
    setFirstSectionAnimationL(Tween(begin: -50.0, end: 0.0).animate(firstSectionAnimationController)..addListener(setS));
    setFirstSectionAnimationR(Tween(begin: 80.0, end: 40.0).animate(firstSectionAnimationController)..addListener(setS));
    setFirstSectionAnimationRB(Tween(begin: 40.0, end: 0.0).animate(firstSectionAnimationController)..addListener(setS));

    setSecondSectionAnimationB(Tween(begin: 10.0, end: 0.0).animate(secondSectionAnimationController)..addListener(setS));
    setSecondSectionAnimationL(Tween(begin: -5.0, end: 0.0).animate(secondSectionAnimationController)..addListener(setS));
    setSecondSectionAnimationR(Tween(begin: 5.0, end: 0.0).animate(secondSectionAnimationController)..addListener(setS));

    setFourthSectionAnimationB(Tween(begin: 10.0, end: 0.0).animate(fourthSectionAnimationController)..addListener(setS));
  }

  Future<void> initFirstSectionAnimation() async  {
    await firstSectionAnimationController.forward();
  }

  Future<void> initSecondSectionAnimation() async {
    await secondSectionAnimationController.forward();
  }
  
  Future<void> initFouthSectionAnimation() async {
    await fourthSectionAnimationController.forward();
  }

  bool notificationListenerUptations(context, t){
    if (t is ScrollEndNotification) {
      ///Pega o tamanho da tela
      var h = MediaQuery.of(context).size.height;
      ///Pega o local atual do scroll
      var o = scrollController.offset;
      
      ///Setando home in navbar
        if(o <= h * 0.7){         
          setHomeIsActive(true);
        }
        else{                
          setHomeIsActive(false);   
        }
      ///

      ///SETANDO SECOND SECTION
        if(o >= h * 0.3){
          setSecondSectionVisibility(true);
          initSecondSectionAnimation();
        }
        else{
          secondSectionAnimationController.reverse();
          setSecondSectionVisibility(false);
        }

        if(o >= (h * 0.7) && o <= (h * 0.7) + 550){  
          setAboutIsActive(true);
        }
        else{                
          setAboutIsActive(false);   
        }
      ///
        

      ///SETANDO SECOND SECTION
        if(o >= (h * 0.7) + 200){      
          setThirdSectionVisibility(true);
        }
        else if(o >= h * 0.3 && (h / 400) > 2){
          setThirdSectionVisibility(true);
        }
        else{
          setThirdSectionVisibility(false);
        }

        if(o >= (h * 0.7) + 550 && o <= (h * 0.7) + 2000){         
          setExperienceIsActive(true);
        }
        else{                
          setExperienceIsActive(false);   
        }
      ///

      ///SETANDO FOURTH SECTION
        if(o >= (h * 0.7) + 2000){       
          initFouthSectionAnimation();  
          setFourthSectionVisibility(true);
        }
        else{            
          fourthSectionAnimationController.reverse();
          setHabilitiesIsActive(false);
        }

        if(o >= (h * 0.7) + 2000){
          setHabilitiesIsActive(true);
        }
        else{            
          setFourthSectionVisibility(false);  
        }
      ///
    }
    return false;
  }


  void copyEmail(context){
    Clipboard.setData(const ClipboardData(text: 'guilherme.zety@outlook.com'));

    showSuccessToast(message: 'E-mail copiado com sucesso', fToast: FToast().init(context));
  }
}