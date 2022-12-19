import 'package:driver_buga_logistics/core/constants/app_assets.dart';
import 'package:driver_buga_logistics/core/constants/textStyle.dart';
import 'package:driver_buga_logistics/core/widgets/button.dart';
import 'package:driver_buga_logistics/views/complete_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountVerified extends StatelessWidget {
  const AccountVerified({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              //padding: EdgeInsets.fromLTRB(left, top, right, bottom),
              margin: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 70.0),
              child: Text(
                'Account Verified',
                style: CustomTextStyle.kBoldTextStyle,
              )),
          SvgPicture.asset(AppAsset.checkCircle),
          Container(
              //padding: EdgeInsets.fromLTRB(left, top, right, bottom),
              margin: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 30.0),
              child: Text(
                'Congratulations!',
                style: CustomTextStyle.kBoldBlackTextStyle,
              )),
          Container(
            padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 50.0),
            margin: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 20.0),
            child: Text(
              'The email caramelcoker@hotmail.com is now a verified account. '
              'Thank you for helping us keep your account verified.',
              style: CustomTextStyle.kTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CompleteProfilePage())),
            child: CustomButton(
              text: 'Continue',
              style: CustomTextStyle.kButtonTextStyle,
            ),
          )
        ],
      ),
    ));
  }
}
