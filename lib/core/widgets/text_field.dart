import 'package:driver_buga_logistics/core/constants/colors.dart';
import 'package:driver_buga_logistics/core/constants/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpTextField extends StatelessWidget {
  final String? label;
  final int? minLines;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? hintText;
  final TextInputFormatter? formatter;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final Function()? onTap;
  final int? maxLength;
  final TextEditingController? controller;
  final dynamic validator;
  final bool shouldReadOnly;
  final double? minWidth;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String?)? onFieldSubmitted;

  const SignUpTextField(
      {super.key,
      this.inputFormatters,
      this.controller,
      required this.hintText,
      this.validator,
      this.onChanged,
      this.onSaved,
      this.onFieldSubmitted,
      required this.obscureText,
      this.label,
      this.minLines,
      this.maxLength,
      this.onTap,
      this.keyboardType,
      this.formatter,
      this.shouldReadOnly = false,
      trailing,
      this.suffixIcon,
      this.minWidth,
      this.prefixIcon,
      this.labelStyle,
      this.hintStyle});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: minWidth ?? 100.0.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label ?? "",
              style: labelStyle ?? CustomTextStyle.kLabelTextStyle),

          // Theme.of(context).copyWith(
          //     colorScheme: Theme.of(context).colorScheme.copyWith(
          //         primary: const Color(0xff003049)
          //     )

          SizedBox(height: 1.0.h),
          SizedBox(
            height: 58.0.h,
            // height: maxLength != null ? 5.h : 5.h,
            width: minWidth ?? 100.0.w,
            child: TextFormField(
              minLines: minLines ?? 1,
              controller: controller,
              maxLength: maxLength,
              onSaved: onSaved,
              onTap: onTap,
              onChanged: (text) {
                if (onChanged != null) onChanged!(text);
              },
              cursorColor: ColorUtils.primaryColor,
              keyboardType: keyboardType,
              obscureText: obscureText,
              inputFormatters: [
                formatter ?? FilteringTextInputFormatter.singleLineFormatter
              ],
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validator,
              style: hintStyle ?? Theme.of(context).textTheme.bodyMedium,
              readOnly: shouldReadOnly,
              decoration: InputDecoration(
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon,
                suffixStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorUtils.textFieldBorderColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                isDense: false,
                counterText: "",
                hintText: hintText,
                hintStyle: hintStyle ??
                    Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: ColorUtils.hintColor,
                          fontSize: 18.sp,
                        ),
                contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: ColorUtils.textFieldBorderColor, width: .8),
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: ColorUtils.textFieldBorderColor, width: 0),
                    borderRadius: BorderRadius.all(Radius.circular(7.5))),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: ColorUtils.textFieldBorderColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(7.5))),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: ColorUtils.textFieldBorderColor, width: 0.4),
                    borderRadius: BorderRadius.all(Radius.circular(7.5))),
                focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: ColorUtils.textFieldBorderColor, width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: ColorUtils.textFieldBorderColor, width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(18))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
