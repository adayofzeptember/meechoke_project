import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/ETC/Main%20List/waitList.dart';

class Check_Lists extends StatefulWidget {
  @override
  _Check_ListsState createState() => _Check_ListsState();
}

class _Check_ListsState extends State<Check_Lists>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
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

                      // gradient: LinearGradient(colors: [
                      //   const Color.fromARGB(255, 226, 62, 62),
                      //   Color.fromARGB(255, 219, 194, 48)
                      // ]),
                      borderRadius: BorderRadius.circular(40),
                      color: Palette.thisBlue),
                  tabs: [
                    Tab(
                      text: 'รอตรวจเช็ค',
                    ),
                    Tab(
                      text: 'ตรวจเช็คแล้ว',
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
                  Check_Wait(),
                  Check_Wait(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
