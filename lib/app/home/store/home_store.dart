import 'package:mobx/mobx.dart';
import 'package:phrase_flow/model/user_lesson.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  ObservableList<ModelUserLesson> listLessonUser =
      ObservableList<ModelUserLesson>();
  @observable
  ObservableList<ModelUserLesson> listLessonUserCompleted =
      ObservableList<ModelUserLesson>();

  @observable
  List<Map<String, dynamic>> languages = [];

  @observable
  var selectIdioma = "Selecione uma lição";

  @observable
  bool showLessonCompleted = false;

  @action
  void setShowLessonCompleted(value) => showLessonCompleted = value;

  @action
  void setSelectIdioma(value) => selectIdioma = value;

  @observable
  var selectNivel = "Selecione um nivel";

  @action
  void setSelectNivel(value) => selectNivel = value;

  @action
  void setListLessonUser(model) =>
      listLessonUser.add(ModelUserLesson.fromJson(model));

  @action
  void clearListLessonUser() => listLessonUser.clear();

  @action
  void setListLessonUserCompleted(model) =>
      listLessonUserCompleted.add(ModelUserLesson.fromJson(model));

  @action
  void clearListLessonUserCompleted() => listLessonUserCompleted.clear();
}
