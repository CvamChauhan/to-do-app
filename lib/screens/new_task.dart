class NewTask {
  String note;
  bool isDone;
  NewTask({required this.note, this.isDone = false});
  void toggleDone() {
    isDone = !isDone;
  }
}
