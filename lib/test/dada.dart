// import 'package:flutter/material.dart';
// import 'dart:async';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Countdown Timer',
//       home: CountdownTimerApp(),
//     );
//   }
// }

// class CountdownTimerApp extends StatefulWidget {
//   @override
//   _CountdownTimerAppState createState() => _CountdownTimerAppState();
// }

// class _CountdownTimerAppState extends State<CountdownTimerApp> {
//   final int _startHours = 1;่่ก
//   final int _startMinutes = 30;

//   final int _startSeconds = 0;

//   late Timer _countdownTimer;
//   int _hours = 0;
//   int _minutes = 0;
//   int _seconds = 0;

//   @override
//   void initState() {
//     super.initState();
//     _hours = _startHours;
//     _minutes = _startMinutes;
//     _seconds = _startSeconds;
//     _startCountdown();
//   }

//   void _startCountdown() {
//     _countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_hours == 0 && _minutes == 0 && _seconds == 0) {
//           _countdownTimer.cancel();
//         } else if (_seconds == 0) {
//           if (_minutes == 0) {
//             _hours--;
//             _minutes = 59;
//           } else {
//             _minutes--;
//           }
//           _seconds = 59;
//         } else {
//           _seconds--;
//         }
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _countdownTimer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Countdown Timer'),
//       ),
//       body: Center(
//         child: Text(
//           'Time Remaining: $_hours hours $_minutes minutes $_seconds seconds',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }
