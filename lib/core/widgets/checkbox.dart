import 'package:driver_buga_logistics/core/constants/colors.dart';
import 'package:flutter/material.dart';

class BuildCheckbox extends StatelessWidget {
  final bool? value;
  final ValueChanged? changed;
  final Color? activeColor;

  BuildCheckbox({
    this.value,
    this.changed,
    this.activeColor,
  });
//
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: value,
        tristate: true,
        activeColor: activeColor ?? ColorUtils.checkboxActiveColor,
        onChanged: changed!);
  }
}



//
// Checkbox buildCheckbox() {
//   return Checkbox(
//       value: _isChecked ,
//       tristate: true,
//       activeColor: ColorUtils.checkboxActiveColor,
//       onChanged: (newBool){
//         setState(() {
//           _isChecked =newBool;
//         });
//       }
//   );
// }


