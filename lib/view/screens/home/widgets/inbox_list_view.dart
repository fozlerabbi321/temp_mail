import 'package:flutter/material.dart';
import '../../../../models/rp_message_model.dart';
import 'inbox_card.dart';

class InboxListView extends StatelessWidget {
  final List<MessageList> messageList;

  const InboxListView({
    Key? key,
    required this.messageList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: messageList.length,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, int index) {
        return InkWell(
          onTap: () {},
          child: InboxCard(
            message: messageList[index],
          ),
        );
      },
    );
  }
}
