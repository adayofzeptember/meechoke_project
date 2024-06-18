// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/bloc/Jobs/jobs_bloc.dart';
import 'package:meechoke_project/screens/Allience/Car%20Power/form_carPower.dart';
import 'package:meechoke_project/screens/Jobs/1.%20Main%20Pages%20List/new_list.dart';
import 'package:meechoke_project/screens/menu_screen_employee.dart';
import 'package:page_transition/page_transition.dart';

class CarPower_Tab extends StatefulWidget {
  int? toCheck;
  CarPower_Tab({this.toCheck}) : super();
  @override
  _CarPower_TabState createState() => _CarPower_TabState();
}

class _CarPower_TabState extends State<CarPower_Tab>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.thisBlue,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            if (widget.toCheck == 0 ||
                widget.toCheck == 'null' ||
                widget.toCheck == null) {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacement(
                context,
                PageTransition(
                    duration: const Duration(milliseconds: 500),
                    type: PageTransitionType.leftToRight,
                    child: MainMenu_Employee()),
              );
            }
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'แจ้งกำลังรถ',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 228, 237, 240),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
        child: Column(
          children: [
            BlocBuilder<JobsBloc, JobsState>(
              builder: (context, state) {
                return Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      40,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: TabBar(
                      controller: _tabController,
                      dividerColor: Colors.transparent,
                      indicatorColor: Colors.transparent,
                      labelColor: Colors.white,
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Sarabun',
                      ),
                      unselectedLabelColor: Colors.grey,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                          // gradient: LinearGradient(colors: [
                          //   Palette.thisBlue,
                          //   const Color.fromARGB(255, 214, 77, 77)
                          // ]),
                          borderRadius: BorderRadius.circular(40),
                          color: Palette.thisBlue),
                      tabs: [
                        Tab(
                          text: 'แจ้งกำลังรถ',
                        ),
                        Tab(
                          text: 'ประวัติการแจ้ง',
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 5,
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [CarPower_Form(), NewJobs_Screen()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
