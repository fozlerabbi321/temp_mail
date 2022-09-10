import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/domain_controller.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../shared/shared/custom_bottom_loader.dart';
import '../../../shared/shared/custom_loader.dart';
import '../widgets/domain_list_view.dart';

class DomainView extends StatelessWidget {
  const DomainView({Key? key}) : super(key: key);

  Future<void> _loadData(bool reload) async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Get.find<DomainController>().getDomainList('1', reload);
    });
  }

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          !Get.find<DomainController>().isLoading) {
        int pageSize = Get.find<DomainController>().popularPageSize;
        if (Get.find<DomainController>().domainList.length < pageSize) {
          Get.find<DomainController>()
              .setOffset(Get.find<DomainController>().offset + 1);
          log('end page');
          Get.find<DomainController>().showBottomLoader();
          Get.find<DomainController>().getDomainList(
            Get.find<DomainController>().offset.toString(),
            false,
          );
        } else {
          Get.find<DomainController>().noDataAvailableUpdate();
        }
      }
    });

    return GetBuilder<DomainController>(builder: (domainController) {
      return SizedBox(
        child: domainController.isShimmerLoading
            ? const Center(child: CustomLoader())
            : domainController.domainList.isEmpty
                ? Center(
                    child: Text(
                      'no data available'.tr,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  )
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
                            child: DomainListView(
                              domainList: domainController.domainList,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: CustomBottomLoader(
                              isLoading: domainController.isLoading),
                        ),
                      ],
                    ),
                  ),
      );
    });
  }
}
