// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';

import '../../utils/toasts.dart';

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

    @observable
    bool boxMeColor = false;
    @action 
    void setBoxMeColor(bool _) => boxMeColor = _;

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
    @observable
    String myname = '           Guilherme Martins.';
    
    @observable
    bool boolColorMyNameFinaly = false;
    @action 
    void setBoolColorMyNameFinaly(bool _) => boolColorMyNameFinaly = _;
  ///
  
  
  ///INFORMATIONS ARROW CONTINUE  
    @observable
    bool boolArrowContinue = true;
    @action 
    void setBoolArrowContinue(bool _) => boolArrowContinue = _;

    @observable
    Color colorArrowContinue = Colors.grey.shade300;
    @action 
    void setColorArrowContinue(Color _) => colorArrowContinue = _;
  ///

  onLoad() async {
    ///Periodics
      Timer.periodic(const Duration(milliseconds: 350), (t) {
          setBoolColorMyNameFinaly(!boolColorMyNameFinaly);
      });

      Timer.periodic(const Duration(milliseconds: 800), (t) {
          setBoolArrowContinue(!boolArrowContinue);
      });

      Timer.periodic(const Duration(milliseconds: 2000), (t) {
          setBoxMeColor(!boxMeColor);
      });
    ///

    await addAllAnimations();

    await Future.delayed(const Duration(milliseconds: 500));

    setFirstSectionVisibility(true);

    initFirstSectionAnimation();
  }

  addAllAnimations() async {
    setFirstSectionAnimationL(Tween(begin: -50.0, end: 0.0).animate(firstSectionAnimationController));
    setFirstSectionAnimationR(Tween(begin: 80.0, end: 40.0).animate(firstSectionAnimationController));
    setFirstSectionAnimationRB(Tween(begin: 40.0, end: 0.0).animate(firstSectionAnimationController));

    setSecondSectionAnimationB(Tween(begin: 10.0, end: 0.0).animate(secondSectionAnimationController));
    setSecondSectionAnimationL(Tween(begin: -5.0, end: 0.0).animate(secondSectionAnimationController));
    setSecondSectionAnimationR(Tween(begin: 5.0, end: 0.0).animate(secondSectionAnimationController));

    setFourthSectionAnimationB(Tween(begin: 10.0, end: 0.0).animate(fourthSectionAnimationController));
  }

  initFirstSectionAnimation() async  {
    setFirstSectionAnimationL(Tween(begin: -50.0, end: 0.0).animate(firstSectionAnimationController));
    setFirstSectionAnimationR(Tween(begin: 80.0, end: 40.0).animate(firstSectionAnimationController));
    setFirstSectionAnimationRB(Tween(begin: 40.0, end: 0.0).animate(firstSectionAnimationController));

    await firstSectionAnimationController.forward();
  }

  initSecondSectionAnimation() async {
    setSecondSectionAnimationB(Tween(begin: 10.0, end: 0.0).animate(secondSectionAnimationController));
    setSecondSectionAnimationL(Tween(begin: -5.0, end: 0.0).animate(secondSectionAnimationController));
    setSecondSectionAnimationR(Tween(begin: 5.0, end: 0.0).animate(secondSectionAnimationController));

    await secondSectionAnimationController.forward();
  }

  
  initFouthSectionAnimation() async {
    setFourthSectionAnimationB(Tween(begin: 10.0, end: 0.0).animate(fourthSectionAnimationController));

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
        if(o >= (h * 0.7) + 1800){       
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


  copyEmail(context){
    Clipboard.setData(const ClipboardData(text: "guilherme.zety@outlook.com"));

    showSuccessToast(message: 'E-mail copiado com sucesso', fToast: FToast().init(context));
  }
}