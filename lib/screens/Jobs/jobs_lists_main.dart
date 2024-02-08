import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/screens/Jobs/newJob_details.dart';
import 'package:page_transition/page_transition.dart';
import 'Job Processing/job_accepted_detail_2.dart';
 
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
                      text: 'กำลังดำเนินการ',
                    ),
                    Tab(
                      text: 'งานใหม่',
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
                children: [
                  //! first tab bar view widget
                  onGoingJobWidget(context),

                  //! second tab bar view widget
                  newJobsWidget(context)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget newJobsWidget(context) {
  
  return 
  
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
              duration: const Duration(milliseconds: 500),
              type: PageTransitionType.fade,
              child: Job_Details()),
        );
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/icon_job.svg',
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Text(
                    '10 พ.ย. 2565 08:00 - 11 พ.ย. 2565 15:00',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                SvgPicture.asset(
                  'assets/images/job_card.svg',
                  width: MediaQuery.of(context).size.width,
                ),
                Positioned(
                  top: 10,
                  left: 25,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'JO65/47416',
                                style: TextStyle(
                                    color: Palette.thisBlue,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 114, 57, 234),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: const Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(12, 8, 12, 8),
                                  child: SizedBox(
                                    width: 120,
                                    child: Text(
                                      'ยังไม่รับงาน',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DottedLine(
                            dashGradient: const [
                              Colors.red,
                              Colors.blue,
                            ],
                            dashLength: 10,
                            lineThickness: 2,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/allpoints.svg',
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            const Text('จุดรับ'),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              decoration: const BoxDecoration(
                                                  color: Palette.thisBlue,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: const Padding(
                                                padding:
                                                    EdgeInsets.fromLTRB(
                                                        3, 3, 3, 3),
                                                child: Text(
                                                  '10 พ.ย. 2023 - 08:00',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Text(
                                      'โรงน้ำตาลครบุรี อ.ครบุรี จ.นครราชสีมา',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.blue,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.04,
                                    ),
                                    Row(
                                      children: [
                                        const Text('จุดส่ง'),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(
                                              color: Palette.thisBlue,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          child: const Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                3, 3, 3, 3),
                                            child: Text(
                                              '10 พ.ย. 2023 - 08:00',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      'โรงน้ำตาลครบุรี อ.ครบุรี จ.นครราชสีมา',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.blue,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
//? on going

Widget onGoingJobWidget(context) {
  return SingleChildScrollView(
    physics: const ClampingScrollPhysics(),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              print('object');
            },
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/icon_job.svg',
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const Text(
                          '10 พ.ย. 2565 08:00 - 11 พ.ย. 2565 15:00',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      SvgPicture.asset(
                        'assets/images/job_card.svg',
                        width: MediaQuery.of(context).size.width,
                      ),
                      Positioned(
                        top: 10,
                        left: 25,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'JO65/47416',
                                      style: TextStyle(
                                          color: Palette.thisBlue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: const Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            12, 8, 12, 8),
                                        child: SizedBox(
                                          width: 120,
                                          child: Text(
                                            'กำลังดำเนินงาน',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                DottedLine(
                                  dashGradient: const [
                                    Colors.red,
                                    Colors.blue,
                                  ],
                                  dashLength: 10,
                                  lineThickness: 2,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/allpoints.svg',
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const Text('จุดรับ'),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                decoration: const BoxDecoration(
                                                    color: Palette.thisBlue,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20))),
                                                child: const Padding(
                                                  padding:
                                                      EdgeInsets.fromLTRB(
                                                          3, 3, 3, 3),
                                                  child: Text(
                                                    '10 พ.ย. 2023 - 08:00',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Text(
                                            'โรงน้ำตาลครบุรี อ.ครบุรี จ.นครราชสีมา',
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor: Colors.blue,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                          ),
                                          Row(
                                            children: [
                                              const Text('จุดส่ง'),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                decoration: const BoxDecoration(
                                                    color: Palette.thisBlue,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20))),
                                                child: const Padding(
                                                  padding:
                                                      EdgeInsets.fromLTRB(
                                                          3, 3, 3, 3),
                                                  child: Text(
                                                    '10 พ.ย. 2023 - 08:00',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text(
                                            'โรงน้ำตาลครบุรี อ.ครบุรี จ.นครราชสีมา',
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor: Colors.blue,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Container(
                  //   height: 200,
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(

                  //     image: DecorationImage(
                  //       image: AssetImage("assets/images/job.png"),
                  //       fit: BoxFit.fill,
                  //     ),
                  //   ),
                  //   child: Column(children: [Text('data')],) /* add child content here */,
                  // ),
                ],
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
                    child: Job_WorkAccepted()),
              );
            },
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/icon_job.svg',
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const Text(
                          '10 พ.ย. 2565 08:00 - 11 พ.ย. 2565 15:00',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      SvgPicture.asset(
                        'assets/images/job_card.svg',
                        width: MediaQuery.of(context).size.width,
                      ),
                      Positioned(
                        top: 10,
                        left: 25,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'JO65/47416',
                                      style: TextStyle(
                                          color: Palette.thisBlue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: const Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            12, 8, 12, 8),
                                        child: SizedBox(
                                          width: 120,
                                          child: Text(
                                            'รับงานแล้ว',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                DottedLine(
                                  dashGradient: const [
                                    Colors.red,
                                    Colors.blue,
                                  ],
                                  dashLength: 10,
                                  lineThickness: 2,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/allpoints.svg',
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const Text('จุดรับ'),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                decoration: const BoxDecoration(
                                                    color: Palette.thisBlue,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20))),
                                                child: const Padding(
                                                  padding:
                                                      EdgeInsets.fromLTRB(
                                                          3, 3, 3, 3),
                                                  child: Text(
                                                    '10 พ.ย. 2023 - 08:00',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Text(
                                            'โรงน้ำตาลครบุรี อ.ครบุรี จ.นครราชสีมา',
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor: Colors.blue,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                          ),
                                          Row(
                                            children: [
                                              const Text('จุดส่ง'),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                decoration: const BoxDecoration(
                                                    color: Palette.thisBlue,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20))),
                                                child: const Padding(
                                                  padding:
                                                      EdgeInsets.fromLTRB(
                                                          3, 3, 3, 3),
                                                  child: Text(
                                                    '10 พ.ย. 2023 - 08:00',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text(
                                            'โรงน้ำตาลครบุรี อ.ครบุรี จ.นครราชสีมา',
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor: Colors.blue,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
