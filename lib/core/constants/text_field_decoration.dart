import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFieldDecoration {
  static var kTextFieldInputDecoration2 = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
    filled: true,
    labelText: "111-1111-111",
    hintStyle: const TextStyle(color: Colors.grey),
    hintText: "(201) 555-0123",
    hintTextDirection: TextDirection.ltr,
    contentPadding: EdgeInsets.symmetric(vertical: 13.0.h, horizontal: 13.0.w),
  );
}
