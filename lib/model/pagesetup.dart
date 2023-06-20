// import 'package:expence_app/widgets/expance_page.dart';
// import 'package:expence_app/widgets/writing_page.dart';
// import 'package:flutter/material.dart';

// class PageSetting extends StatefulWidget {
//   const PageSetting({super.key});

//   @override
//   State<PageSetting> createState() => _PageSettingState();
// }

// class _PageSettingState extends State<PageSetting> {
//   var activepage = "StartScreen";
//   void onwrite() {
//     setState(() {
//       activepage = "Writepage";
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget active = Expance(onwrite: onwrite);
//     if (activepage == "Writepage") {
//       active = const WritingPage();
//     }
//     return Container(
//       child: active,
//     );
//   }
// }
