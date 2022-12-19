import 'package:driver_buga_logistics/core/constants/colors.dart';
import 'package:driver_buga_logistics/core/constants/textStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Color? colour;
  final String? image;
  final Border? borderSide;
  final VoidCallback? onTap;
  final TextStyle? style;
  final VoidCallback? onPressed;

  const CustomButton(
      {Key? key,
      this.text,
      this.colour,
      this.image,
      this.borderSide,
      this.onTap,
      this.onPressed,
      this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 350.sp,
        height: 63.h,
        decoration: BoxDecoration(
          border: borderSide,
          borderRadius: BorderRadius.circular(4.0),
          color: colour ?? ColorUtils.buttonColor,
        ),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image != null) SvgPicture.asset(image!),
            SizedBox(
              width: 10.sp,
            ),
            Text(
              text ?? 'Sign up',
              style: style,
            )
          ],
        )),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String? text;
  final Color? colour;
  final String? image;
  final VoidCallback? onTap;
  const RoundedButton(
      {Key? key, this.text, this.colour, this.image, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 80),
      height: 36.0.w,
      width: 96.0.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorUtils.buttonColor2,
        ),
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: [
              if (image != null)
                SvgPicture.asset(
                  image!,
                  height: 11.5.sp,
                  width: 30.5.sp,
                ),
              SizedBox(
                width: 10.sp,
              ),
              Text(text ?? 'Reply', style: CustomTextStyle.kVerySmallTextStyle)
            ],
          ),
        ),
      ),
    );
  }
}
