import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/bloc/Fuel/fuel_bloc.dart';
import 'package:meechoke_project/screens/Register%20Driver/Fuel/Main%20List/fuel_done.dart';
import 'package:meechoke_project/screens/Register%20Driver/Fuel/Main%20List/fuel_not.dart';

class Fuel_Lists extends StatefulWidget {
  @override
  _Fuel_ListsState createState() => _Fuel_ListsState();
}

class _Fuel_ListsState extends State<Fuel_Lists> with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _animationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    super.initState();
    super.initState();
  }

  void _handleRefresh() {
    _animationController.repeat();
    Future.delayed(Duration(milliseconds: 500), () {
      _animationController.stop();
    });
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
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.circular(30),
        //   ),
        // ),
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
        actions: [
          RotationTransition(
            turns: _animation,
            child: IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.white,
                size: MediaQuery.of(context).size.height * 0.04,
              ),
              onPressed: () {
                _handleRefresh();
                context.read<FuelBloc>().add(Load_FuelNotYet());
                context.read<FuelBloc>().add(Load_Filled());
              },
            ),
          ),
        ],
        title: const Text(
          'เติมเชื้อเพลิง',
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

                      // gradient: LinearGradient(colors: [
                      //   const Color.fromARGB(255, 226, 62, 62),
                      //   Color.fromARGB(255, 219, 194, 48)
                      // ]),
                      borderRadius: BorderRadius.circular(40),
                      color: Palette.thisBlue),
                  tabs: [
                    Tab(
                      text: 'ยังไม่ได้เติม',
                    ),
                    Tab(
                      text: 'เติมแล้ว',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Fuel_NotDone(),
                  Fuel_Filled(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
