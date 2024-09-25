import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/bloc/Car_Check/car_check_bloc.dart';
import 'package:meechoke_project/bloc/Car_Power/car_power_bloc.dart';
import 'package:meechoke_project/bloc/Employee%20Monthly/employee_check_monthly_bloc.dart';
import 'package:meechoke_project/bloc/Financial/financial_bloc.dart';
import 'package:meechoke_project/bloc/Fuel/fuel_bloc.dart';
import 'package:meechoke_project/bloc/HistoryWork/history_work_bloc.dart';
import 'package:meechoke_project/bloc/Jobs/jobs_bloc.dart';
import 'package:meechoke_project/bloc/Profile/profile_bloc.dart';
import 'package:meechoke_project/bloc/ReportAccident/report_accident_bloc.dart';
import 'package:meechoke_project/bloc/login/login_bloc.dart';
import 'package:meechoke_project/screens/login_screen.dart';
import 'package:meechoke_project/screens/menu_screen_employee.dart';
import 'package:meechoke_project/screens/menu_screen_registered_driver.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';
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
//  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//     statusBarColor: Colors.white, // Background color
//     statusBarIconBrightness: Brightness.light, // Icon color
//     statusBarBrightness: Brightness.light, // For iOS
//   ));
void main() async {
  Intl.defaultLocale = 'th';
  initializeDateFormatting('th');
  GeolocatorPlatform.instance;
  WidgetsFlutterBinding.ensureInitialized();
  SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      Phoenix(
        child: StarterWidget(),
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
        BlocProvider(create: (context) => CarPowerBloc()),
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => ProfileBloc()),
        BlocProvider(create: (context) => JobsBloc()),
        BlocProvider(create: (context) => CarCheckBloc()),
        BlocProvider(create: (context) => FuelBloc()),
        BlocProvider(create: (context) => EmployeeCheckMonthlyBloc()),
        BlocProvider(create: (context) => FinancialBloc()),
        BlocProvider(create: (context) => HistoryWorkBloc()),
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
        home: StartPage(),
      ),
    );
  }
}

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
      {
        print('location permission granted');
      }
    } else {
      Fluttertoast.showToast(
          msg: "อนุญาติการเข้าถึงในภายหลังได้ที่ การตั้งค่าแอป",
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
    print('logintype: ' + prefs.getString('loginType').toString());
    await Future.delayed(const Duration(seconds: 2), () {
      if (tokenAuth == '' || tokenAuth == 'null') {
        Navigator.pushReplacement(
          context,
          PageTransition(
              duration: const Duration(milliseconds: 800),
              type: PageTransitionType.fade,
              child: Login_Screen()),
        );
      } 
      else {
        if (prefs.getString('loginType').toString() == 'employee') {
          Navigator.pushReplacement(
            context,
            PageTransition(
                duration: Duration(milliseconds: 800),
                type: PageTransitionType.fade,
                child: MainMenu_Employee()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            PageTransition(
                duration: Duration(milliseconds: 800),
                type: PageTransitionType.fade,
                child: MainMenu_RegisteredDriver()),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.thisBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Center(
            child: Text(
              'Meechoke Mobile',
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
