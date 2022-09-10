import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/colors.dart';
import '../../../utils/style.dart';

class CustomAlertDialog {

  customAlert({
    String? title,
    String? body,
    String confirmTitle = 'Confirm',
    String cancelTitle = 'Cancel',
    Color? color,
    BuildContext? context,
    Function? onPress,
  }) {
    return showDialog(
      context: context!,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding:
                  const EdgeInsets.only(left: 10.0, top: 10, right: 10),
                  child: Center(
                    child: Text(
                      title ?? '',
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                        color: Get.isDarkMode ? kWhiteColor : kBlackColor,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
                child: Text(
                  body ?? '',
                  textAlign: TextAlign.left,
                ),
              ),
              Row(
                children: [
                  kWidthBox10,
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: kBgColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Text(
                          cancelTitle,
                          style:
                          Theme.of(context).textTheme.headline2!.copyWith(
                            color: kBlackColor,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  kWidthBox10,
                  Expanded(
                    child: InkWell(
                      onTap: onPress as void Function(),
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: const BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Text(
                          confirmTitle,
                          style:
                          Theme.of(context).textTheme.headline2!.copyWith(
                            color: kWhiteColor,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  kWidthBox10,
                ],
              ),
              kHeightBox5,
            ],
          ),
        );
      },
    );
  }
}