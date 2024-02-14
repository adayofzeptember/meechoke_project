import 'package:flutter/material.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/screens/Report%20and%20Docs/new/docs_screen.dart';
import 'package:meechoke_project/screens/Report%20and%20Docs/new/report_screen.dart';

class ReportDocs_Main extends StatefulWidget {
  @override
  _ReportDocs_MainState createState() => _ReportDocs_MainState();
}

class _ReportDocs_MainState extends State<ReportDocs_Main>
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
          'แจ้งเหตุและข้อมูลกรมธรรม์',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 228, 237, 240),
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
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                  unselectedLabelColor: Colors.grey,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                      // gradient: LinearGradient(colors: [
                      //   Palette.thisBlue,
                      //   const Color.fromARGB(255, 214, 77, 77)
                      // ]),
                      borderRadius: BorderRadius.circular(40),
                      color: Palette.thisBlue),
                  tabs: const [
                    Tab(
                      text: 'ข้อมูลกรมธรรม์', 
                    ),
                    Tab(
                      text: 'แจ้งเหตุ',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [Docs_Screen(), Report_Screen()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
