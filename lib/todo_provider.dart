import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TodoProvider extends ChangeNotifier {
  List<String> title = [];
  List<String> description = [];
  TextEditingController titleTEC = TextEditingController();
  TextEditingController descriptionTEC = TextEditingController();
  bool isEditingController = false;
  int editIndex = -1;
  bool? isCompleted = false;

  void addTask(String task, String descriptionTask, int index) {
    if (isEditingController) {
      title[index] = task;
      description[index] = descriptionTask;
      titleTEC.clear();
      descriptionTEC.clear();
      isEditingController = false;
      editIndex = -1;
      notifyListeners();
    } else {
      if (titleTEC.text.isNotEmpty || descriptionTEC.text.isNotEmpty) {
        title.add(task);
        description.add(descriptionTask);
      }
      titleTEC.clear();
      descriptionTEC.clear();
    }
    notifyListeners();
  }

  void removeTask(int index) {
    title.removeAt(index);
    description.removeAt(index);
    notifyListeners();
  }

  void editTask(int index) {
    titleTEC.text = title[index];
    descriptionTEC.text = description[index];
    editIndex = index;
    isEditingController = true;
    notifyListeners();
  }

  void isCompletedTask(bool? value) {
    isCompleted = value;
    notifyListeners();
  }
}
