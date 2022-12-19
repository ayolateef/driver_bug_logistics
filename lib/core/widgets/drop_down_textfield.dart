import 'package:driver_buga_logistics/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidgetsDropDownTextField<T> extends StatelessWidget {
  final String? fieldLabel;
  final String hintText;
  final List<T> options;
  final T? value;
  final String Function(T?)? getLabel;
  final Function(T)? onChanged;
  // final VoidCallback? onChanged;
  final VoidCallback? onTap;
  final double? minWidth;
  final double? minHeight;
  final Widget? suffix;
  final Widget? prefix;

  const WidgetsDropDownTextField({
    this.fieldLabel,
    this.hintText = 'select an Option',
    this.options = const [],
    this.getLabel,
    this.value,
    this.onChanged,
    this.onTap,
    this.minWidth,
    this.minHeight,
    this.suffix,
    super.key,
    this.prefix,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: minWidth ?? 100.0.w,
      height: minHeight ?? 100.0.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fieldLabel ?? "",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w400,
                color: ColorUtils.dropDownBlackColor),
          ),
          SizedBox(height: 1.0.h),
          SizedBox(
            // height: maxLength != null ? 9.h : 7.h,
            width: minWidth ?? 100.0.w,
            height: 53.h,
            child: FormField<T>(
              builder: (FormFieldState<T> state) {
                return InputDecorator(
                  decoration: InputDecoration(
                    // suffixIcon: suffix ?? const Icon(Icons.arrow_drop_down_rounded),
                    isDense: true,
                    prefixIcon: prefix,
                    contentPadding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                    labelText: hintText,
                    labelStyle:
                        Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: ColorUtils.textFieldLabelColor,
                              fontSize: 18.sp,
                            ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.4),
                          width: 0.5),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                Theme.of(context).primaryColor.withOpacity(1),
                            width: 0.5),
                        borderRadius: BorderRadius.circular(4.0)),
                  ),
                  isEmpty: value == null || value == '',
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<T>(
                      iconSize: 18,
                      iconDisabledColor: ColorUtils.buttonColor2,
                      iconEnabledColor: ColorUtils.primaryColor,
                      icon: suffix ?? const Icon(Icons.keyboard_arrow_down),
                      borderRadius: BorderRadius.circular(12),
                      value: value,
                      isDense: true,
                      onTap: onTap,
                      onChanged: (text) {
                        if (onChanged == null) onChanged!(text as T);
                      },
                      items: options.map((T value) {
                        return DropdownMenuItem<T>(
                          value: value,
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            getLabel!(value),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontSize: 12.sp,
                                ),
                          ),
                          // Divider(),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
