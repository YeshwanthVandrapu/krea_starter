// import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'icons.dart';
import 'menu2_modal.dart';

class Menu2 extends StatefulWidget {
  const Menu2({super.key});

  @override
  State<Menu2> createState() => _Menu2State();
}

class _Menu2State extends State<Menu2> {
  @override
  void initState() {
    super.initState();
    loadJsonAsset();
  }

  bool taped = false;
  void colorChange() {
    print("tapped");
    taped = !taped;
    setState(() {});
  }

  final List<MenuModal> jsonData = [];

  Future<void> loadJsonAsset() async {
    final String jsonString = await rootBundle.loadString('res/json/menu.json');
    var data = jsonDecode(jsonString);
    jsonData.clear();
    for (var e in data) {
      jsonData.add(MenuModal.fromJson(e));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xff275C9D),
      child: ListView(
        children: jsonData.isEmpty
            ? [const CircularProgressIndicator()]
            : jsonData.map(
                (data) {
                  return InkWell(
                    hoverColor: Colors.white,
                    onTap: ,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomMaterialIcon(
                            data.icons,
                            color: const Color(0xffBDE2EE),
                          ),
                          const SizedBox(
                            height: 8,
                          ), // Add some spacing between the icon and the text
                          Center(
                            child: Text(
                              data.menu,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Color(0xffBDE2EE),
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ).toList(),
      ),
    );
  }
}
