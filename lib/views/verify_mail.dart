import 'package:driver_buga_logistics/core/constants/app_assets.dart';
import 'package:driver_buga_logistics/core/constants/colors.dart';
import 'package:driver_buga_logistics/core/constants/textStyle.dart';
import 'package:driver_buga_logistics/core/widgets/button.dart';
import 'package:driver_buga_logistics/views/account_verified.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorUtils.primaryWhiteColor,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: ColorUtils.buttonColor,
              size: 36.0.sp,
            ),
          ),

          // SvgPicture.asset(
          //     AppAsset.menuIcon,
          //   height: 14.0.sp,
          //   width: 14.sp
          // ),
          actions: [
            IconButton(
                onPressed: () {}, icon: SvgPicture.asset(AppAsset.smsIcon)),
            IconButton(
              icon: SvgPicture.asset(AppAsset.trashIcon),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset(AppAsset.smsTrackingIcon),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset(AppAsset.moreIcon),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                //padding: EdgeInsets.fromLTRB(left, top, right, bottom),
                margin: EdgeInsets.fromLTRB(16.0, 24.0, 0.0, 24.0),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Verify Your Account ',
                          style: CustomTextStyle.kBoldTextStyle),
                      TextSpan(
                          text: 'inbox',
                          style: CustomTextStyle.kVerySmallTextStyle)
                    ])),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(AppAsset.starIcon))
                  ],
                ),
              ),
              Container(
                //padding: EdgeInsets.fromLTRB(left, top, right, bottom),
                margin: EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 20.0),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(AppAsset.mainLogo),
                    SizedBox(width: 12.0.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: 'BUGA Logistics ',
                            style: CustomTextStyle.kBoldBlackTextStyle,
                          ),
                          TextSpan(
                              text: '4:40 PM',
                              style: CustomTextStyle.kVerySmallTextStyle)
                        ])),
                        Row(
                          children: [
                            Text(
                              'to me',
                              style: CustomTextStyle.kVerySmallTextStyle,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 16.0.sp,
                            )
                          ],
                        )
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(AppAsset.arrowLeftIcon)),
                        IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(AppAsset.moreIcon))
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorUtils.containerColor,
                      borderRadius: BorderRadius.circular(4.0)),
                  height: 500.h,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: RichText(
                      // textScaleFactor: 1.8,
                      textDirection: TextDirection.ltr,
                      text: TextSpan(children: [
                        TextSpan(
                            text:
                                'Hi Caramel,\n                                                      ',
                            style: CustomTextStyle.kTextStyle),
                        TextSpan(
                            text:
                                'Welcome to BUGA Logistics.\n                                                              '
                                'Help us secure your account by verifying'
                                ' that ',
                            style: CustomTextStyle.kTextStyle),
                        TextSpan(
                            text: 'caramelcoker@hotmail.com ',
                            style: CustomTextStyle.kTextStyle2),
                        TextSpan(
                            text:
                                'is your email address. \n                                                            '
                                'Please, click the button below to verify your email and activate your account.\n                                                      '
                                'Kindly note that this link is valid only for 24 hours. After the time limit has expired,'
                                ' you will have to resubmit another request'
                                ' for your account verification.\n                                                                                   '
                                'Thank you for choosing BUGA.',
                            style: CustomTextStyle.kTextStyle),
                      ]),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const AccountVerified())),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RoundedButton(
                      image: AppAsset.arrowLeftIcon,
                    ),
                    RoundedButton(
                      text: 'Reply all',
                      image: AppAsset.arrowLeftIcon,
                    ),
                    RoundedButton(
                      text: 'forward',
                      image: AppAsset.arrowRightIcon,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
