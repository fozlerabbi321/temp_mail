import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tm_mail/utils/colors.dart';
import 'package:tm_mail/view/screens/home/components/domain_view.dart';
import 'package:tm_mail/view/screens/home/components/inbox_view.dart';
import 'package:tm_mail/view/screens/home/widgets/drawer.dart';

import '../../../controller/auth_controller.dart';
import '../../../controller/domain_controller.dart';
import '../../../utils/size_config.dart';
import '../../../utils/style.dart';
import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/input_from_widget.dart';
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
    return PageState();
  }
}

class PageState extends State<HomeScreen> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return const DomainView();
      case 1:
        return const InboxView();
      case 2:
        return const TestView();
      case 3:
        return Container();

      default:
        return const Text("Error");
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
          if (i == 3) {
            log('sssssssssssss');
          } else {
            _onSelectItem(i);
          }
        },
      ));
    }

    return WillPopScope(
      onWillPop: () async {
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
          child: DrawerView(
            drawerOptions: drawerOptions,
          ),
        ),
        body: _getDrawerItemWidget(_selectedDrawerIndex),
        floatingActionButton: FloatingActionButton(
          elevation: 0.0,
          backgroundColor: kPrimaryColor,
          onPressed: () => showCreateDialog(context),
          tooltip: 'Create Account'.tr,
          child: const Icon(Icons.add, color: kWhiteColor,),
        ),
      ),
    );
  }
  //open a create account dialog
  showCreateDialog(BuildContext context,) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          insetPadding: const EdgeInsets.only(top: 120),
          alignment: Alignment.topCenter,
          backgroundColor: Theme.of(context).backgroundColor,
          //const Color(0xFF1E243C),,
          content: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              width: SizeConfig.screenWidth! - 20,
              child: GetBuilder<AuthController>(
                  builder: (authController) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics(),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  'Create Account'.tr,
                                  style: Theme.of(context).textTheme.headline6,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 20,),
                              InputFormWidget(
                                fieldController: authController.emailController,
                                hintText: 'Email'.tr,
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  size: 18,
                                  color:
                                  Get.isDarkMode ? kWhiteColor : kBlackColor2,
                                ),
                              ),
                              InputFormWidget(
                                fieldController: authController.passwordController,
                                hintText: 'Password'.tr,
                                isProtected: true,
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  size: 18,
                                  color:
                                  Get.isDarkMode ? kWhiteColor : kBlackColor2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      kHeightBox20,
                      Row(
                        children: [
                          CustomButton(
                            height: 45,
                            title: 'Cancel'.tr,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            btnColor: Theme.of(context).errorColor,
                            textColor: kWhiteColor,
                            onPress: () => Get.back(),
                          ),
                          kWidthBox10,
                          Expanded(
                            child: CustomButton(
                              height: 45,
                              title: 'Create Account'.tr,
                              textColor: Colors.white,
                              onPress: () async {
                                //Get.back();
                                authController.createAccount(context);
                              },
                            ),
                          ),
                        ],
                      ),
                      kHeightBox20,
                    ],
                  );
                }
              )

          ),
        );
      },
    );
  }
}
