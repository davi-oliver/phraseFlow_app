// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QuestionarioStore on _QuestionarioStoreBase, Store {
  late final _$listAllLessonsAtom =
      Atom(name: '_QuestionarioStoreBase.listAllLessons', context: context);

  @override
  ObservableList<ModelLesson> get listAllLessons {
    _$listAllLessonsAtom.reportRead();
    return super.listAllLessons;
  }

  @override
  set listAllLessons(ObservableList<ModelLesson> value) {
    _$listAllLessonsAtom.reportWrite(value, super.listAllLessons, () {
      super.listAllLessons = value;
    });
  }

  late final _$questionsAtom =
      Atom(name: '_QuestionarioStoreBase.questions', context: context);

  @override
  ObservableList<ModelQuestion> get questions {
    _$questionsAtom.reportRead();
    return super.questions;
  }

  @override
  set questions(ObservableList<ModelQuestion> value) {
    _$questionsAtom.reportWrite(value, super.questions, () {
      super.questions = value;
    });
  }

  late final _$controllerPageViewAtom =
      Atom(name: '_QuestionarioStoreBase.controllerPageView', context: context);

  @override
  PageController get controllerPageView {
    _$controllerPageViewAtom.reportRead();
    return super.controllerPageView;
  }

  @override
  set controllerPageView(PageController value) {
    _$controllerPageViewAtom.reportWrite(value, super.controllerPageView, () {
      super.controllerPageView = value;
    });
  }

  late final _$selectedIndexAtom =
      Atom(name: '_QuestionarioStoreBase.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$indexLessonAtom =
      Atom(name: '_QuestionarioStoreBase.indexLesson', context: context);

  @override
  int get indexLesson {
    _$indexLessonAtom.reportRead();
    return super.indexLesson;
  }

  @override
  set indexLesson(int value) {
    _$indexLessonAtom.reportWrite(value, super.indexLesson, () {
      super.indexLesson = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_QuestionarioStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$_QuestionarioStoreBaseActionController =
      ActionController(name: '_QuestionarioStoreBase', context: context);

  @override
  void setIndexLesson(int value) {
    final _$actionInfo = _$_QuestionarioStoreBaseActionController.startAction(
        name: '_QuestionarioStoreBase.setIndexLesson');
    try {
      return super.setIndexLesson(value);
    } finally {
      _$_QuestionarioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListAllLessons(dynamic value) {
    final _$actionInfo = _$_QuestionarioStoreBaseActionController.startAction(
        name: '_QuestionarioStoreBase.setListAllLessons');
    try {
      return super.setListAllLessons(value);
    } finally {
      _$_QuestionarioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedIndex(int value) {
    final _$actionInfo = _$_QuestionarioStoreBaseActionController.startAction(
        name: '_QuestionarioStoreBase.setSelectedIndex');
    try {
      return super.setSelectedIndex(value);
    } finally {
      _$_QuestionarioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setControllerPageView(PageController valueController) {
    final _$actionInfo = _$_QuestionarioStoreBaseActionController.startAction(
        name: '_QuestionarioStoreBase.setControllerPageView');
    try {
      return super.setControllerPageView(valueController);
    } finally {
      _$_QuestionarioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void animateControllerPageView() {
    final _$actionInfo = _$_QuestionarioStoreBaseActionController.startAction(
        name: '_QuestionarioStoreBase.animateControllerPageView');
    try {
      return super.animateControllerPageView();
    } finally {
      _$_QuestionarioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addQuestion(dynamic question) {
    final _$actionInfo = _$_QuestionarioStoreBaseActionController.startAction(
        name: '_QuestionarioStoreBase.addQuestion');
    try {
      return super.addQuestion(question);
    } finally {
      _$_QuestionarioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearQuestion() {
    final _$actionInfo = _$_QuestionarioStoreBaseActionController.startAction(
        name: '_QuestionarioStoreBase.clearQuestion');
    try {
      return super.clearQuestion();
    } finally {
      _$_QuestionarioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVisibilidade(int index, dynamic value) {
    final _$actionInfo = _$_QuestionarioStoreBaseActionController.startAction(
        name: '_QuestionarioStoreBase.setVisibilidade');
    try {
      return super.setVisibilidade(index, value);
    } finally {
      _$_QuestionarioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addQuestionByModel(ModelQuestion question) {
    final _$actionInfo = _$_QuestionarioStoreBaseActionController.startAction(
        name: '_QuestionarioStoreBase.addQuestionByModel');
    try {
      return super.addQuestionByModel(question);
    } finally {
      _$_QuestionarioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeQuestion(ModelQuestion question) {
    final _$actionInfo = _$_QuestionarioStoreBaseActionController.startAction(
        name: '_QuestionarioStoreBase.removeQuestion');
    try {
      return super.removeQuestion(question);
    } finally {
      _$_QuestionarioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearQuestions() {
    final _$actionInfo = _$_QuestionarioStoreBaseActionController.startAction(
        name: '_QuestionarioStoreBase.clearQuestions');
    try {
      return super.clearQuestions();
    } finally {
      _$_QuestionarioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_QuestionarioStoreBaseActionController.startAction(
        name: '_QuestionarioStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_QuestionarioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listAllLessons: ${listAllLessons},
questions: ${questions},
controllerPageView: ${controllerPageView},
selectedIndex: ${selectedIndex},
indexLesson: ${indexLesson},
loading: ${loading}
    ''';
  }
}
