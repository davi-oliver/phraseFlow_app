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
  String toString() {
    return '''
listLessonUser: ${listLessonUser},
selectIdioma: ${selectIdioma},
selectNivel: ${selectNivel}
    ''';
  }
}
