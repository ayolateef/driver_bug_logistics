import 'package:driver_buga_logistics/views/verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/textStyle.dart';
import '../core/widgets/button.dart';
import '../core/widgets/dotted_line.dart';

class ProofOfResidence extends StatelessWidget {
  const ProofOfResidence ({super.key});

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
                    'Upload Proof Of Residence',
                    style: CustomTextStyle.kBoldTextStyle,
                    textScaleFactor: 1.2,
                  )),
              Container(
                margin: const EdgeInsets.fromLTRB(22.0, 8.0, 20.0, 48.0),
                child: Text(
                  'We will need to see your driving’s license before we can validate you as a driver.',
                  textAlign: TextAlign.start,
                  textScaleFactor: 1.4,
                  textDirection: TextDirection.ltr,
                  style: CustomTextStyle.kTextDescription,
                ),
              ),

              Container(
                margin: const EdgeInsets.fromLTRB(22.0, 8.0, 20.0, 48.0),
                child: DottedLineUpload(
                  height: 443.sp,
                  label: 'Front View',
                ),
              ),
              Center(
                child: Container(
                  // padding: EdgeInsets.fromLTRB(left, top, right, bottom),
                  margin: const EdgeInsets.fromLTRB(48.0, 0.0, 48.0, 50.0),
                  child: CustomButton(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const VerificationPending ()));
                    },
                    text: 'Continue',style: CustomTextStyle.kButtonTextStyle,

                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }


}