import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../../core/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import '../../../components/custom_text.dart';
import '../../../constants/style.dart';

/// Example without datasource
class TasksTable extends StatelessWidget {
  const TasksTable({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: true);
    return Container(
      decoration: BoxDecoration(
        color:
            themeProvider.isDarkMode ? const Color(0xFF212936) : Colors.white,
        border: Border.all(color: active.withOpacity(.4), width: .5),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: DataTable2(
        columnSpacing: 12,
        horizontalMargin: 12,
        minWidth: 600,
        columns: const [
          DataColumn2(
            label: Text("Name"),
            size: ColumnSize.L,
          ),
          DataColumn(
            label: Text('Location'),
          ),
          DataColumn(
            label: Text('Rating'),
          ),
          DataColumn(
            label: Text('Action'),
          ),
        ],
        rows: List<DataRow>.generate(
          7,
          (index) => DataRow(
            cells: [
              DataCell(CustomText(
                text: "Yunus Kara",
                color: Theme.of(context).textTheme.bodyText1!.color,
              )),
              DataCell(CustomText(
                text: "Monday Hero",
                color: Theme.of(context).textTheme.bodyText1!.color,
              )),
              DataCell(Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.deepOrange,
                    size: 18,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  CustomText(
                    text: "4.$index",
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  )
                ],
              )),
              DataCell(Container(
                  decoration: BoxDecoration(
                    color: light,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: active, width: .5),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: CustomText(
                    text: "TODO",
                    color: active.withOpacity(.7),
                    fontWeight: FontWeight.bold,
                  ))),
            ],
          ),
        ),
      ),
    );
  }
}
