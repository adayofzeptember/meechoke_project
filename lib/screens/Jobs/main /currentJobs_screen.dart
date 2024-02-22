import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/bloc/Jobs/jobs_bloc.dart';

class CurrentJobs_Screen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 228, 237, 240),
        body: RawScrollbar(
          thickness: 3,
          thumbColor: Palette.thisBlue,
          radius: Radius.circular(20),
          child: SingleChildScrollView(
            child: BlocBuilder<JobsBloc, JobsState>(
              builder: (context, state) {
                if (state.status2 == 0)
                  return Center(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      CircularProgressIndicator(),
                    ],
                  ));
                else if (state.status2 == 2) {
                  return Center(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'เกิดข้อผิดพลาด',
                        style: TextStyle(
                            color: Palette.someRed,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  ));
                } else if (state.status2 == 1 &&
                    state.currentjobs_list.isEmpty) {
                  return Center(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      SvgPicture.asset(
                        'assets/images/nojob.svg',
                      ),
                      Text(
                        'ไม่มีงานที่กำลังดำเนินงานในขณะนี้',
                        style: TextStyle(
                            color: Palette.thisBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  ));
                }
                //?  โหลดได้ปกติ
                return ListView.builder(
                  primary: true,
                  itemCount: state.currentjobs_list.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print('JO number: ' +
                            state.currentjobs_list[index].jobNumber.toString());
                        context.read<JobsBloc>().add(Load_NewJob_Info(
                            checkPage: 'current_job',
                            context: context,
                            joNumber: state.currentjobs_list[index].jobNumber
                                .toString()));
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
                                  Text(
                                    state.currentjobs_list[index].pickupDate
                                        .toString(),
                                    //+" " + state.currentjobs_list[index].dropDate.toString()
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 5),
                                  if (state.currentjobs_list[index].jobStatus
                                          .toString() ==
                                      'รับงานแล้ว')
                                    Text('')
                                  else if (state
                                          .currentjobs_list[index].jobStatus
                                          .toString() ==
                                      'กำลังดำเนินการ')
                                    Text(
                                      'ออกรถแล้ว',
                                      style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                                    )
                                  else
                                    Text('')
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 15, 10, 15),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                state.currentjobs_list[index]
                                                    .jobNumber
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Palette.thisBlue,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: (state
                                                                .currentjobs_list[
                                                                    index]
                                                                .jobStatus
                                                                .toString() ==
                                                            'รับงานแล้ว')
                                                        ? Palette.thisBlue
                                                        : Colors.green,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20))),
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      12, 8, 12, 8),
                                                  child: SizedBox(
                                                    width: 120,
                                                    child: Text(
                                                      state
                                                          .currentjobs_list[
                                                              index]
                                                          .jobStatus
                                                          .toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
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
                                                        Row(
                                                          children: [
                                                            const Text(
                                                              'จุดรับ',
                                                              style: TextStyle(
                                                                  color: Palette
                                                                      .thisBlue,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            Container(
                                                              // decoration: const BoxDecoration(
                                                              //     color: Palette
                                                              //         .thisBlue,
                                                              //     borderRadius: BorderRadius
                                                              //         .all(Radius
                                                              //             .circular(
                                                              //                 20))),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            3,
                                                                            3,
                                                                            3,
                                                                            3),
                                                                child: Text(
                                                                  '[ ${state.currentjobs_list[index].pickupDate.toString()} ]',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          133,
                                                                          133,
                                                                          133),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      state
                                                          .currentjobs_list[
                                                              index]
                                                          .pickupPoint,
                                                      style: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          decorationColor:
                                                              Colors.blue,
                                                          color: Colors.blue,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.04,
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Text(
                                                          'จุดส่ง',
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .thisBlue,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          // decoration: const BoxDecoration(
                                                          //     color: Palette
                                                          //         .thisBlue,
                                                          //     borderRadius:
                                                          //         BorderRadius
                                                          //             .all(Radius
                                                          //                 .circular(
                                                          //                     20))),
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(
                                                                    3, 3, 3, 3),
                                                            child: Text(
                                                              '[ ${state.currentjobs_list[index].dropDate.toString()} ]',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          133,
                                                                          133,
                                                                          133),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      state
                                                          .currentjobs_list[
                                                              index]
                                                          .dropPoint,
                                                      style: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          decorationColor:
                                                              Colors.blue,
                                                          color: Colors.blue,
                                                          fontWeight:
                                                              FontWeight.bold),
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
                    );
                  },
                );
              },
            ),
          ),
        ));
  }
}
