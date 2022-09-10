import 'package:flutter/material.dart';
import '../../../utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function? onPress;
  final bool isChange;
  final double radius;
  final double border;
  final Color? borderColor;
  final EdgeInsets? padding;
  final Color textColor;
  final Color btnColor;
  final double? width;
  final double? height;
  final double? textSize;

  const CustomButton({
    Key? key,
    required this.title,
    this.width,
    this.height = 36,
    this.textColor = Colors.white,
    this.btnColor = kPrimaryColor,
    this.borderColor,
    this.border = 0,
    this.onPress,
    this.isChange = false,
    this.radius = 10,
    this.textSize = 14,
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
        child: Text(
                title,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: textColor,
                    ),
              ),
      ),
    );
  }
}
