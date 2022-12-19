import 'package:driver_buga_logistics/core/constants/textStyle.dart';
import 'package:driver_buga_logistics/core/widgets/button.dart';
import 'package:driver_buga_logistics/views/proof_of_residence.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../core/widgets/dotted_line.dart';

class DrivingLicenses extends StatelessWidget {
  const DrivingLicenses({super.key});

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
                'Upload Driving License',
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
                 label: 'Front View',
               ),
             ),
              Container(
                margin: const EdgeInsets.fromLTRB(22.0, 8.0, 20.0, 48.0),
                child: DottedLineUpload(
                  label: 'Back View',
                ),
              ),

              Center(
                child: Container(
                 // padding: EdgeInsets.fromLTRB(left, top, right, bottom),
                  margin: const EdgeInsets.fromLTRB(48.0, 0.0, 48.0, 50.0),
                  child: CustomButton(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const ProofOfResidence()));
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