import 'package:driver_buga_logistics/core/constants/colors.dart';
import 'package:driver_buga_logistics/core/constants/textStyle.dart';
import 'package:driver_buga_logistics/core/widgets/button.dart';
import 'package:driver_buga_logistics/utils/items.dart';
import 'package:driver_buga_logistics/views/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  List<Widget> slides = items
      .map((item) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              children: <Widget>[
                Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Image.asset(
                      item['image'],
                      fit: BoxFit.fitWidth,
                      width: 342.sp,
                      height: 343.sp,
                      alignment: Alignment.bottomCenter,
                    )),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          item['header'],
                          style: CustomTextStyle.kTextHeader,
                        ),
                        Text(
                          item['description'],
                          style: CustomTextStyle.kTextDescription,
                          textAlign: TextAlign.center,
                        ),
                        CustomButton(
                          text: item['button'],
                          style: CustomTextStyle.kButtonTextStyle,
                        ),
                        Text(
                          item['text'],
                          style: CustomTextStyle.kLoginTextStyle,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ))
      .toList();
  List<Widget> indicator(

      ) => List<Widget>.generate(
      slides.length,
      (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 3.0),
            height: 10.0.sp,
            width: 10.0.sp,
            decoration: BoxDecoration(
                color: currentPage.round() == index
                    ? ColorUtils.indicatorColor
                    : ColorUtils.indicatorColor2,
                borderRadius: BorderRadius.circular(10.0)),
          ));

  double currentPage = 0.0;
    var _pageViewController = PageController();
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;


  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
  }
  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView.builder(
            controller: _pageViewController,
            itemCount: slides.length,
            itemBuilder: (BuildContext context, int index) {
              _pageViewController.addListener(() {
                setState(() {
                  currentPage = _pageViewController.page!;
                  currentPage = index as double;
                });
              });
              return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()),
                    );
                  },
                  child: slides[index],

              );
            }),
        Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.only(top: 30.0),
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: indicator(),

              ),
            ))
      ],
    ));
  }
  nextFunction() {
    _pageViewController.nextPage(duration: _kDuration, curve: _kCurve);
  }
  previousFunction() {
    _pageViewController.previousPage(duration: _kDuration, curve: _kCurve);
  }
}
