// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meechoke_project/ETC/app_color.dart';
// import 'package:meechoke_project/bloc/Car_Power/car_power_bloc.dart';

// class CarPower_Form extends StatefulWidget {
//   @override
//   _CarPower_FormState createState() => _CarPower_FormState();
// }

// class _CarPower_FormState extends State<CarPower_Form> {
//   int _selectedButtonIndex = -1; // Initially no button is selected

//   void _onButtonPressed(int index) {
//     setState(() {
//       // Toggle selection
//       if (_selectedButtonIndex == index) {
//         _selectedButtonIndex = -1; // Deselect if already selected
//       } else {
//         _selectedButtonIndex = index; // Select the button
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 228, 237, 240),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 10,
//           ),
//           Text(
//             'เลือกกลุ่มรถ',
//             style: TextStyle(
//                 color: Palette.thisBlue,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           BlocBuilder<CarPowerBloc, CarPowerState>(
//             builder: (context, state) {
//               return Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child: ButtonWidget(
//                           index: 0,
//                           isSelected: state.car_power_selectedButtonIndex == 0,
//                           onPressed: _onButtonPressed,
//                           buttonText: "4 ล้อพ่วง",
//                         ),
//                       ),
//                       SizedBox(width: 10), // Adjust spacing between buttons
//                       Expanded(
//                         child: ButtonWidget(
//                           index: 1,
//                           isSelected: state.car_power_selectedButtonIndex == 1,
//                           onPressed: _onButtonPressed,
//                           buttonText: "6 ล้อ",
//                         ),
//                       ),
//                       SizedBox(width: 10), // Adjust spacing between buttons
//                       Expanded(
//                         child: ButtonWidget(
//                           index: 2,
//                           isSelected: state.car_power_selectedButtonIndex == 2,
//                           onPressed: _onButtonPressed,
//                           buttonText: "10 ล้อ",
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10), // Adjust spacing between rows
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child: ButtonWidget(
//                           index: 3,
//                           isSelected: state.car_power_selectedButtonIndex == 3,
//                           onPressed: _onButtonPressed,
//                           buttonText: "พ่วง",
//                         ),
//                       ),
//                       SizedBox(width: 10), // Adjust spacing between buttons
//                       Expanded(
//                         child: ButtonWidget(
//                           index: 4,
//                           isSelected: state.car_power_selectedButtonIndex == 4,
//                           onPressed: _onButtonPressed,
//                           buttonText: "เทรลเลอร์",
//                         ),
//                       ),
//                       SizedBox(width: 10), // Adjust spacing between buttons
//                       Expanded(
//                         child: ButtonWidget(
//                           index: 5,
//                           isSelected: state.car_power_selectedButtonIndex == 5,
//                           onPressed: _onButtonPressed,
//                           buttonText: "ลากตู้",
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               );
//             },
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Text(
//             'เลือกรูปแบบรถ',
//             style: TextStyle(
//                 color: Palette.thisBlue,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ButtonWidget extends StatelessWidget {
//   final int index;
//   final bool isSelected;
//   final Function(int) onPressed;
//   final String buttonText;

//   const ButtonWidget({
//     required this.index,
//     required this.isSelected,
//     required this.onPressed,
//     required this.buttonText,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 80,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           primary: isSelected ? Palette.thisBlue : Colors.white,
//           elevation: 0,
//           shape: RoundedRectangleBorder(
//             side: BorderSide(
//               color: Palette.thisBlue, // Border color
//               width: 2.0, // Border width
//             ),
//             borderRadius: BorderRadius.circular(15),
//           ),
//         ),
//         onPressed: () => onPressed(index),
//         child: Text(
//           buttonText,
//           style: TextStyle(
//             color: isSelected ? Colors.white : Palette.thisBlue,
//             fontWeight: FontWeight.bold,
//             fontSize: 15,
//           ),
//         ),
//       ),
//     );
//   }
// }
