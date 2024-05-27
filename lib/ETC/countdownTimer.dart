import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persistent 24-Hour Countdown Timer',
      home: CountdownPage(),
    );
  }
}

class CountdownPage extends StatefulWidget {
  @override
  _CountdownPageState createState() => _CountdownPageState();
}

class _CountdownPageState extends State<CountdownPage>
    with WidgetsBindingObserver {
  static const String _endTimeKey = 'end_time';
  Duration _remainingTime = Duration();
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    _loadEndTime();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _timer?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _loadEndTime();
    }
  }

  Future<void> _loadEndTime() async {
    final prefs = await SharedPreferences.getInstance();
    final endTimeString = prefs.getString(_endTimeKey);
    if (endTimeString != null) {
      final endTime = DateTime.parse(endTimeString);
      final now = DateTime.now();
      setState(() {
        _remainingTime = endTime.difference(now);
      });
      if (_remainingTime.inSeconds > 0) {
        _startTimer();
      }
    }
  }

  Future<void> _startCountdown(Duration duration) async {
    final endTime = DateTime.now().add(duration);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_endTimeKey, endTime.toIso8601String());

    setState(() {
      _remainingTime = duration;
    });
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    if (_remainingTime.inSeconds > 0) {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          _remainingTime -= Duration(seconds: 1);
        });
        if (_remainingTime.inSeconds <= 0) {
          timer.cancel();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Persistent 24-Hour Countdown Timer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Remaining Time:',
            ),
            Text(
              '${_remainingTime.inHours.toString().padLeft(2, '0')}:${(_remainingTime.inMinutes % 60).toString().padLeft(2, '0')}:${(_remainingTime.inSeconds % 60).toString().padLeft(2, '0')}',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _startCountdown(
                  Duration(hours: 24)), // Start a 24-hour countdown
              child: Text('Start 24-Hour Countdown'),
            ),
          ],
        ),
      ),
    );
  }
}
