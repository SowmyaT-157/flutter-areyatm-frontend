import 'dart:convert';
import 'package:arey_atm/model/taskModel.dart';
import 'package:http/http.dart' as http;
export './tasksServices.dart';

Future<List<TaskModel>> fetchTasks() async {
  final response = await http.get(Uri.parse('http://localhost:3009/allTasks'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> fullResponse = json.decode(response.body);
    final List<dynamic> tasksList = fullResponse['getTheReminders'] ?? [];
    return tasksList.map((taskJson) => TaskModel.fromJson(taskJson)).toList();
  } else {
    throw Exception('failed to fetch the tasks');
  }
}


Future<void> deleteTask(String id) async {
  final response = await http.delete(
    Uri.parse('http://localhost:3009/reminder/$id'),
  );
  if (response.statusCode != 200) {
    throw Exception('failed to delete the task');
  }
}


  Future<void> createReminder(Map<String, dynamic> taskData) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:3009/newReminder'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(taskData),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('successfully sent response: ${response.body}');
    } else {
      print('failed to send data: ${response.statusCode}');
      throw Exception('failed to create task');
    }
  }



