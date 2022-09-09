import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function? onPress;
  final bool isChange;
  final double radius;
  final double border;
  final double iconSpace;
  final Color? borderColor;
  final EdgeInsets? padding;
  final Color textColor;
  final Color btnColor;
  final double? width;
  final double? height;
  final double? textSize;
  final String? imageURL;
  final MainAxisAlignment? mainAxisAlignment;

  const CustomButton({
    Key? key,
    required this.title,
    this.width,
    this.height = 36,
    this.iconSpace = 5,
    this.textColor = Colors.white,
    this.btnColor = kPrimaryColor,
    this.borderColor,
    this.border = 0,
    this.onPress,
    this.isChange = false,
    this.radius = 10,
    this.textSize = 14,
    this.imageURL,
    this.mainAxisAlignment,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: btnColor,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(width: border, color: borderColor == null ? Colors.transparent : borderColor!)
      ),
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPress as void Function()?,
        child: imageURL == null
            ? Text(
                title,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: textColor,
                    ),
              )
            : Row(
                mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15,
                    child: SvgPicture.asset(
                      imageURL!,
                      color: textColor,
                    ),
                  ),
                  SizedBox(width: iconSpace,),
                  if(mainAxisAlignment !=null)
                    Text(
                      title,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: textColor,
                        fontSize: textSize,
                      ),
                    ),
                  if(mainAxisAlignment ==null)
                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: textColor,
                            fontSize: textSize ?? 15,
                          ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
