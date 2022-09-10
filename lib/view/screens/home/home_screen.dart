import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tm_mail/view/screens/home/components/domain_view.dart';
import 'package:tm_mail/view/screens/home/components/inbox_view.dart';
import 'package:tm_mail/view/screens/home/widgets/drawer.dart';

import '../../../controller/domain_controller.dart';
import 'components/test_view.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomeScreen extends StatefulWidget {
  final drawerItems = [
    DrawerItem("Domain ", Icons.domain_outlined),
    DrawerItem("Inbox", Icons.inbox_outlined),
    DrawerItem("Places", Icons.info),
    DrawerItem("Login", Icons.info)
  ];

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return  PageState();
  }
}

class PageState extends State<HomeScreen> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return  const DomainView();
      case 1:
        return  const InboxView();
      case 2:
        return  const TestView();
      case 3:
        return  Container();

      default:
        return  const Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }
  Future<void> _loadData(bool reload) async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Get.find<DomainController>().getDomainList('1', reload);
    });
  }

  @override
  Widget build(BuildContext context) {
    _loadData(false);

    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(ListTile(
        leading: Icon(d.icon),
        title: Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () {
          if(i == 3){
            log('sssssssssssss');
          }else{
            _onSelectItem(i);
          }
        },
      ));
    }

    return WillPopScope(
      onWillPop: () async{
        if (_selectedDrawerIndex != 0) {
          setState(() {
            _selectedDrawerIndex = 0;
          });
          _getDrawerItemWidget(_selectedDrawerIndex);
          return false;
        } else {
          Navigator.pop(context, true);
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.drawerItems[_selectedDrawerIndex].title),
        ),
        drawer: Drawer(
          child: DrawerView(drawerOptions: drawerOptions,),
        ),
        body: _getDrawerItemWidget(_selectedDrawerIndex),
      ),
    );
  }
}