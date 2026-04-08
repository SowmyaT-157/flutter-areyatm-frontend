import 'package:arey_atm/services/tasksServices.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddReminder extends StatefulWidget {
  const AddReminder({super.key});

  @override
  State<AddReminder> createState() => _AddReminderState();
}

class _AddReminderState extends State<AddReminder> {
  late TextEditingController taskNameController;

  bool _isRepeatable = false;
  bool _isLoading = false;
  String selectedValue = "everyday";

  DateTime? _selectedDateTime;

  @override
  void initState() {
    super.initState();
    taskNameController = TextEditingController();
  }

  Future<void> _selectDateTime() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (date == null) return;
    if (!mounted) return;
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time == null) return;
    setState(() {
      _selectedDateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(value: "everyday", child: Text("everday")),
      DropdownMenuItem(value: "monday", child: Text("monday")),
      DropdownMenuItem(value: "every 1 hour", child: Text("every 1 hour")),
      DropdownMenuItem(value: "every tuesday", child: Text("every tuesday")),
    ];
    return menuItems;
  }

  void submitData() async {
    if (!_isRepeatable && _selectedDateTime == null) {
      print("Please select a date");
      return;
    }
    setState(() => _isLoading = true);

    final data = {
      "task_name": taskNameController.text,
      "task_type": _isRepeatable ? "Repeatable" : "One-time",
      "time_details": _isRepeatable
          ? selectedValue
          : _selectedDateTime!.toIso8601String(),
    };

    try {
      await createReminder(data);
      if (mounted) context.go('/homePage');
    } catch (error) {
      print("Error: $error");
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Reminder Task")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: taskNameController,
                decoration: const InputDecoration(labelText: "Task Name"),
              ),
              const SizedBox(height: 10),
              CheckboxListTile(
                title: const Text("Repeatable Task"),
                value: _isRepeatable,
                onChanged: (e) => setState(() => _isRepeatable = e!),
              ),
              _isRepeatable
                  ? DropdownButton(
                      value: selectedValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                      items: dropdownItems,
                    )
                  : ListTile(
                      title: Text(
                        _selectedDateTime == null
                            ? "Date and Time"
                            : " ${_selectedDateTime.toString().split('.')[0]}",
                      ),
                      trailing: const Icon(Icons.calendar_today),
                      onTap: _selectDateTime,
                    ),

              ElevatedButton(
                onPressed: _isLoading ? null : submitData,
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text("confirm task"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
