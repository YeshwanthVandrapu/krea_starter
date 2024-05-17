import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'icons.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
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
    print(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    double sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hi {name}'),
            Text(
              'Welcome Back..',
              style: TextStyle(fontSize: 28),
              overflow: TextOverflow.ellipsis,
            ),
            // Icon(Icons.waving_hand),
          ],
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
                          // children: <Widget>[
                          //   CustomMaterialIcon(data['icons'] ?? ""),
                          //   // Icon(Icons.home),
                          //   Text(data['menu'] ?? ""),
                          // ],
                        );
                      }).toList(),
              ),
            )
          : null,
    );
  }
}
