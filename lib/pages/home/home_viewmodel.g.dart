// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModel, Store {
  late final _$homeIsActiveAtom =
      Atom(name: '_HomeViewModel.homeIsActive', context: context);

  @override
  bool get homeIsActive {
    _$homeIsActiveAtom.reportRead();
    return super.homeIsActive;
  }

  @override
  set homeIsActive(bool value) {
    _$homeIsActiveAtom.reportWrite(value, super.homeIsActive, () {
      super.homeIsActive = value;
    });
  }

  late final _$aboutIsActiveAtom =
      Atom(name: '_HomeViewModel.aboutIsActive', context: context);

  @override
  bool get aboutIsActive {
    _$aboutIsActiveAtom.reportRead();
    return super.aboutIsActive;
  }

  @override
  set aboutIsActive(bool value) {
    _$aboutIsActiveAtom.reportWrite(value, super.aboutIsActive, () {
      super.aboutIsActive = value;
    });
  }

  late final _$habilitiesIsActiveAtom =
      Atom(name: '_HomeViewModel.habilitiesIsActive', context: context);

  @override
  bool get habilitiesIsActive {
    _$habilitiesIsActiveAtom.reportRead();
    return super.habilitiesIsActive;
  }

  @override
  set habilitiesIsActive(bool value) {
    _$habilitiesIsActiveAtom.reportWrite(value, super.habilitiesIsActive, () {
      super.habilitiesIsActive = value;
    });
  }

  late final _$experienceIsActiveAtom =
      Atom(name: '_HomeViewModel.experienceIsActive', context: context);

  @override
  bool get experienceIsActive {
    _$experienceIsActiveAtom.reportRead();
    return super.experienceIsActive;
  }

  @override
  set experienceIsActive(bool value) {
    _$experienceIsActiveAtom.reportWrite(value, super.experienceIsActive, () {
      super.experienceIsActive = value;
    });
  }

  late final _$_HomeViewModelActionController =
      ActionController(name: '_HomeViewModel', context: context);

  @override
  void setHomeIsActive(bool _) {
    final _$actionInfo = _$_HomeViewModelActionController.startAction(
        name: '_HomeViewModel.setHomeIsActive');
    try {
      return super.setHomeIsActive(_);
    } finally {
      _$_HomeViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAboutIsActive(bool _) {
    final _$actionInfo = _$_HomeViewModelActionController.startAction(
        name: '_HomeViewModel.setAboutIsActive');
    try {
      return super.setAboutIsActive(_);
    } finally {
      _$_HomeViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHabilitiesIsActive(bool _) {
    final _$actionInfo = _$_HomeViewModelActionController.startAction(
        name: '_HomeViewModel.setHabilitiesIsActive');
    try {
      return super.setHabilitiesIsActive(_);
    } finally {
      _$_HomeViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExperienceIsActive(bool _) {
    final _$actionInfo = _$_HomeViewModelActionController.startAction(
        name: '_HomeViewModel.setExperienceIsActive');
    try {
      return super.setExperienceIsActive(_);
    } finally {
      _$_HomeViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
homeIsActive: ${homeIsActive},
aboutIsActive: ${aboutIsActive},
habilitiesIsActive: ${habilitiesIsActive},
experienceIsActive: ${experienceIsActive}
    ''';
  }
}
