import 'package:mobx/mobx.dart';
import 'package:phrase_flow/model/user_lesson.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  ObservableList<ModelUserLesson> listLessonUser =
      ObservableList<ModelUserLesson>();

  @action
  void setListLessonUser(value) => listLessonUser.add(value);

  @action
  void clearListLessonUser() => listLessonUser.clear();
}
