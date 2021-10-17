import 'package:flutter/material.dart';

import 'widgets/tasks_table.dart';

class MyTasksPage extends StatelessWidget {
  const MyTasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: const [
              TasksTable(),
            ],
          ),
        ),
      ],
    );
  }
}
