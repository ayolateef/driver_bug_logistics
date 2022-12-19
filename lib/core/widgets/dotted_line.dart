import 'dart:async';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import '../constants/app_assets.dart';
import '../constants/colors.dart';
import '../constants/textStyle.dart';

class DottedLineUpload extends StatefulWidget {
  final String? label;
  final String? icon;
  final String? text;
  double? height;
  DottedLineUpload({Key? key, this.label, this.icon, this.text, this.height}) : super(key: key);

  @override
  State<DottedLineUpload> createState() => _DottedLineUploadState();
}

class _DottedLineUploadState extends State<DottedLineUpload> {
  File? _image;
  Future getImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      _image = image as File;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label!,style: CustomTextStyle.kTextStyle,),
        SizedBox(height: 10.0.h,),
        SizedBox(
          height: widget.height ?? 208.h,
          child: DottedBorder(

            borderType: BorderType.RRect,
            radius: const Radius.circular(4),
            dashPattern: const [10, 5],
            color: ColorUtils.primaryColor,
            strokeWidth: 0.5,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: getImageFromCamera,
                      child: _image == null ?SvgPicture.asset( widget.icon ??AppAsset.uploadIcon)
                          : Image.file(_image!)
                  ),
                  RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(text: widget.text ??'Click here to ', style: CustomTextStyle.kTextStyle3),
                          TextSpan(text: widget.text ?? 'Upload ', style: CustomTextStyle.kTextStyle4),
                          TextSpan(text:widget.text ?? 'image', style: CustomTextStyle.kTextStyle3),
                        ]
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );  }
}


