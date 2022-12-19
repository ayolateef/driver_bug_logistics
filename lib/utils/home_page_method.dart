// import 'package:driver_buga_logistics/core/constants/app_assets.dart';
// import 'package:driver_buga_logistics/core/constants/textStyle.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';

// import '../core/widgets/text_field.dart';

//  // ignore: non_constant_identifier_names
//  HomePageMethod() {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Container(
//         margin:  const EdgeInsets.fromLTRB(22.0, 30.0, 20.0, 8.0),
//         child: Row(
//           children:  [
//             CircleAvatar(
//               backgroundImage: AssetImage(AppAsset.picImage2),

//             ),
//             SizedBox(width: 5.0.w,),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Sept. 29, 2022',style: CustomTextStyle.kVerySmallTextStyle2, ),
//                 SizedBox(height: 10.0.h,),
//                 Text('Hi Caramel!', style: CustomTextStyle.kTextStyle2,)
//               ],
//             ),
//             Spacer(),
//             SvgPicture.asset(AppAsset.notificationIcon)
//           ],
//         ),
//       ),

//       Container(
//         // padding: EdgeInsets.fromLTRB(left, top, right, bottom),
//           margin: EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 8.0),
//           child: SignUpTextField(
//             minWidth: double.infinity,
//             prefixIcon: IconButton(
//                 onPressed: (){},
//                 icon: SvgPicture.asset(AppAsset.searchIcon)),
//             hintText: 'Enter tracking number',
//             obscureText: false,
//             keyboardType: TextInputType.number,
//           )
//       ),

//       Container(
//           margin: const EdgeInsets.fromLTRB(18.0, 18.0, 0.0, 0.0),
//           child:Text('How Can We Help You Today?', style: CustomTextStyle.kBoldBlackTextStyle2)
//       ),

//       Expanded(child: DemoListTile())
//     ],
//   );
// }