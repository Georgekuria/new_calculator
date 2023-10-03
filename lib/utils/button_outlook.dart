// import 'package:flutter/material.dart';
// import 'package:new_calculator/methods/calculationMethods.dart';
// import 'package:new_calculator/pages/calculator_layout.dart';
//
// import '../models/button_details.dart';
//
// class ButtonOutlook extends StatefulWidget {
//   String buttonValue;
//   ButtonOutlook({super.key, required this.buttonValue});
//
//   @override
//   State<ButtonOutlook> createState() => _ButtonOutlookState();
// }
//
// class _ButtonOutlookState extends State<ButtonOutlook> {
//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Material(
//         child: Container(
//           decoration: BoxDecoration(
//               color: getButtonColor(widget.buttonValue),
//               borderRadius: BorderRadius.circular(40),
//               boxShadow: [
//                 BoxShadow(
//                     color: Colors.grey.shade200, spreadRadius: 4, blurRadius: 3)
//               ]),
//           alignment: Alignment.center,
//           child: InkWell(
//             onTap: () {
//               print("sdcsdc");
//             },
//             child: Text(
//               widget.buttonValue,
//               style: TextStyle(
//                   fontSize: 45,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white),
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   tappedButtonAction(String tappedButtonValue) {
//
//
//   }
//
//
//
//   Color getButtonColor(String buttonValue) {
//     return [Buttons.del, Buttons.clr].contains(buttonValue)
//         ? Colors.blue
//         : [
//             Buttons.per,
//             Buttons.multiply,
//             Buttons.add,
//             Buttons.divide,
//             Buttons.subtract
//           ].contains(buttonValue)
//             ? Colors.orange
//             : Colors.black87;
//   }
// }
