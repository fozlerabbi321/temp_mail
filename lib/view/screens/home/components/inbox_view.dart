import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tm_mail/controller/auth_controller.dart';
import 'package:tm_mail/utils/style.dart';
import 'package:tm_mail/view/screens/auth/login_screen.dart';
import 'package:tm_mail/view/shared/widgets/custom_shimmer.dart';
import '../../../../controller/inbox_controller.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../shared/shared/custom_bottom_loader.dart';
import '../../../shared/shared/not_found.dart';
import '../../../shared/widgets/custom_button.dart';
import '../widgets/inbox_list_view.dart';

class InboxView extends StatelessWidget {
  const InboxView({Key? key}) : super(key: key);

  Future<void> _loadData(bool reload) async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Get.find<InboxController>().getMessageList('1', reload);
    });
  }

  @override
  Widget build(BuildContext context) {
    //load data
    _loadData(false);

    ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          !Get.find<InboxController>().isLoading) {
        int pageSize = Get.find<InboxController>().popularPageSize;
        if (Get.find<InboxController>().messageList.length < pageSize) {
          Get.find<InboxController>()
              .setOffset(Get.find<InboxController>().offset + 1);
          log('end page');
          Get.find<InboxController>().showBottomLoader();
          Get.find<InboxController>().getMessageList(
            Get.find<InboxController>().offset.toString(),
            false,
          );
        } else {
          Get.find<InboxController>().noDataAvailableUpdate();
        }
      }
    });
    return GetBuilder<AuthController>(builder: (authController) {
      return SizedBox(
        child: authController.isLoggedIn()
            ? GetBuilder<InboxController>(builder: (inboxController) {
                return SizedBox(
                  child: inboxController.isShimmerLoading
                      ? CustomShimmer.messageListShimmer()
                      : inboxController.messageList.isEmpty
                          ? const NotFound()
                          : RefreshIndicator(
                              color: kPrimaryColor,
                              backgroundColor: Theme.of(context).cardColor,
                              displacement: 0,
                              onRefresh: () async {
                                await _loadData(true);
                              },
                              child: Stack(
                                children: [
                                  SizedBox(
                                    height: SizeConfig.screenHeight,
                                    child: SingleChildScrollView(
                                      controller: scrollController,
                                      physics: const BouncingScrollPhysics(
                                        parent: AlwaysScrollableScrollPhysics(),
                                      ),
                                      child: InboxListView(
                                        messageList:
                                            inboxController.messageList,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: CustomBottomLoader(
                                        isLoading: inboxController.isLoading),
                                  ),
                                ],
                              ),
                            ),
                );
              })
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Please Login first'.tr,
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  kHeightBox40,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CustomButton(
                      height: 45,
                      width: SizeConfig.screenWidth,
                      title: 'Login'.tr,
                      textColor: Colors.white,
                      onPress: () {
                        Get.to(() => const LoginScreen());
                      },
                    ),
                  ),
                ],
              ),
      );
    });
  }
}
