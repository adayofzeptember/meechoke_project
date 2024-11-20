import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/bloc/Car_Check/car_check_bloc.dart';
import 'package:meechoke_project/bloc/Financial/financial_bloc.dart';
import 'package:meechoke_project/bloc/Fuel/fuel_bloc.dart';
import 'package:meechoke_project/bloc/Jobs/jobs_bloc.dart';
import 'package:meechoke_project/bloc/Profile/profile_bloc.dart';
import 'package:meechoke_project/screens/Register%20Driver/Checking/Checking_Main.dart';
import 'package:meechoke_project/screens/Register%20Driver/Fuel/Main%20List/fuel_main_list.dart';
import 'package:meechoke_project/screens/Register%20Driver/Jobs/1.%20Main%20Pages%20List/tab_main.dart';
import 'package:meechoke_project/screens/Register%20Driver/Financial/financial_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../bloc/ReportAccident/report_accident_bloc.dart';
import 'Report and Docs/tab_mainScreen.dart';
import 'Work History/history_screen.dart';

class MainMenu_RegisteredDriver extends StatefulWidget {
  const MainMenu_RegisteredDriver({super.key});

  @override
  State<MainMenu_RegisteredDriver> createState() =>
      _MainMenu_RegisteredDriverState();
}

class _MainMenu_RegisteredDriverState extends State<MainMenu_RegisteredDriver> {
  @override
  void initState() {
    context.read<ProfileBloc>().add(Load_Profile());
    context.read<JobsBloc>().add(Load_NewJobs(context: context));
    context.read<JobsBloc>().add(Load_CurrentJobs());
    context.read<FuelBloc>().add(Load_FuelNotYet());
    context.read<FuelBloc>().add(Load_Filled());
    context.read<FinancialBloc>().add(Load_Financial());
    super.initState();
  }

  Widget build(BuildContext context) {
    //*
    var size = MediaQuery.of(context).size;
    final double h2 = (size.height - kToolbarHeight - 420) / 2;
    final double w2 = size.width / 2;
    // final double h1 = (size.height - kToolbarHeight - 370) / 2;
    // final double w1 = size.width / 2;
    final double h = (size.height - kToolbarHeight - 520) / 2;
    final double w = size.width / 2;
    //*
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showProfile(context);
            },
            icon: CircleAvatar(
                backgroundColor: Palette.thisBlue,
                child: Image.asset(
                  'assets/images/oct.png',
                  color: Colors.white,
                  height: 30,
                )),
          ),
        ],
        title: Text(
          'พนักงานบริการลูกค้า',
          style:
              TextStyle(color: Palette.thisBlue, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        duration: const Duration(milliseconds: 500),
                        type: PageTransitionType.fade,
                        child: Job_Lists()),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                    child: SvgPicture.asset(
                      'assets/images/main_menu/works.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              GridView.count(
                primary: false,
                childAspectRatio: (w2 / h2),
                shrinkWrap: true,
                // crossAxisSpacing: 20,
                // mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                            duration: const Duration(milliseconds: 500),
                            type: PageTransitionType.fade,
                            child: Fuel_Lists()),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      child: SvgPicture.asset(
                        'assets/images/main_menu/fuel.svg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      //           ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                      //   content: Text("ฟังก์ชันยังไม่พร้อมใช้งาน"),
                      // ));

                      context.read<CarCheckBloc>().add(Empty_Check());

                      Navigator.push(
                        context,
                        PageTransition(
                            duration: const Duration(milliseconds: 500),
                            type: PageTransitionType.fade,
                            child: Check_Daily()),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      child: SvgPicture.asset(
                        'assets/images/main_menu/car_check.svg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
              //20/10
              GridView.count(
                primary: false,
                childAspectRatio: (w2 / h2),
                shrinkWrap: true,
                // crossAxisSpacing: 20,
                // mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  InkWell(
                    onTap: () async {
                      // SharedPreferences prefrences =
                      //     await SharedPreferences.getInstance();
                      // prefrences.clear();
                      // Phoenix.rebirth(context);
                      Navigator.push(
                        context,
                        PageTransition(
                            duration: const Duration(milliseconds: 500),
                            type: PageTransitionType.fade,
                            child: History_Page()),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      child: SvgPicture.asset(
                        'assets/images/main_menu/work_history.svg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                            duration: const Duration(milliseconds: 500),
                            type: PageTransitionType.fade,
                            child: Financial_List()),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      child: SvgPicture.asset(
                        'assets/images/main_menu/financial_history.svg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
              GridView.count(
                primary: false,
                childAspectRatio: (w / h),
                shrinkWrap: true,
                // crossAxisSpacing: 20,
                // mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      context
                          .read<ReportAccidentBloc>()
                          .add(Load_VehicleDocs());

                      Navigator.push(
                        context,
                        PageTransition(
                            duration: const Duration(milliseconds: 500),
                            type: PageTransitionType.fade,
                            child: ReportDocs_Main()),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      child: SvgPicture.asset(
                        'assets/images/main_menu/report.svg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      // SharedPreferences prefrences =
                      //     await SharedPreferences.getInstance();
                      // prefrences.clear();
                      // Phoenix.rebirth(context);ง
                      // double x = 40.6892;
                      // double y = -74.0445;
                      // final Uri url = Uri.parse(
                      //     'https://www.google.com/maps/search/?api=1&query=${x},${y}');
                      // if (!await launchUrl(url)) {
                      //   throw Exception('Could not launch $url');
                      // }

                      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //   content: Text("ฟังก์ชันยังไม่พร้อมใช้งาน"),
                      // ));
                    },
                    child: Container(
                      width: double.infinity,
                      child: SvgPicture.asset(
                        'assets/images/main_menu/maintainance.svg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future showProfile(var context) async {
    return showDialog(
      context: context,
      barrierDismissible: true, //* user must tap button!
      builder: (context) {
        return AlertDialog(
          content: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
            child: SingleChildScrollView(
              child: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state.loading == true) {
                    return Center(
                      child: CircularProgressIndicator(color: Colors.red),
                    );
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(Icons.close))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 58,
                          backgroundImage:
                              AssetImage('assets/images/person.png'),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state.profile_data.name,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 49, 48, 48),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text(
                            'ทะเบียนแม่',
                            style: TextStyle(
                                color: Color.fromARGB(255, 131, 131, 131),
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 255, 234, 127),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 255, 234, 127),
                                    border: Border.all(color: Colors.black),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15))),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 8, 15, 8),
                                  child: Column(
                                    children: [
                                      Text(
                                        state.profile_data.plateNumber,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Text(state.profile_data.province),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text(
                            'ทะเบียนลูก',
                            style: TextStyle(
                                color: Color.fromARGB(255, 131, 131, 131),
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 255, 234, 127),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 255, 234, 127),
                                    border: Border.all(color: Colors.black),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15))),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 8, 15, 8),
                                  child: Column(
                                    children: [
                                      Text(
                                        state.profile_data.trailerPlateNumber,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Text(state.profile_data.province),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          actions: <Widget>[
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 234, 240, 255),
                    elevation: 0,
                    side: const BorderSide(color: Palette.thisBlue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                onPressed: () async {
                  logoutAlert(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.logout,
                          color: Palette.thisBlue,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "ออกจากระบบ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Palette.thisBlue,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  //?
  Future<void> logoutAlert(
    var context,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'ต้องการออกจากระบบหรือไม่?',
            style: TextStyle(
                color: Palette.thisBlue,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor:
                    const Color.fromARGB(255, 235, 116, 108), // Splash color
              ),
              child: const Text(
                'ยกเลิก',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor:
                    const Color.fromARGB(255, 138, 206, 140), // Splash color
              ),
              child: const Text(
                'ยืนยัน',
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();

                prefs.clear();
                Phoenix.rebirth(context);
                // context.read<LoginBloc>().add(Logout_Auth(context: context));
              },
            ),
          ],
        );
      },
    );
  }
}
