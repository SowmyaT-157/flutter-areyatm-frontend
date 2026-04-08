import 'package:arey_atm/block/task_block.dart';
import 'package:arey_atm/block/task_event.dart';
import 'package:arey_atm/block/task_state.dart';
import 'package:arey_atm/model/taskModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<AddTaskBloc>().add(FetchTasks());
  }

  void _showBottomSheet(TaskModel task) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Task",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),
            ListTile(
              title: const Text("Delete"),
              onTap: () async {
                try {
                  context.read<AddTaskBloc>().add(DeleteTaskEvent(task.id));
                  Navigator.pop(context);
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text("Task Deleted")));
                } catch (error) {
                  throw Exception("error occur in deleting: $error");
                }
              },
            ),
            ListTile(
              title: const Text("Cancel"),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: BlocBuilder<AddTaskBloc, ReminderTaskState>(
        builder: (context, state) {
          if (state is TaskLoading)
            return const Center(child: CircularProgressIndicator());
          if (state is TaskError) return Center(child: Text(state.message));
          if (state is TaskLoaded) {
            final tasks = state.tasks;
            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return GestureDetector(
                  onLongPress: () => _showBottomSheet(task),
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 8,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Task: ${task.task_name}'),
                          Text('Type: ${task.task_type}'),
                          Text('Time: ${task.time_details}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(child: Text("givin data"));
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go('/addReminder'),
        label: const Text("Add Reminder"),
        backgroundColor: const Color.fromRGBO(33, 236, 243, 1),
      ),
    );
  }
}
