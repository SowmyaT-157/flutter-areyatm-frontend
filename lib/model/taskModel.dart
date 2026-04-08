// ignore_for_file: non_constant_identifier_names

class TaskModel {
  final String _id;
  final String task_name;
  final String task_type;
  final String time_details;

  TaskModel({
    required this.task_name,
    required this.task_type,
    required this.time_details,
    required String id,
  }) : _id = id;

  String get id => _id;

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['_id']?.toString() ?? '',
      task_name: json['task_name'] ?? '',
      task_type: json['task_type'] ?? '',
      time_details: json['time_details'] ?? 'not seted',
    );
  }

  
}
