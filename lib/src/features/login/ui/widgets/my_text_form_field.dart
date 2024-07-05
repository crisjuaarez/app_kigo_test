import 'package:flutter/material.dart';

import '../../../../core/constants/app_dimens.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.validator,
    this.prefixIcon,
    this.isPassword = false,
    this.maxLength = 30,
    this.controller,
    this.suffiexIcon,
    this.isEnabled = true,
    this.onTap,
    this.readOnly = false,
    this.canRequestFocus = true,
  });

  final String? hintText;
  final String? labelText;
  final FormFieldValidator<String>? validator;
  final Widget? prefixIcon;
  final bool isPassword;
  final int maxLength;
  final TextEditingController? controller;
  final Widget? suffiexIcon;
  final bool isEnabled;
  final void Function()? onTap;
  final bool readOnly;
  final bool canRequestFocus;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppDimens.defaultHorizontalPadding,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(
          AppDimens.defaultBorderRadiusValue,
        ),
      ),
      child: TextFormField(
        autofocus: false,
        canRequestFocus: canRequestFocus,
        onTap: onTap,
        readOnly: readOnly,
        enabled: isEnabled,
        controller: controller,
        validator: validator,
        obscureText: isPassword,
        maxLength: maxLength,
        textAlignVertical: TextAlignVertical.center,
        buildCounter: (
          context, {
          required currentLength,
          required isFocused,
          required maxLength,
        }) =>
            null,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          hintText: hintText,
          labelText: labelText,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          border: InputBorder.none,
          disabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          suffixIcon: suffiexIcon,
        ),
      ),
    );
  }
}
