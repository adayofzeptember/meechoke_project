// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/bloc/Jobs/jobs_bloc.dart';
import 'package:meechoke_project/screens/Allience%20%E0%B8%9E%E0%B8%B1%E0%B8%99%E0%B8%98%E0%B8%A1%E0%B8%B4%E0%B8%95%E0%B8%A3%E0%B8%A3%E0%B8%96%E0%B8%A3%E0%B9%88%E0%B8%A7%E0%B8%A1%20/Work%20Clarify/allWorks_clarify.dart';
import 'package:meechoke_project/screens/Allience%20%E0%B8%9E%E0%B8%B1%E0%B8%99%E0%B8%98%E0%B8%A1%E0%B8%B4%E0%B8%95%E0%B8%A3%E0%B8%A3%E0%B8%96%E0%B8%A3%E0%B9%88%E0%B8%A7%E0%B8%A1%20/Work%20Clarify/interestedWorks_clarify.dart';
import 'package:meechoke_project/screens/Allience%20%E0%B8%9E%E0%B8%B1%E0%B8%99%E0%B8%98%E0%B8%A1%E0%B8%B4%E0%B8%95%E0%B8%A3%E0%B8%A3%E0%B8%96%E0%B8%A3%E0%B9%88%E0%B8%A7%E0%B8%A1%20/menu_screen_allience.dart';
import 'package:page_transition/page_transition.dart';

class AllienceWorkClarify_Lists extends StatefulWidget {
  int? toCheck;
  AllienceWorkClarify_Lists({this.toCheck}) : super();
  @override
  _AllienceWorkClarify_ListsState createState() =>
      _AllienceWorkClarify_ListsState();
}

class _AllienceWorkClarify_ListsState extends State<AllienceWorkClarify_Lists>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    context.read<JobsBloc>().add(Load_NewJobs(context: context));
    context.read<JobsBloc>().add(Load_CurrentJobs());
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
          'ประกาศงาน',
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
                          text: 'งานทั้งหมด',
                        ),
                        Tab(
                          text: 'งานที่สนใจ',
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
                children: [Allience_All_Works(), Allience_Interested_Works()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
