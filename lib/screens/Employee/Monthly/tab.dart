import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/bloc/Employee%20Monthly/employee_check_monthly_bloc.dart';
import 'package:meechoke_project/screens/Employee/Monthly/checked.dart';
import 'package:meechoke_project/screens/Employee/Monthly/not.dart';

class Check_Montly extends StatefulWidget {
  @override
  _Check_MontlyState createState() => _Check_MontlyState();
}

class _Check_MontlyState extends State<Check_Montly>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    context.read<EmployeeCheckMonthlyBloc>().add(Load_All_MonthList());
    context.read<EmployeeCheckMonthlyBloc>().add(Load_Done_MonthList());

    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
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
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'ตรวจเช็ครถ',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 228, 237, 240),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
        child: Column(
          children: [
            Container(
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
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, fontFamily: 'Sarabun'),
                  unselectedLabelColor: Colors.grey,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Palette.thisBlue),
                  tabs: [
                    Tab(
                      text: 'ยังไม่ตรวจ',
                    ),
                    Tab(
                      text: 'ตรวจแล้ว',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Monthly_Not(),
                  Monthly_Checked(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
