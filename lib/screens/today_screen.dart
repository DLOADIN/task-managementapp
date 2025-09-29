import 'package:flutter/material.dart';

import '../models/task.dart';
import '../services/storage_service.dart';
import '../widgets/task_card.dart';
import '../widgets/task_form.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  final StorageService _storage = StorageService();
  List<Task> _tasks = <Task>[];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final List<Task> all = await _storage.loadTasks();
    setState(() => _tasks = all);
  }

  void _openAddTask() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext ctx) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom,
          ),
          child: TaskForm(
            onSubmit:
                ({
                  required String title,
                  String? description,
                  required DateTime dueDate,
                  TimeOfDay? reminderTime,
                }) async {
                  final Task task = Task(
                    id: DateTime.now().microsecondsSinceEpoch.toString(),
                    title: title,
                    description: description,
                    dueDate: dueDate,
                    reminderTime: reminderTime,
                    createdAt: DateTime.now(),
                  );
                  await _storage.addTask(task);
                  await _load();
                },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final List<Task> todays = _tasks
        .where(
          (Task t) =>
              t.dueDate.year == now.year &&
              t.dueDate.month == now.month &&
              t.dueDate.day == now.day,
        )
        .toList();
    return Scaffold(
      appBar: AppBar(title: const Text("Today's Tasks")),
      body: todays.isEmpty
          ? const Center(child: Text('No tasks for today'))
          : ListView.builder(
              itemCount: todays.length,
              itemBuilder: (BuildContext context, int index) {
                final Task task = todays[index];
                return TaskCard(
                  task: task,
                  onToggleComplete: () async {
                    await _storage.updateTask(
                      task.copyWith(isCompleted: !task.isCompleted),
                    );
                    await _load();
                  },
                  onDelete: () async {
                    await _storage.deleteTask(task.id);
                    await _load();
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
