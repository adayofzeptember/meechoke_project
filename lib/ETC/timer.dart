// import 'dart:async';
// import 'package:meechoke_project/bloc/Car_Check/car_check_bloc.dart';
// import 'package:meechoke_project/bloc/Fuel/fuel_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// const String _endTimeKey = 'end_time';

// Timer? _timer;

// Future<void> _loadEndTime(context) async {
//   final prefs = await SharedPreferences.getInstance();
//   final endTimeString = prefs.getString(_endTimeKey);
//   if (endTimeString != null) {
//     final endTime = DateTime.parse(endTimeString);
//     final now = DateTime.now();
//     CarCheckState currentState = context.read<CarCheckBloc>;
//     context
//         .read<CarCheckBloc>()
//         .add(CountDown_RemainingTime(getTime: endTime.difference(now)));

//     if (_remainingTime.inSeconds > 0) {
//       _startTimer();
//     }
//   }
// }

// startCountdownAfterSubmit(Duration duration, context) async {
//   final endTime = DateTime.now().add(duration);
//   final prefs = await SharedPreferences.getInstance();
//   await prefs.setString(_endTimeKey, endTime.toIso8601String());
//   context.read<CarCheckBloc>().add(CountDown_RemainingTime(getTime: duration));

//   // setState(() {
//   //   _remainingTime = duration;
//   // });
//   _startTimer();
// }

// void _startTimer() {
//   _timer?.cancel();
//   if (_remainingTime.inSeconds > 0) {
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {
//         _remainingTime -= Duration(seconds: 1);
//       });
//       if (_remainingTime.inSeconds <= 0) {
//         timer.cancel();
//       }
//     });
//   }
// }
