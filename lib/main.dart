import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/bloc/Profile/profile_bloc.dart';
import 'package:meechoke_project/bloc/ReportAccident/report_accident_bloc.dart';
import 'package:meechoke_project/bloc/login/login_bloc.dart';
import 'package:meechoke_project/screens/login_screen.dart';
import 'package:meechoke_project/screens/menu_screen_employee.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

// gradient: LinearGradient(colors: [
//                     Palette.thisBlue,
//                     const Color.fromARGB(255, 214, 77, 77)
//                   ]),

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
  Intl.defaultLocale = 'th';
  GeolocatorPlatform.instance;
  WidgetsFlutterBinding.ensureInitialized();
  const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      Phoenix(
        child: const StarterWidget(),
      ),
    ),
  );
}

class StarterWidget extends StatelessWidget {
  const StarterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => ProfileBloc()),
        BlocProvider(create: (context) => ReportAccidentBloc()),
 
      ],
      child: MaterialApp(
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
      ),
    );
  }
}

//!--- stateful starts here ----

class StartPage extends StatefulWidget {
  const StartPage({super.key});
  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    _Permission();
    _Pause_And_Go();
    super.initState();
  }

  Future<void> _Permission() async {
    var status = await Permission.location.request();
    if (status == PermissionStatus.granted) {
    } else {
      Fluttertoast.showToast(
          msg: "ตั้งอนุญาติการให้แอปเข้าถึงตำแหน่งพื้นที่ได้ที่การตั้งค่าแอป",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 2,
          backgroundColor: const Color.fromARGB(255, 133, 133, 133),
          textColor: Colors.white,
          fontSize: 15);
    }
  }

  Future<void> _Pause_And_Go() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tokenAuth = prefs.getString('userToken').toString();
    print('stored token: ' + tokenAuth);

    await Future.delayed(const Duration(seconds: 2), () {
      if (tokenAuth == '' || tokenAuth == 'null') {
        Navigator.pushReplacement(
          context,
          PageTransition(
              duration: const Duration(milliseconds: 800),
              type: PageTransitionType.fade,
              child: Login_Screen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          PageTransition(
              duration: const Duration(milliseconds: 800),
              type: PageTransitionType.fade,
              child: const MainMenu_Employee()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Palette.thisBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        //crossAxisAlignmen อออ ัด้ด ใt: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Center(
            child: Text(
              'Meechoke MS',
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
