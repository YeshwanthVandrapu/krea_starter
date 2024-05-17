// import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'icons.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
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
    return Material(
      child: Drawer(
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
                    ),
                    leading: CustomMaterialIcon(data['icons'] ?? ""),
                  );
                }).toList(),
        ),
      ),
    );
  }
}
