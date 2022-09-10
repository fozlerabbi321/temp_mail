import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../utils/style.dart';

class CustomShimmer {

  static domainListShimmer({itemCount = 15}) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: itemCount,
      padding: const EdgeInsets.all(5),
      itemBuilder: (context, int index) {
        return Column(
          children: [
            kHeightBox10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  kWidthBox10,
                  Expanded(child:  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  static messageListShimmer({itemCount = 15}) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: itemCount,
      padding: const EdgeInsets.all(5),
      itemBuilder: (context, int index) {
        return Column(
          children: [
            kHeightBox10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  kWidthBox10,
                  Expanded(child:  Column(
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: 12,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      kHeightBox10,
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      kHeightBox5,
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
