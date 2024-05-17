// import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'icons.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
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
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    // double sWidth = MediaQuery.of(context).size.width;
    // print(sWidth);
    return Material(
      // type: MaterialType.transparency,
      color: const Color(0xff275C9D),
      child: ListView(
        children: jsonData.isEmpty
            ? [const CircularProgressIndicator()]
            : jsonData.map((data) {
                return ListTile(
                  hoverColor: Colors.white,

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

        // children: [
        //   // Container(
        //   //   constraints: const BoxConstraints(maxWidth: 50),
        //   //   child: const Image(
        //   //     image: AssetImage('res/images/kreaWhite.png'),
        //   //   ),
        //   // ),
        //   Card(
        //     child: Row(
        //       children: <Widget>[
        //         Icon(Icons.home),
        //         Text('Home'),
        //       ],
        //     ),
        //   ),
        //   // TextButton(
        //   //   onPressed: loadJsonAsset,
        //   //   child: const Text('load Json Asset'),
        //   // ),
        // ],
      ),
    );
  }
}
