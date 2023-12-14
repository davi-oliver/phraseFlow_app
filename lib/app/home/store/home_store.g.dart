// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStoreBase, Store {
  late final _$listLessonUserAtom =
      Atom(name: '_HomeStoreBase.listLessonUser', context: context);

  @override
  ObservableList<ModelUserLesson> get listLessonUser {
    _$listLessonUserAtom.reportRead();
    return super.listLessonUser;
  }

  @override
  set listLessonUser(ObservableList<ModelUserLesson> value) {
    _$listLessonUserAtom.reportWrite(value, super.listLessonUser, () {
      super.listLessonUser = value;
    });
  }

  late final _$listLessonUserCompletedAtom =
      Atom(name: '_HomeStoreBase.listLessonUserCompleted', context: context);

  @override
  ObservableList<ModelUserLesson> get listLessonUserCompleted {
    _$listLessonUserCompletedAtom.reportRead();
    return super.listLessonUserCompleted;
  }

  @override
  set listLessonUserCompleted(ObservableList<ModelUserLesson> value) {
    _$listLessonUserCompletedAtom
        .reportWrite(value, super.listLessonUserCompleted, () {
      super.listLessonUserCompleted = value;
    });
  }

  late final _$languagesAtom =
      Atom(name: '_HomeStoreBase.languages', context: context);

  @override
  List<Map<String, dynamic>> get languages {
    _$languagesAtom.reportRead();
    return super.languages;
  }

  @override
  set languages(List<Map<String, dynamic>> value) {
    _$languagesAtom.reportWrite(value, super.languages, () {
      super.languages = value;
    });
  }

  late final _$selectIdiomaAtom =
      Atom(name: '_HomeStoreBase.selectIdioma', context: context);

  @override
  String get selectIdioma {
    _$selectIdiomaAtom.reportRead();
    return super.selectIdioma;
  }

  @override
  set selectIdioma(String value) {
    _$selectIdiomaAtom.reportWrite(value, super.selectIdioma, () {
      super.selectIdioma = value;
    });
  }

  late final _$showLessonCompletedAtom =
      Atom(name: '_HomeStoreBase.showLessonCompleted', context: context);

  @override
  bool get showLessonCompleted {
    _$showLessonCompletedAtom.reportRead();
    return super.showLessonCompleted;
  }

  @override
  set showLessonCompleted(bool value) {
    _$showLessonCompletedAtom.reportWrite(value, super.showLessonCompleted, () {
      super.showLessonCompleted = value;
    });
  }

  late final _$selectNivelAtom =
      Atom(name: '_HomeStoreBase.selectNivel', context: context);

  @override
  String get selectNivel {
    _$selectNivelAtom.reportRead();
    return super.selectNivel;
  }

  @override
  set selectNivel(String value) {
    _$selectNivelAtom.reportWrite(value, super.selectNivel, () {
      super.selectNivel = value;
    });
  }

  late final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase', context: context);

  @override
  void setShowLessonCompleted(dynamic value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setShowLessonCompleted');
    try {
      return super.setShowLessonCompleted(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectIdioma(dynamic value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setSelectIdioma');
    try {
      return super.setSelectIdioma(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectNivel(dynamic value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setSelectNivel');
    try {
      return super.setSelectNivel(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListLessonUser(dynamic model) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setListLessonUser');
    try {
      return super.setListLessonUser(model);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearListLessonUser() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.clearListLessonUser');
    try {
      return super.clearListLessonUser();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListLessonUserCompleted(dynamic model) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setListLessonUserCompleted');
    try {
      return super.setListLessonUserCompleted(model);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearListLessonUserCompleted() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.clearListLessonUserCompleted');
    try {
      return super.clearListLessonUserCompleted();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listLessonUser: ${listLessonUser},
listLessonUserCompleted: ${listLessonUserCompleted},
languages: ${languages},
selectIdioma: ${selectIdioma},
showLessonCompleted: ${showLessonCompleted},
selectNivel: ${selectNivel}
    ''';
  }
}
