import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/bloc/Profile/profile_bloc.dart';
import 'package:meechoke_project/screens/Checking/check_daily.dart';
import 'package:meechoke_project/screens/Fuel/fuel_main.dart';
import 'package:meechoke_project/screens/History/history.dart';
import 'package:meechoke_project/screens/Report/accident.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Jobs/jobs_lists_main.dart';
import 'Financial/financial.dart';

class MainMenu_Page extends StatefulWidget {
  const MainMenu_Page({super.key});

  @override
  State<MainMenu_Page> createState() => _MainMenu_PageState();
}

class _MainMenu_PageState extends State<MainMenu_Page> {
  @override
  void initState() {
    context.read<ProfileBloc>().add(Load_Profile());
    super.initState();
  }
  

  Widget build(BuildContext context) {
    //*
    var size = MediaQuery.of(context).size;
    final double h1 = (size.height - kToolbarHeight - 370) / 2;
    final double w1 = size.width / 2;
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
              child: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
        ],
        title: const Text(
          'MEECHOKE',
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
                childAspectRatio: (w1 / h1),
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
                    onTap: () {
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
                childAspectRatio: (w1 / h1),
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
              // SizedBox(
              //   height: 15,
              // ),
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
                      Navigator.push(
                        context,
                        PageTransition(
                            duration: const Duration(milliseconds: 500),
                            type: PageTransitionType.fade,
                            child: Report_Accident()),
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
                    onTap: () {
                      //        Navigator.push(
                      //   context,
                      //   PageTransition(
                      //       duration: const Duration(milliseconds: 500),
                      //       type: PageTransitionType.fade,
                      //       child: Report_Accident()),
                      // );
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
      barrierDismissible: true, // user must tap button!
      builder: (context) {
        return BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state.loading == true) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.red),
              );
            } else {
              return AlertDialog(
                content: Stack(
                  children: [
                    Positioned(
                        top: -5,
                        left: 240,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.close))),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(),
                                Text(
                                  "พขร. ID: ${state.profile_data.id}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Palette.thisBlue),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 58,
                                backgroundImage:
                                    AssetImage('assets/images/person.png'),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  state.profile_data.name.toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 49, 48, 48),
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 234, 127),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 255, 234, 127),
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 8, 15, 8),
                                        child: Column(
                                          children: [
                                            Text(
                                              '899599',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text('ทะเบียนแม่'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 234, 127),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 255, 234, 127),
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 8, 15, 8),
                                        child: Column(
                                          children: [
                                            Text(
                                              '98858',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text('ทะเบียนลูก'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                actions: <Widget>[
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 234, 240, 255),
                          elevation: 0,
                          side: BorderSide(color: Palette.thisBlue),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      onPressed: () async {
                        // SharedPreferences prefrences =
                        //     await SharedPreferences.getInstance();
                        // prefrences.clear();
                        // Phoenix.rebirth(context);
                        logoutAlert(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Row(
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
                              const Text(
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
            }
          },
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
                    Color.fromARGB(255, 235, 116, 108), // Splash color
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
                //!context.read<LoginBloc>().add(Logout_Auth(context: context));
                SharedPreferences prefrences = await SharedPreferences.getInstance();
                prefrences.clear();
                Phoenix.rebirth(context);
              },
            ),
          ],
        );
      },
    );
  }
}
