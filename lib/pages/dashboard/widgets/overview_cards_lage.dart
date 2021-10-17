import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'info_card.dart';

class OverviewCardsLargeScreen extends StatelessWidget {
  const OverviewCardsLargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoCard(
            title: "Clients",
            value: "3 ",
            onTap: () {},
            icon: Icons.people,
          ),
          SizedBox(
            width: _width / 64,
          ),
          InfoCard(
            title: "Completed tasks",
            value: "32",
            onTap: () {},
            icon: Icons.task,
          ),
          SizedBox(
            width: _width / 64,
          ),
          InfoCard(
            title: "Notifications",
            value: "2",
            onTap: () {},
            icon: Icons.notifications,
          ),
          SizedBox(
            width: _width / 64,
          ),
          InfoCard(
            title: "Reports",
            value: "4",
            onTap: () {},
            icon: Icons.report,
          ),
        ],
      ),
    );
  }
}
