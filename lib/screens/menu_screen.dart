import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/screens/fuel%20screens/fuel_main.dart';
import 'package:meechoke_project/screens/history/history.dart';
import 'package:page_transition/page_transition.dart';

import 'Jobs/jobs_lists_main.dart';

class MainMenu_Page extends StatefulWidget {
  const MainMenu_Page({super.key});

  @override
  State<MainMenu_Page> createState() => _MainMenu_PageState();
}

class _MainMenu_PageState extends State<MainMenu_Page> {
  @override
  Widget build(BuildContext context) {
    //*
    var size = MediaQuery.of(context).size;
    final double h1 = (size.height - kToolbarHeight - 350) / 2;
    final double w1 = size.width / 2;
    final double h = (size.height - kToolbarHeight - 500) / 2;
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
                  height: MediaQuery.of(context).size.height * 0.22,
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
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
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
                    onTap: () {},
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
              SizedBox(
                height: 20,
              ),
              GridView.count(
                primary: false,
                childAspectRatio: (w1 / h1),
                shrinkWrap: true,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
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
                      // Navigator.push(
                      //   context,
                      //   PageTransition(
                      //       duration: const Duration(milliseconds: 500),
                      //       type: PageTransitionType.fade,
                      //       child: History_Page()),
                      // );
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
              SizedBox(
                height: 15,
              ),
              GridView.count(
                primary: false,
                childAspectRatio: (w / h),
                shrinkWrap: true,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      child: SvgPicture.asset(
                        'assets/images/main_menu/report.svg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
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
      barrierDismissible: false, // user must tap button!
      builder: (context) {
        return AlertDialog(
          content: Padding(
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
                        "ข้อมูล พขร.",
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
                      backgroundImage: AssetImage('assets/images/person.png'),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('ชื่อ-สกุล : ',
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      Text(
                        'ชวันธร 555',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 234, 127),
                                border: Border.all(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                              child: Column(
                                children: [
                                  Text(
                                    '175554',
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
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 234, 127),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 234, 127),
                                border: Border.all(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                              child: Column(
                                children: [
                                  Text(
                                    '175554',
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
                onPressed: () {
                  Navigator.pop(context);
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
      },
    );
  }
}
