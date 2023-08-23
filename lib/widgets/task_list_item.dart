import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../models/task.dart';

class TaskListItem extends StatelessWidget {
  const TaskListItem({
    super.key,
    required this.task,
    required this.onDelete,
  });

  final Task task;
  final Function(Task) onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Slidable(child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.grey[200],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
      ),
        actionExtentRatio: 0.20,
        actionPane: const  SlidableStrechActionPane(),
        actions: [
          IconSlideAction(
            color: Color(0xff00d7f3),
            icon: Icons.edit,
            caption: "Edit",
            onTap: () {},
          ),
        ],
        secondaryActions: [
          IconSlideAction(
            color: Colors.red,
            icon: Icons.delete,
            caption: "Delete",
            onTap: () {
              onDelete(task);
            },
          ),
        ],
      ),
    );
  }
}
