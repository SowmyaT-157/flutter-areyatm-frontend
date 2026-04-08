export './task_event.dart';

abstract class ReminderTasksEvent {}

class FetchTasks extends ReminderTasksEvent {}

class AddTaskEvent extends ReminderTasksEvent {
  final Map<String, dynamic> data;
  AddTaskEvent(this.data);
}

class DeleteTaskEvent extends ReminderTasksEvent {
  final String id;
  DeleteTaskEvent(this.id);
}
