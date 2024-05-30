import 'package:erp_starter/cardGrid.dart';
import 'package:erp_starter/homeWidgets/quick_links.dart';
import 'package:erp_starter/homeWidgets/welcome_widget.dart';
import 'package:erp_starter/home_schedule/view.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:responsive_ui/responsive_ui.dart';
import 'homeWidgets/calender_widget.dart';
import 'homeWidgets/task_widget.dart';
import 'icons.dart';
import 'utils.dart';

class NewHomeBody extends StatefulWidget {
  const NewHomeBody({super.key});

  @override
  State<NewHomeBody> createState() => _NewHomeBodyState();
}

class _NewHomeBodyState extends State<NewHomeBody> {
  @override
  void initState() {
    super.initState();
    loadJsonAsset();
  }

  final List<Map<String, dynamic>> jsonData = [];
  Future<void> loadJsonAsset() async {
    final String jsonString = await rootBundle.loadString('res/json/menu.json');
    var data = jsonDecode(jsonString);
    jsonData.clear();
    for (var e in data) {
      jsonData.add(e);
    }
    setState(() {});
    dPrint(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    double sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.white,
        title: RichText(
          text: const TextSpan(children: [
            TextSpan(
              text: "Dashboard  ",
              style: TextStyle(
                fontSize: 24,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            WidgetSpan(
              child: Icon(Icons.settings_suggest_outlined),
            ),
          ]),
        ),
        actions: sWidth < 400
            ? []
            : [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(width: 5),
                        Text(
                          'Search',
                          // style: TextStyle(color: Colors.black, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
      ),
      drawer: sWidth <= 600
          ? Drawer(
              backgroundColor: const Color(0xff275C9D),
              // clipBehavior: ,
              child: ListView(
                children: jsonData.isEmpty
                    ? [const CircularProgressIndicator()]
                    : jsonData.map((data) {
                        return ListTile(
                          //style:
                          title: Text(
                            data['menu'] ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: Color(0xffBDE2EE)),
                          ),
                          leading: CustomMaterialIcon(
                            data['icons'] ?? "",
                            color: const Color(0xffBDE2EE),
                          ),
                        );
                      }).toList(),
              ),
            )
          : null,
      body: SingleChildScrollView(
        child: Responsive(
          // crossAxisAlignment = WrapCrossAlignment.start,
          runSpacing: 50,
          children: <Widget>[
            Div(
              divison: const Division(
                colXL: 6,
                colL: 10,
                colXS: 10,
                offsetXL: 1,
                offsetL: 1,
                offsetM: 1,
                offsetS: 1,
                offsetXS: 1,
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 40, bottom: 40),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 189, 226, 238),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    constraints:
                        const BoxConstraints(maxHeight: 300, minHeight: 270),
                    child: const WelcomeCard(),
                  ),
                  // const Cardgrid(),
                  // Container(
                  //   margin: const EdgeInsets.only(top: 40, bottom: 40),
                  //   decoration: BoxDecoration(
                  //       color: const Color.fromARGB(255, 189, 226, 238),
                  //       borderRadius: BorderRadius.circular(8),
                  //       border: Border.all(width: 1, color: Colors.grey)),
                  //   constraints: const BoxConstraints(maxHeight: 300),
                  //   child: const TaskListCard(),
                  // ),
                ],
              ),
            ),
            Div(
              divison: const Division(
                colXL: 3,
                colL: 10,
                colXS: 10,
                offsetXL: 1,
                offsetL: 1,
                offsetM: 1,
                offsetS: 1,
                offsetXS: 1,
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 40, bottom: 40),
                    constraints:
                        const BoxConstraints(maxHeight: 300, maxWidth: 500),
                    child: const QuickLinks(),
                  ),
                  // Container(
                  //   margin: const EdgeInsets.only(top: 40, bottom: 40),
                  //   constraints:
                  //       const BoxConstraints(maxHeight: 500, maxWidth: 500),
                  //   child: const CalenderCard(),
                  // ),

                  Container(
                    // constraints: const BoxConstraints(maxHeight: 400),
                    child: const UpcomingSchedule(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
