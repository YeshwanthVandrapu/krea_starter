import 'dart:convert';
import 'package:erp_starter/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../icons.dart';
import 'modal.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  void initState() {
    super.initState();
    loadJsonAsset();
    setState(() {});
  }

  final List<RawMenuModal> rmenus = [];
  List<MenuModal> menus = [];

  Future<void> loadJsonAsset() async {
    final String jsonString =
        await rootBundle.loadString('res/json/jsonformmatter.json');
    var data = jsonDecode(jsonString);
    rmenus.clear();
    for (var e in data) {
      rmenus.add(RawMenuModal.fromJson(e));
    }
    menus.clear();
    menus.addAll(getMenu(0, rmenus));
    for (var m in menus) {
      dPrint(m.toJson());
    }
  }

  List<MenuModal> getMenu(int pid, List<RawMenuModal> rmenus) {
    List<MenuModal> menus = [];
    List<RawMenuModal> rmenuss = [];
    for (var rmenu in rmenus) {
      if (pid != rmenu.parentId) {
        rmenuss.add(rmenu);
      }
    }
    for (var rmenu in rmenus) {
      // rmenus.remove(rmenu);
      if (pid == rmenu.parentId) {
        menus.add(MenuModal(
            resourceIcon: rmenu.resourceIcon,
            resourceId: rmenu.resourceId,
            resourceName: rmenu.resourceName,
            children: getMenu(rmenu.resourceId, rmenuss)));
      }
    }

    return menus;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xff275C9D),
      child: ListView(
        children: menus.isEmpty
            ? [const CircularProgressIndicator()]
            : menus.map(
                (data) {
                  return InkWell(
                    onTap: () {
                      var a = !data.isSelected;
                      if (a) {
                        for (var d in menus) {
                          d.isSelected = false;
                        }
                      }
                      data.isSelected = !data.isSelected;
                      setState(() {});
                    },
                    child: Container(
                      color: data.isSelected ? Colors.white : null,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomMaterialIcon(
                            data.resourceIcon,
                            color: const Color(0xffBDE2EE),
                          ),
                          const SizedBox(
                            height: 8,
                          ), // Add some spacing between the icon and the text
                          Center(
                            child: Text(
                              data.resourceIcon,
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
