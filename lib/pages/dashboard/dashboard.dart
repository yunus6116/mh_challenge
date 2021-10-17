import 'package:flutter/material.dart';
import '../../constants/dummy_data.dart';
import '../../core/provider/user_list_provider.dart';
import '../../model/user_model.dart';
import '../../core/provider/theme_provider.dart';
import 'widgets/bar_charts.dart';
import 'widgets/top_states.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'widgets/overview_cards_lage.dart';
import 'widgets/revenue_section_large.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<String> _choices = [
    "Edit",
    "Delete",
  ];
  GlobalKey<FormState>? _formKey;
  TextEditingController? _controller;

  late final userProvider;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey();
    _controller = TextEditingController();

    userProvider = Provider.of<UserListModel>(context, listen: false);
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final themeProvider = Provider.of<ThemeProvider>(context, listen: true);
    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const OverviewCardsLargeScreen(),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: _height * 0.5,
                      width: _width * 0.5,
                      decoration: BoxDecoration(
                          color: themeProvider.isDarkMode
                              ? const Color(0xFF212936)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              color: themeProvider.isDarkMode
                                  ? const Color(0xFF212936)
                                  : Colors.grey[300]!)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 20.0,
                              bottom: 20,
                              top: 20,
                            ),
                            child: Text(
                              'Sales',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: _height * 0.4,
                            width: _width * 0.5,
                            child: SimpleLineChart.withSampleData(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 32, bottom: 20),
                      decoration: BoxDecoration(
                          color: themeProvider.isDarkMode
                              ? const Color(0xFF212936)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              color: themeProvider.isDarkMode
                                  ? const Color(0xFF212936)
                                  : Colors.grey[300]!)),
                      width: _width * 0.25,
                      height: _height * 0.41,
                      child: TableCalendar(
                        focusedDay: DateTime.now(),
                        firstDay: DateTime(1900),
                        lastDay: DateTime(2100),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: themeProvider.isDarkMode
                              ? const Color(0xFF212936)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              color: themeProvider.isDarkMode
                                  ? const Color(0xFF212936)
                                  : Colors.grey[300]!)),
                      height: _height * 0.3,
                      width: _width * 0.25,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              'Activity',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: _height * 0.25,
                            width: _width * 0.21,
                            child: CustomRoundedBars.withSampleData(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: _width * 0.27,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                      color: themeProvider.isDarkMode
                          ? const Color(0xFF212936)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                          color: themeProvider.isDarkMode
                              ? const Color(0xFF212936)
                              : Colors.grey[300]!)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          'New Members',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                          physics: const ScrollPhysics(),
                          child: Consumer<UserListModel>(
                            builder: (context, provider, litTile) {
                              return Column(
                                children: <Widget>[
                                  ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: userProvider.users.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 5.0),
                                          child: ListTile(
                                            leading: CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  userProvider
                                                      .users[index].assetName!),
                                              radius: 18,
                                            ),
                                            title: Text(userProvider
                                                .users[index].username!),
                                            subtitle: Text(userProvider
                                                .users[index].location!),
                                            trailing: PopupMenuButton<String>(
                                              icon: const Icon(
                                                Icons.more_vert,
                                              ),
                                              onSelected: (String choice) {
                                                if (choice == "Delete") {
                                                  userProvider
                                                      .deleteUser(index);
                                                } else {
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return SimpleDialog(
                                                          shape:
                                                              const RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                15,
                                                              ),
                                                            ),
                                                          ),
                                                          title: const Text(
                                                              'Change Username'),
                                                          children: [
                                                            Form(
                                                              key: _formKey,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                  horizontal:
                                                                      10,
                                                                ),
                                                                child:
                                                                    TextFormField(
                                                                  controller:
                                                                      _controller,
                                                                  onSaved:
                                                                      (val) {
                                                                    userProvider
                                                                        .changeUsername(
                                                                      index,
                                                                      _controller!
                                                                          .text
                                                                          .toString(),
                                                                    );
                                                                  },
                                                                  validator:
                                                                      (val) {
                                                                    if (val!
                                                                        .isNotEmpty) {
                                                                      return null;
                                                                    } else {
                                                                      return 'Add a text';
                                                                    }
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                            Row(
                                                              children: [
                                                                Container(
                                                                  margin: const EdgeInsets
                                                                      .symmetric(
                                                                    horizontal:
                                                                        20,
                                                                  ),
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child:
                                                                      TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child:
                                                                        const Text(
                                                                      'Cancel',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Color(
                                                                            0xFF00DECF),
                                                                        fontSize:
                                                                            17,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child:
                                                                        Container()),
                                                                Container(
                                                                  margin: const EdgeInsets
                                                                      .symmetric(
                                                                    horizontal:
                                                                        20,
                                                                  ),
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child:
                                                                      TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      if (_formKey!
                                                                          .currentState!
                                                                          .validate()) {
                                                                        _formKey!
                                                                            .currentState!
                                                                            .save();
                                                                      }
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child:
                                                                        const Text(
                                                                      'Ok',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Color(
                                                                            0xFF00DECF),
                                                                        fontSize:
                                                                            17,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        );
                                                      });
                                                }
                                              },
                                              itemBuilder:
                                                  (BuildContext context) {
                                                return _choices
                                                    .map((String choice) {
                                                  return PopupMenuItem<String>(
                                                    value: choice,
                                                    child: Text(choice),
                                                  );
                                                }).toList();
                                              },
                                            ),
                                          ),
                                        );
                                      })
                                ],
                              );
                            },
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 32,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: themeProvider.isDarkMode
                          ? const Color(0xFF212936)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                          color: themeProvider.isDarkMode
                              ? const Color(0xFF212936)
                              : Colors.grey[300]!)),
                  height: _height * 0.33,
                  width: _width * 0.48,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 20.0,
                          top: 20,
                        ),
                        child: Text(
                          'Top States',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 50,
                        ),
                        height: _height * 0.25,
                        width: _width * 0.47,
                        child: HorizontalPatternForwardHatchBarChart
                            .withSampleData(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
