// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';

part 'home_viewmodel.g.dart';

class HomeViewModel = _HomeViewModel with _$HomeViewModel;

abstract class _HomeViewModel with Store {
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
}