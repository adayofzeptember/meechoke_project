// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/screens/Allience/Allience%20Jobs/allience_jobs_confirm.dart';
import 'package:meechoke_project/screens/Allience/Allience%20Jobs/allience_jobs_list.dart';
import 'package:meechoke_project/screens/Allience/menu_screen_allience.dart';
import 'package:page_transition/page_transition.dart';

class AllienceJob_Lists extends StatefulWidget {
  int? toCheck;
  AllienceJob_Lists({this.toCheck}) : super();
  @override
  _AllienceJob_ListsState createState() => _AllienceJob_ListsState();
}

class _AllienceJob_ListsState extends State<AllienceJob_Lists>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    _animationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);

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
    _animationController.dispose();
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
                // context.read<JobsBloc>().add(Load_NewJobs(context: context));
                // context.read<JobsBloc>().add(Load_CurrentJobs());
              },
            ),
          ),
        ],
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
                    child: MainMenu_Allience()),
              );
            }
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
                      text: 'รับงาน',
                    ),
                    Tab(
                      text: 'ยืนยันงาน',
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
                children: [Allience_Jobs_List(), Allience_Jobs_Confirm()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
