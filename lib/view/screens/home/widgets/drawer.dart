import 'dart:developer';

import 'package:flutter/material.dart';

class DrawerView extends StatelessWidget {
  final  List<Widget> drawerOptions;
  const DrawerView({Key? key, required this.drawerOptions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountEmail: const Text("bramvbilsen@gmail.com"),
          accountName: const Text("Brambles"),
          currentAccountPicture: GestureDetector(
            child: const CircleAvatar(
              backgroundImage: NetworkImage('https://avatars3.githubusercontent.com/u/16825392?s=460&v=4'),
            ),
            onTap: () => log("This is your current account."),
          ),
        ),
        Column(children: drawerOptions)
      ],
    );
  }
}
