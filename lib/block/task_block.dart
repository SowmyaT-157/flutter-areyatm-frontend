import 'package:arey_atm/block/task_event.dart';
import 'package:arey_atm/block/task_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/tasksServices.dart';

class AddTaskBloc extends Bloc<ReminderTasksEvent, ReminderTaskState> {
  AddTaskBloc() : super(TaskInitial()) {
    on<FetchTasks>((event, emit) async {
      emit(TaskLoading());
      try {
        final tasks = await fetchTasks();
        emit(TaskLoaded(tasks));
      } catch (e) {
        emit(TaskError(e.toString()));
      }
    });

    on<AddTaskEvent>((event, emit) async {
      try {
        await createReminder(event.data);
        add(FetchTasks());
      } catch (e) {
        emit(TaskError(e.toString()));
      }
    });

    on<DeleteTaskEvent>((event, emit) async {
      try {
        await deleteTask(event.id);
        add(FetchTasks());
      } catch (e) {
        emit(TaskError(e.toString()));
      }
    });
  }
}
