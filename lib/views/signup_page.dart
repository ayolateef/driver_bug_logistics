import 'package:driver_buga_logistics/core/constants/app_assets.dart';
import 'package:driver_buga_logistics/core/constants/colors.dart';
import 'package:driver_buga_logistics/core/constants/textStyle.dart';
import 'package:driver_buga_logistics/core/widgets/button.dart';
import 'package:driver_buga_logistics/core/widgets/text_field.dart';
import 'package:driver_buga_logistics/views/check_mail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/widgets/checkbox.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _myController = TextEditingController();


  late bool _passwordVisible;
  bool? _isChecked = false;

  @override
  void initState() {
    super.initState();
    _myController.text = '';
    _myController.addListener(() {
      setState(() {}); // setState every time text changes
    });
    _passwordVisible = false;
  }
  @override
  void dispose(){
    _myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(18.0, 16.0, 18.0, 8.0),
                child: Text('Sign Up!', style: CustomTextStyle.kBoldTextStyle)),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Create an account to get started...',
                style: CustomTextStyle.kTextDescription,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(18.0, 40.0, 18.0, 8.0),
              child: SignUpTextField(
                controller: _myController,
                  minWidth: double.infinity,
                  label: 'Full Name',
                  hintText: 'John Doe',
                  obscureText: false),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 8.0),
              child:  SignUpTextField(
                controller: _myController,
                minWidth: double.infinity,
                label: 'Email Address',
                hintText: 'johnisdoe@me.com',
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
              child: SignUpTextField(
                controller: _myController,
                minWidth: double.infinity,
                label: 'Password',
                hintText: 'password2022',
                obscureText: _passwordVisible,
                keyboardType: TextInputType.emailAddress,
                suffixIcon: IconButton(
                    iconSize: 24.sp,
                    onPressed: () {
                      _passwordVisible = !_passwordVisible;
                      setState(() {});
                    },
                    icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: ColorUtils.primaryColor)),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 18.0, 50.0),
              child: Row(
                children: [
                  BuildCheckbox(
                    value: _isChecked,
                    changed: (newBool) {
                      setState(() {
                        _isChecked = newBool;
                      });
                    },
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'I agree to the ',
                        style: CustomTextStyle.kTermsTextStyle),
                    TextSpan(
                        text: 'terms of service ',
                        style: CustomTextStyle.kTermsTextStyle2),
                    TextSpan(
                        text: 'and ', style: CustomTextStyle.kTermsTextStyle),
                    TextSpan(
                        text: 'privacy policies.',
                        style: CustomTextStyle.kTermsTextStyle2),
                  ])),
                ],
              ),
            ),
            Center(
              child: CustomButton(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CheckMail()));
                },
                colour: (_myController.text.isEmpty)? ColorUtils.buttonColor2 : ColorUtils.buttonColor,
                style: CustomTextStyle.kButtonTextStyle,
              ),
            ),
            Container(
              //padding: EdgeInsets.fromLTRB(left, top, right, bottom),
              margin: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 50.0),
              child: Center(
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Already have an account? ',
                      style: CustomTextStyle.kTermsTextStyle),
                  TextSpan(
                      text: 'Log in', style: CustomTextStyle.ktermsTextStyle3),
                ])),
              ),
            ),
            Container(
              //padding: EdgeInsets.fromLTRB(left, top, right, bottom),
              margin: EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 50.0),
              child: Row(
                children: [
                  const Expanded(child: Divider()),
                  Text(
                    'or sign up with',
                    style: CustomTextStyle.kHintTextStyle,
                  ),
                  const Expanded(child: Divider())
                ],
              ),
            ),
            Container(
              //padding: EdgeInsets.fromLTRB(left, top, right, bottom),
              margin: EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      image: AppAsset.facebookIcon,
                      text: 'Facebook',
                      style: CustomTextStyle.kButtonTextStyle2,
                      colour: ColorUtils.primaryWhiteColor,
                      borderSide: Border.all(color: ColorUtils.primaryColor),
                    ),
                  ),
                  SizedBox(
                    width: 20.0.sp,
                  ),
                  Expanded(
                    child: CustomButton(
                      image: AppAsset.googleIcon,
                      text: 'Google',
                      style: CustomTextStyle.kButtonTextStyle2,
                      colour: ColorUtils.primaryWhiteColor,
                      borderSide: Border.all(color: ColorUtils.primaryColor),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
//I agree to the terms of service and privacy policies.