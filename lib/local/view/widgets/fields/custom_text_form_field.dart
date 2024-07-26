import 'package:flutter/material.dart';
import 'package:proj/local/core/constant/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
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
  });
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

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onChanged: onChange,
      controller: textEditingController,
      validator: validator,
      style: const TextStyle(
          fontSize: 15,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
          fontFamily: "Schyler"),
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
          contentPadding: contentPadding ??
              const EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hint,
          hintStyle: const TextStyle(
              color: AppColors.grey, fontSize: 15, fontFamily: "Schyler"),
          labelText: label,
          labelStyle: const TextStyle(
              fontSize: 15,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontFamily: "Schyler"),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 8),
              borderSide:
                  const BorderSide(color: AppColors.primaryColor, width: 2)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 8),
              borderSide: const BorderSide(color: AppColors.primaryColor)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 8),
              borderSide: const BorderSide(color: AppColors.red, width: 2)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 8),
          )),
    );
  }
}
