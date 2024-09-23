import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool enabled;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final bool obscureText;
  final Color borderColor;
  final Color? color;
  final InputBorder? border;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final String? error;
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;
  final int? maxLines;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextStyle? errorStyle;
  final double radius;
  final double height;
  final double width;
  final double? borderWidth;

  const CommonTextFieldWidget({
    Key? key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.enabled = true,
    this.validator,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.words,
    this.obscureText = false,
    this.borderColor = const Color(0xFFDEE7FF),
    this.border,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.onEditingComplete,
    this.onChanged,
    this.maxLines,
    this.error,
    this.textStyle,
    this.hintStyle,
    this.contentPadding = const EdgeInsets.only(left: 12, top: 3),
    this.inputFormatters,
    this.readOnly = false,
    this.onTap,
    this.errorStyle,
    this.color,
    this.radius = 12,
    this.height = 50,
    this.width = double.infinity,
    this.borderWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        controller: controller,
        enabled: enabled,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        keyboardType: keyboardType,
        obscureText: obscureText,
        textCapitalization: textCapitalization,
        focusNode: focusNode,
        onEditingComplete: onEditingComplete,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        readOnly: readOnly,
        onTap: onTap,
        // enableInteractiveSelection: false,
        style: textStyle ??
            GoogleFonts.rubik(
              color: const Color(0xFF8391B5),
            ),
        maxLines: obscureText ? 1 : maxLines,
        decoration: InputDecoration(
            fillColor: color,
            filled: true,
            labelText: labelText,
            hintText: hintText,
            hintStyle: hintStyle,
            contentPadding: contentPadding,
            labelStyle:
                GoogleFonts.poppins(fontSize: 12, color: Colors.grey[300]),
            border: border ?? outlineInputBorder(),
            enabledBorder: outlineInputBorder(),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: borderWidth ?? 1,
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(radius),
            ),
            focusedBorder: border ??
                OutlineInputBorder(
                  borderSide: BorderSide(
                    width: borderWidth ?? 1.3,
                    color: Colors.blue.withOpacity(.2),
                  ),
                  borderRadius: BorderRadius.circular(radius),
                ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            errorText: error,
            errorStyle: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.red[200],
                fontWeight: FontWeight.w400),
            errorMaxLines: 3),
        validator: validator,
      ),
    );
  }

  InputBorder? outlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: borderWidth ?? 1,
        color: borderColor,
      ),
      borderRadius: BorderRadius.circular(radius),
    );
  }
}
