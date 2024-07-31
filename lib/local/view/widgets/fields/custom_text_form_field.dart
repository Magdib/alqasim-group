import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proj/local/core/constant/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.icon,
      this.label,
      this.hint,
      this.obscure = false,
      this.textEditingController,
      this.validator,
      this.inputType,
      this.suffixIcon,
      this.onChange,
      this.onTap,
      this.focusNode,
      this.numberOfLines,
      this.isEnable = true,
      this.onFieldSubmitted,
      this.isReadOnly = false,
      this.isField = false,
      this.onLeadingTap,
      this.radius,
      this.contentPadding,
      this.focusedColor,
      this.textColor,
      this.textInputAction,
      this.textAlign});
  final Widget? icon;
  final String? label;
  final String? hint;
  final bool obscure;
  final TextInputType? inputType;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final void Function(String)? onChange;
  final int? numberOfLines;
  final void Function()? onTap;
  final void Function()? onLeadingTap;
  final FocusNode? focusNode;
  final bool isEnable;
  final void Function(String)? onFieldSubmitted;
  final bool isReadOnly;
  final bool isField;
  final double? radius;
  final EdgeInsetsGeometry? contentPadding;
  final Color? focusedColor;
  final Color? textColor;
  final TextInputAction? textInputAction;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onChanged: onChange,
      controller: textEditingController,
      textInputAction: textInputAction,
      validator: validator,
      style: Theme.of(context).textTheme.displayMedium!.copyWith(
          color: textColor ?? AppColors.primaryColor,
          fontWeight: FontWeight.bold),
      textAlign: textAlign ?? TextAlign.start,
      obscureText: obscure,
      enabled: isEnable,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
      readOnly: isReadOnly,
      maxLines: numberOfLines ?? 1,
      cursorColor: AppColors.deepGrey,
      keyboardType: inputType,
      decoration: InputDecoration(
          fillColor: AppColors.white,
          enabled: isEnable,
          filled: isField,
          suffixIcon: suffixIcon,
          prefixIcon: icon,
          prefixIconColor: WidgetStateColor.resolveWith((states) =>
              states.contains(WidgetState.focused)
                  ? AppColors.primaryColor
                  : Colors.grey),
          suffixIconColor: WidgetStateColor.resolveWith((states) =>
              states.contains(WidgetState.focused)
                  ? AppColors.primaryColor
                  : Colors.grey),
          contentPadding: contentPadding ??
              const EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hint,
          hintStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: AppColors.grey,
              ),
          labelText: label,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 8),
              borderSide: const BorderSide(color: AppColors.black, width: 1)),
          labelStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: textColor ?? AppColors.primaryColor,
              fontWeight: FontWeight.bold),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 8),
              borderSide: BorderSide(
                  color: focusedColor ?? AppColors.primaryColor, width: 2)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 8),
              borderSide: const BorderSide(color: AppColors.primaryColor)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 8),
              borderSide: const BorderSide(color: AppColors.red, width: 2)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 8),
              borderSide: const BorderSide(color: AppColors.grey, width: 2))),
    );
  }
}
