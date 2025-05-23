import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    this.contentPading,
    this.focusBorder,
    this.enableBorder,
    this.errorBorder,
    this.focusErrorBorder,
    this.inputTextStyle,
    this.hintText,
    this.onSaved,
    this.onChange,
    this.isObscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.backgroundColor,
    required this.validator,
    this.controller,
    this.keyboardType,
  });

  final EdgeInsetsGeometry? contentPading;
  final InputBorder? focusBorder;
  final InputBorder? enableBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusErrorBorder;
  final TextStyle? inputTextStyle;
  final String? hintText;
  final void Function(String?)? onSaved;
  final void Function(String)? onChange;
  final bool isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        controller: controller,
        onChanged: onChange,
        onSaved: onSaved,
        obscureText: isObscureText,
        keyboardType: keyboardType,
        style: inputTextStyle ?? const TextStyle(fontSize: 16),
        decoration: InputDecoration(
          contentPadding:
              contentPading ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xff929BAB),
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: enableBorder ?? customBorder(),
          focusedBorder: focusBorder ?? customBorder(const Color(0xff149954)),
          errorBorder: errorBorder ?? customBorder(Colors.red),
          focusedErrorBorder: focusErrorBorder ?? customBorder(Colors.red),
        ),
        validator: validator,
      ),
    );
  }

  OutlineInputBorder customBorder([Color color = Colors.grey]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color, width: 1.2),
    );
  }
}
