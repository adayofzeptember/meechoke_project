import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/bloc/Jobs/jobs_bloc.dart';

import 'currentJob_screen.dart';
import 'newJobs_screen.dart';

class Job_Lists extends StatefulWidget {
  @override
  _Job_ListsState createState() => _Job_ListsState();
}

class _Job_ListsState extends State<Job_Lists>
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
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
          'งาน',
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
                          text: 'กำลังดำเนินการ',
                        ),
                        Tab(
                          text: 'งานใหม่ (${state.newjobs_list.length})',
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
                children: [
                  //! first tab bar view widget
                  CurrentJobs_Screen(),

                  //! second tab bar view widget
                  NewJobs_Screen()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
