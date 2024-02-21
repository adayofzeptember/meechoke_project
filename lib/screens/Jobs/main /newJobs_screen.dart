import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import '../../../bloc/Jobs/jobs_bloc.dart';

class NewJobs_Screen extends StatelessWidget {
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
                if (state.status == 0)
                  return Center(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      CircularProgressIndicator(),
                    ],
                  ));
                else if (state.status == 2) {
                  return GestureDetector(
                    onTap: () {
                      context.read<JobsBloc>().add(Load_NewJobs());
                    },
                    child: Center(
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
                    )),
                  );
                } else if (state.status == 1 && state.newjobs_list.isEmpty) {
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
                        'ยังไม่มีงานใหม่ในขณะนี้',
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
                  itemCount: state.newjobs_list.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print('JO number: ' +
                            state.newjobs_list[index].jobNumber.toString());
                        context.read<JobsBloc>().add(Load_NewJob_Info(
                            context: context,
                            joNumber: state.newjobs_list[index].jobNumber
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
                                    state.newjobs_list[index].pickupDate
                                        .toString(),
                                    //+" " + state.newjobs_list[index].dropDate.toString()
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                                                state.newjobs_list[index]
                                                    .jobNumber
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Palette.thisBlue,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Container(
                                                decoration: const BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 193, 193, 193),
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
                                                      state.newjobs_list[index]
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
                                                                  '[ ${state.newjobs_list[index].pickupDate.toString()} ]',
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
                                                      state.newjobs_list[index]
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
                                                              '[ ${state.newjobs_list[index].dropDate.toString()} ]',
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
                                                      state.newjobs_list[index]
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
