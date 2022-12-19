import 'dart:io';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:driver_buga_logistics/core/constants/app_assets.dart';
import 'package:driver_buga_logistics/core/constants/colors.dart';
import 'package:driver_buga_logistics/core/widgets/drop_down_textfield.dart';
import 'package:driver_buga_logistics/views/driving_licenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../core/constants/textStyle.dart';
import '../core/widgets/button.dart';
import '../core/widgets/text_field.dart';

class CompleteProfilePage extends StatefulWidget {
  const CompleteProfilePage({Key? key}) : super(key: key);

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  final _myController = TextEditingController();
  File? _image;

  Future getImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      _image = image as File;
    });
  }

  @override
  void initState() {
    super.initState();
    _myController.text = '';
    _myController.addListener(() {
      setState(() {}); // setState every time text changes
    });
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.fromLTRB(22.0, 30.0, 20.0, 8.0),
                child: Text(
                  'Let’s get you started!',
                  style: CustomTextStyle.kBoldTextStyle,
                  textScaleFactor: 1.2,
                )),
            Container(
              margin: const EdgeInsets.fromLTRB(22.0, 8.0, 20.0, 48.0),
              child: Text(
                'Kindly set up your account with the next few steps. Data privacy and security is assured...',
                textAlign: TextAlign.start,
                textScaleFactor: 1.4,
                textDirection: TextDirection.ltr,
                style: CustomTextStyle.kTextDescription,
              ),
            ),
           
            Center(
                child: Container(
                    width: 96.0,
                    height: 96.0,
                    decoration: BoxDecoration(
                      color: ColorUtils.circleContainerColor,
                      borderRadius: BorderRadius.circular(100.0.r),
                    ),
                    child: GestureDetector(
                        onTap: getImageFromCamera,
                        child: _image == null
                            ? Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: SvgPicture.asset(AppAsset.cameraIcon),
                              )
                            : Image.file(_image!)))),
            Container(
              margin: const EdgeInsets.fromLTRB(18.0, 40.0, 18.0, 18.0),
              child: SignUpTextField(
                minWidth: double.infinity,
                label: 'Full Name',
                hintText: 'Caramel Coker',
                obscureText: false,
                controller: _myController,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Phone Number'),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 14.0),
                        height: 53.0.h,
                        width: 70.0.w,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: ColorUtils.textFieldBorderColor),
                            borderRadius: BorderRadius.circular(4.0)),
                        child: CountryCodePicker(
                          initialSelection: 'US',
                          favorite: const ['+1'],
                          showDropDownButton: true,
                          showOnlyCountryWhenClosed: false,
                          hideMainText: false,
                          showCountryOnly: true,
                          showFlag: false,
                          padding: EdgeInsets.all(1.0.w),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                          child: SignUpTextField(
                            controller: _myController,
                        keyboardType: TextInputType.number,
                        minWidth: double.infinity,
                        hintText: '111-1111-111',
                        obscureText: false,

                      ))
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 8.0),
              child:  WidgetsDropDownTextField(
                fieldLabel: 'Gender',
                minWidth: double.infinity,
                options: ['Male', 'Female'],
                  getLabel:(value) {
                    return '' ;
                  }
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 8.0),
              child:  WidgetsDropDownTextField(
                fieldLabel: 'Age',
                minWidth: double.infinity,
                 options: [],
                getLabel:(value) {
                  return '' ;
                }

              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 8.0),
              child:  WidgetsDropDownTextField(
                fieldLabel: 'Location',
                minWidth: double.infinity,
                  options: const ['Abuja', 'Lagos'],
                  getLabel:(value) {
                    return '' ;
                  }
              ),
            ),
            Center(
              child: Container(
                // padding: EdgeInsets.fromLTRB(left, top, right, bottom),
                margin: const EdgeInsets.fromLTRB(18.0, 40.0, 18.0, 8.0),
                child: CustomButton(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const DrivingLicenses())),
                  text: 'Continue',
                  style: CustomTextStyle.kButtonTextStyle,
                  colour: (_myController.text.isEmpty)? ColorUtils.buttonColor2 : ColorUtils.buttonColor,
              ),
                ),
              ),
          ],
        ),
      ),
    ));
  }
}
