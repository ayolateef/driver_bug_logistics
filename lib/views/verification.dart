import 'package:driver_buga_logistics/utils/items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/colors.dart';
import '../core/constants/textStyle.dart';
import '../core/widgets/button.dart';
import 'login_page.dart';

class VerificationPending extends StatefulWidget {
  const VerificationPending({Key? key}) : super(key: key);

  @override
  State<VerificationPending> createState() => _VerificationPendingState();
}

class _VerificationPendingState extends State<VerificationPending> {
  List<Widget> slides = lists.map((list) =>
  Container(
    padding: const EdgeInsets.symmetric(horizontal: 18.0),
    child: Column(
      children: <Widget>[
        Flexible(
          flex: 1,
            fit: FlexFit.tight,
            child: Image.asset(list['image'],
            fit: BoxFit.fitWidth,
              width: 342.sp,
              height: 343.sp,
            )
        ),
        Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                children: [
                  Text(list['header'],
                    style: CustomTextStyle.kTextHeader,
                  ),
                  Text(list['description'],style: CustomTextStyle.kTextDescription,
                    textAlign: TextAlign.center,
                  ),
                  CustomButton(
                    text: list['button'],
                    style: CustomTextStyle.kButtonTextStyle,
                  ),
                ],
              ),
            )
        ),
      ],
    ),
  )).toList();
  // List<Widget> indicator() => List<Widget>.generate(
  //     slides.length,
  //         (index) => Container(
  //       margin: const EdgeInsets.symmetric(horizontal: 3.0),
  //       height: 10.0.sp,
  //       width: 10.0.sp,
  //       decoration: BoxDecoration(
  //           color: currentPage.round() == index
  //               ? ColorUtils.indicatorColor
  //               : ColorUtils.indicatorColor2,
  //           borderRadius: BorderRadius.circular(10.0)),
  //     ));
  double currentPage = 0.0;
  final _pageViewController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            PageView.builder(
                controller: _pageViewController,
                itemCount: slides.length,
                itemBuilder: (BuildContext context, int index){
                  _pageViewController.addListener(() {
                    setState(() {
                      currentPage = _pageViewController.page!;
                    });
                  });
                  return InkWell(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
                      },
                      child: slides[index]);

                }),

            Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.only(top: 30.0),
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //children: indicator(),
                  ),
                ))
          ],
        )
    );

  }
}
