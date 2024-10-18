import 'package:flutter/material.dart';
import 'package:task_manager/core/widgets/app_text.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: AppCustomText(text: "TEST"),
      ),
    );
  }
}
