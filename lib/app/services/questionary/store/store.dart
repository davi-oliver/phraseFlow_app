import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:phrase_flow/model/lesson.dart';
import 'package:phrase_flow/model/question.dart';
part 'store.g.dart';

class QuestionarioStore = _QuestionarioStoreBase with _$QuestionarioStore;

abstract class _QuestionarioStoreBase with Store {
  @observable
  ObservableList<ModelLesson> listAllLessons = ObservableList<ModelLesson>();

  @observable
  ObservableList<ModelQuestion> questions = ObservableList<ModelQuestion>();
  @observable
  PageController controllerPageView = PageController(initialPage: 0);

  @observable
  int selectedIndex = 0;

  @observable
  int indexLesson = 0;

  ObservableList<bool> visibilidadeResposta = ObservableList<bool>();

  @action
  void setIndexLesson(int value) => indexLesson = value;

  @action
  void setListAllLessons(value) =>
      listAllLessons.add(ModelLesson.fromJson(value));

  @action
  void setSelectedIndex(int value) => selectedIndex = value;

  @action
  void setControllerPageView(PageController valueController) =>
      controllerPageView = valueController;

  @action
  void animateControllerPageView() => controllerPageView.animateToPage(
        selectedIndex,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
  ObservableList<TextEditingController> controllers =
      ObservableList<TextEditingController>();

  @action
  void addQuestion(question) {
    controllers.add(TextEditingController());
    visibilidadeResposta.add(false);
    questions.add(ModelQuestion.fromJson(question));
  }

  @action
  void clearQuestion() {
    questions.clear();
  }

  @action
  void setVisibilidade(int index, value) {
    visibilidadeResposta[index] = value;
  }

  @action
  void addQuestionByModel(ModelQuestion question) {
    controllers.add(TextEditingController());
    questions.add(question);
  }

  @action
  void removeQuestion(ModelQuestion question) {
    questions.remove(question);
  }

  @action
  void clearQuestions() {
    questions.clear();
  }

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) {
    loading = value;
  }
}
