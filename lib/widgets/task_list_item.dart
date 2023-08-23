import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/task.dart';

class TaskListItem extends StatelessWidget {
  const TaskListItem({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.grey[200],
      ),
      margin: const EdgeInsets.symmetric(vertical: 2),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat("dd/MM/yyyy - EE - HH:mm").format(task.dateTime),
            style: TextStyle(
            fontSize: 12,
            ),
          ),
          Text(
            task.title,
            style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
