import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/ETC/curency.dart';

import 'package:meechoke_project/bloc/ReportAccident/report_accident_bloc.dart';

class Docs_Screen extends StatefulWidget {
  @override
  _Docs_ScreenState createState() => _Docs_ScreenState();
}

class _Docs_ScreenState extends State<Docs_Screen> {
  @override
  void initState() {
    super.initState();
  }

  var reportRemark_Controller = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 228, 237, 240),
        body: RawScrollbar(
          thickness: 5,
          thumbColor: Palette.thisBlue,
          radius: Radius.circular(20),
          child: SingleChildScrollView(
            child: BlocBuilder<ReportAccidentBloc, ReportAccidentState>(
                builder: (context, state) {
              return Column(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        if (state.vehicle_Docs.isEmpty)
                          Column(
                            children: [
                              SvgPicture.asset(
                                'assets/images/nojob.svg',
                              ),
                              Center(
                                  child: Text(
                                'ไม่พบข้อมูลกรมธรรม์',
                                style: TextStyle(
                                    fontSize: 18,
                                    color:
                                        const Color.fromARGB(255, 62, 62, 62)),
                              )),
                            ],
                          )
                        else
                          ListView.builder(
                            primary: true,
                            itemCount: state.vehicle_Docs.length,
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 205, 229, 255),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(25),
                                                topRight: Radius.circular(25))),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8, bottom: 8),
                                          child: Center(
                                            child: Text(
                                              state.vehicle_Docs[index].docType
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Palette.thisBlue,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 15, 20, 15),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  child: Text(
                                                    'บริษัท:',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color.fromARGB(
                                                          255, 66, 66, 66),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  state.vehicle_Docs[index]
                                                      .company
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color.fromARGB(
                                                          255, 66, 66, 66),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  child: Text(
                                                    'เลขที่กรมธรรม์:',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color.fromARGB(
                                                          255, 66, 66, 66),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  state.vehicle_Docs[index]
                                                      .docNumber
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color.fromARGB(
                                                          255, 66, 66, 66),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  child: Text(
                                                    'เบอร์โทรติดต่อ:',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color.fromARGB(
                                                          255, 66, 66, 66),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  state.vehicle_Docs[index]
                                                      .contact
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color.fromARGB(
                                                          255, 66, 66, 66),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment: 
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  child: Text(
                                                    'วงเงิน:',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color.fromARGB(
                                                          255, 66, 66, 66),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  formatNumber(state
                                                          .vehicle_Docs[index]
                                                          .creditLimit
                                                          .toString()) +
                                                      ' บาท',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color.fromARGB(
                                                          255, 66, 66, 66),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        const SizedBox(
                          height: 20,
                        ),
                      ]),
                ),
              ]);
            }),
          ),
        ));
  }
}
