import 'package:flutter/material.dart';
import 'package:tm_mail/models/rp_domain_model.dart';
import 'package:tm_mail/utils/style.dart';

class DomainListView extends StatelessWidget {
  final List<DomainList> domainList;

  const DomainListView({
    Key? key,
    required this.domainList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: domainList.length,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, int index) {
        return InkWell(
          onTap: () {},
          child: Column(
            children: [
              kHeightBox10,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  color: Theme.of(context).cardColor,
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  elevation: 1.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.mail,
                          color: Theme.of(context).hintColor,
                        ),
                        kWidthBox10,
                        Expanded(
                            child: Text(
                          domainList[index].domain ?? '',
                          style: Theme.of(context).textTheme.subtitle1,
                        ))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
