import 'package:arey_atm/model/taskModel.dart';

abstract class ReminderTaskState {}

class TaskInitial extends ReminderTaskState {}

class TaskLoading extends ReminderTaskState {}

class TaskLoaded extends ReminderTaskState {
  final List<TaskModel> tasks;
  TaskLoaded(this.tasks);
}

class TaskError extends ReminderTaskState {
  final String message;
  TaskError(this.message);
}
