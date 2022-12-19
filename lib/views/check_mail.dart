import 'package:driver_buga_logistics/core/constants/app_assets.dart';
import 'package:driver_buga_logistics/core/constants/colors.dart';
import 'package:driver_buga_logistics/core/constants/textStyle.dart';
import 'package:driver_buga_logistics/core/widgets/button.dart';
import 'package:driver_buga_logistics/views/verify_mail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CheckMail extends StatelessWidget {
  const CheckMail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorUtils.primaryWhiteColor,
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
            color: ColorUtils.primaryColor,
          ),
          title: Text(
            'Verify Your Email',
            style: CustomTextStyle.kBoldTextStyle,
          ),
        ),
        body: Column(
          children: [
            Container(
              //padding: EdgeInsets.fromLTRB(left, top, right, bottom),
              margin: const EdgeInsets.fromLTRB(22.0, 8.0, 20.0, 48.0),
              child: Text(
                'We have sent you a mail. Please click on the link '
                'in the message to verify your email address so            '
                'that you can access the App.',
                textHeightBehavior: const TextHeightBehavior(
                    applyHeightToFirstAscent: true,
                    applyHeightToLastDescent: true),
                textScaleFactor: 1.4,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.start,
                style: CustomTextStyle.kTextDescription,
              ),
            ),
            Container(
                //padding: EdgeInsets.fromLTRB(left, top, right, bottom),
                margin: const EdgeInsets.fromLTRB(75.0, 8.0, 75.0, 75.0),
                child: SvgPicture.asset(AppAsset.bigEmailIcon)),
            InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const VerifyEmailPage())),
              child: CustomButton(
                text: 'Check Your Mail',
                style: CustomTextStyle.kButtonTextStyle,
              ),
            ),
            Container(
              //padding: EdgeInsets.fromLTRB(left, top, right, bottom),
              margin: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 50.0),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Didn’t receive the mail? ',
                    style: CustomTextStyle.kEmailTextStyle),
                TextSpan(
                    text: 'Check your spam folder.',
                    style: CustomTextStyle.kTextDescription)
              ])),
            )
          ],
        ));
  }
}
