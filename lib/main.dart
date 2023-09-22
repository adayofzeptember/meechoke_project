import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/screens/login_screen.dart';
import 'package:meechoke_project/test/noti.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_framework/responsive_framework.dart';

// MediaQuery.of(context).size.width * 0.04
//  Navigator.push(
//           context,
//           PageTransition(
//               duration: const Duration
// (milliseconds: 500),
//               type: PageTransitionType.fade,
//               child: Job_OnGoing()),
//         );

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init();
  const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  runApp(const StarterWidget());
}

class StarterWidget extends StatelessWidget {
  const StarterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
        ],
      ),
      initialRoute: "/",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Palette.thisBlue),
        useMaterial3: true,
        fontFamily: 'Sarabun',
      ),
      home: const StartPage(),
    );
  }
}

//! ---stateful starts here----

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    _Pause_And_Go();
    super.initState();
  }

  Future<void> _Pause_And_Go() async {
    
    await Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        PageTransition(
            duration: const Duration(milliseconds: 800),
            type: PageTransitionType.fade,
            child: Login_Screen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.thisBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Center(
            child: const Text(
              'Meechoke',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
