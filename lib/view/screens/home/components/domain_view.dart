import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tm_mail/main.dart';
import 'package:tm_mail/utils/constants.dart';
import '../../../../controller/domain_controller.dart';
import '../../../../utils/colors.dart';
import '../../../shared/widgets/custom_shimmer.dart';
import '../widgets/domain_list_view.dart';

class DomainView extends StatelessWidget {
  const DomainView({Key? key}) : super(key: key);

  Future<void> _loadData(bool reload) async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Get.find<DomainController>().getDomainList(reload);
    });
  }

  @override
  Widget build(BuildContext context) {
    //load data
    if(prefs.containsKey(Constants.domainExists)){
      _loadData(false);
    }else{
      _loadData(true);
    }


    return GetBuilder<DomainController>(builder: (domainController) {
      return SizedBox(
        child: domainController.isShimmerLoading
            ? CustomShimmer.domainListShimmer()
            : domainController.localDomainList.isEmpty
                ? const SizedBox()
                : RefreshIndicator(
                    color: kPrimaryColor,
                    backgroundColor: Theme.of(context).cardColor,
                    displacement: 0,
                    onRefresh: () async {
                      await _loadData(true);
                    },
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      child: DomainListView(
                        domainList: domainController.localDomainList,
                      ),
                    ),
                  ),
      );
    });
  }
}
