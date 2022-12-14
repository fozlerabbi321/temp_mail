import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/size_config.dart';
import '../../../utils/style.dart';

class InputFormWidget extends StatelessWidget {
  final String? hintText;
  final String? title;
  final TextEditingController? fieldController;
  final Function? onSaved;
  final Function? onConfirm;
  final Function? validation;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLines;
  final String? preText;
  final Color? fillColor;
  final double? elevation;
  final double borderWidth;
  final Color? shadowColor;
  final Color borderColor;
  final Color titleColor;
  final bool isProtected;
  final bool? isEditable;
  final bool centerText;
  final bool autoFocus;
  final FocusNode? focusNode;
  final TextInputType? keyType;
  final EdgeInsets? padding;
  final CrossAxisAlignment? crossAxisAlignment;
  final double? height;
  final double radius;
  final bool absorbing;

  const InputFormWidget({
    Key? key,
    this.preText,
    this.prefixIcon,
    this.isEditable,
    this.maxLines,
    this.shadowColor,
    this.elevation,
    this.padding,
    this.crossAxisAlignment,
    this.centerText = false,
    this.validation,
    this.focusNode,
    this.autoFocus = false,
    this.fillColor,
    this.isProtected = false,
    this.hintText,
    this.title,
    this.suffixIcon,
    this.fieldController,
    this.keyType,
    this.onSaved,
    this.onConfirm,
    this.height,
    this.borderColor = kPrimaryColor,
    this.titleColor = kStUnderLineColor,
    this.radius = 10,
    this.borderWidth = 2,
    this.absorbing = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(bottom: 10, top: 5,),
      child: Column(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        children: [
          if(title != null)
            Text(
              title ?? '',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: titleColor, height: 1.0,),
            ),
          if(title != null)
            kHeightBox5,
          Container(
            width: SizeConfig.screenWidth,
            height: maxLines == null ? getProportionateScreenHeight(45.0) : height,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              border: Border.all(width: borderWidth, color: borderColor),
              borderRadius: BorderRadius.circular(radius),
            ),
            child: AbsorbPointer(
              absorbing: absorbing,
              child: TextFormField(
                maxLines: maxLines ?? 1,
                enabled: isEditable,
                validator: validation as String? Function(String?)?,
                controller: fieldController,
                keyboardType: keyType,
                obscureText: isProtected,
                obscuringCharacter: '*',
                onChanged: onSaved as void Function(String)?,
                onFieldSubmitted: onConfirm as void Function(String?)?,
                focusNode: focusNode,
                textAlign:
                centerText == true ? TextAlign.center : TextAlign.start,
                autofocus: autoFocus,
                cursorColor: kStUnderLineColor,
                decoration: InputDecoration(
                  errorStyle: const TextStyle(fontSize: 11, height: 0.3),
                  focusedBorder:
                  const OutlineInputBorder(borderSide: BorderSide.none),
                  prefixText: preText,
                  prefixStyle: const TextStyle(
                    fontSize: 16,
                  ),
                  prefixIcon: prefixIcon,
                  suffixIcon: suffixIcon,
                  // labelStyle: kSmallText.copyWith(color: kOrdinaryColor),
                  // floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: hintText,
                  hintStyle: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: Theme.of(context).disabledColor, height: 1.0),
                  // filled: fillColor == null ? false : true,
                  // fillColor: fillColor ?? Colors.transparent,

                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 10),
                  // hintStyle: kDescriptionText.copyWith(color: kWhiteColor),
                  alignLabelWithHint: false,
                  border:
                  const OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}