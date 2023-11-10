import 'package:mobx/mobx.dart';
import 'package:phrase_flow/model/user_lesson.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  ObservableList<ModelUserLesson> listLessonUser =
      ObservableList<ModelUserLesson>();

  @observable
  var selectIdioma = "Selecione um idioma";

  @action
  void setSelectIdioma(value) => selectIdioma = value;

  @observable
  var selectNivel = "Selecione um nivel";

  @action
  void setSelectNivel(value) => selectNivel = value;

  @action
  void setListLessonUser(value) =>
      listLessonUser.add(ModelUserLesson.fromJson(value));

  @action
  void clearListLessonUser() => listLessonUser.clear();
}
