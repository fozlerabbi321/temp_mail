import 'package:flutter/material.dart';
import 'package:tm_mail/utils/colors.dart';
import 'package:tm_mail/utils/size_config.dart';
import '../../../../models/rp_message_model.dart';
import '../../../../utils/style.dart';
import '../../../shared/widgets/custom_button.dart';

class InboxCard extends StatelessWidget {
  final MessageList message;

  const InboxCard({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kHeightBox10,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            color: Theme
                .of(context)
                .cardColor,
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            elevation: 1.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Theme(
                data: ThemeData().copyWith(
                  dividerColor: Colors.transparent,
                ),
                child: ExpansionTile(
                  trailing: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 25,
                  ),
                  collapsedTextColor:
                  Theme
                      .of(context)
                      .textTheme
                      .subtitle1!
                      .color,
                  iconColor: Theme
                      .of(context)
                      .hintColor,
                  collapsedIconColor: Theme
                      .of(context)
                      .hintColor,
                  tilePadding: EdgeInsets.zero,
                  childrenPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  title: Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: kPrimaryColor,
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              (message.from?.name ?? '')
                                  .substring(0,
                                  (message.from?.name ?? '').length -
                                      ((message.from?.name ?? '').length - 2))
                                  .toUpperCase(),
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline3
                                  ?.copyWith(
                                color: kWhiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      kWidthBox10,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              message.from?.name ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            kHeightBox5,
                            Text(
                              message.intro ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyText1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CustomButton(
                        title: message.subject ?? '',
                        width: SizeConfig.screenWidth,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        btnColor: Theme
                            .of(context)
                            .hintColor,
                        radius: 5,
                        // textColor: Theme.of(context).textTheme.subtitle1!.color!,
                      ),
                    ),
                    kHeightBox15,
                    Text(
                      'From ${message.from?.address ?? ''}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme
                          .of(context)
                          .textTheme
                          .subtitle1,
                    ),
                    kHeightBox5,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'To ',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for(var to in message.to!)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                to.address ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    kHeightBox15,
                    Text(
                      message.intro ?? '',
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyText1,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
