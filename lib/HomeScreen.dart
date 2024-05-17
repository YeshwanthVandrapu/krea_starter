import 'package:erp_starter/homeBody.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'menu2.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double sWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Row(
        children: <Widget>[
          sWidth > 600
              ? Container(
                  constraints: const BoxConstraints(maxWidth: 80),
                  child: const Menu2(),
                )
              : Container(),
          // DrawerPage(),
          const Expanded(
            flex: 5,
            child: HomeBody(),
          ),
        ],
      ),
    );
  }
}
