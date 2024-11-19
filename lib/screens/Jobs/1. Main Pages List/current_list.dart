import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/ETC/meetingTime_converter.dart';
import 'package:meechoke_project/bloc/Jobs/jobs_bloc.dart';

class CurrentJobs_Screen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 228, 237, 240),
        body: RawScrollbar(
          thickness: 8,
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
                  return GestureDetector(
                    onTap: () {
                      context
                          .read<JobsBloc>()
                          .add(Load_NewJobs(context: context));
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
                } else if (state.status2 == 1 &&
                    state.currentjobs_list.length == 0) {
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
                        'ไม่มีงานปัจจุบัน',
                        style: TextStyle(
                            color: Palette.thisBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  ));
                }
                //?  โหลดได้ปกติ
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: ListView.builder(
                    primary: true,
                    itemCount: state.currentjobs_list.length,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      // Map<String, String> result = convertToThaiDate(state
                      //     .currentjobs_list[index].checkin_location[0].date);
                      // DateTime dateTime = DateTime.parse(state
                      //     .currentjobs_list[index].checkin_location[0].date);
                      // String formattedDate =
                      //     ThaiDateFormat('d MMMM y', 'th').format(dateTime);
                      Map<String, String> result = convertToThaiDateTime(
                          state.currentjobs_list[index].first.toString());

                      Map<String, String> result2 = convertToThaiDateTime(
                          state.currentjobs_list[index].last.toString());
                      return GestureDetector(
                        onTap: () {
                          print('JO number: ' +
                              state.currentjobs_list[index].jobNumber
                                  .toString());
                          context.read<JobsBloc>().add(Load_Job_Info(
                              checkPage: 'cuurent_job',
                              context: context,
                              joNumber: state.currentjobs_list[index].jobNumber
                                  .toString()));

                          context.read<JobsBloc>().add(Get_Allowance(
                              context: context,
                              getJONumber: state
                                  .currentjobs_list[index].jobNumber
                                  .toString()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/icon_job.svg',
                                      fit: BoxFit.contain,
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      "${result['thaiDate']}" +
                                          " - " +
                                          "${result2['thaiDate']}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
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
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            (state.currentjobs_list[index]
                                                        .currentStatus ==
                                                    'เสร็จงาน')
                                                ? Container(
                                                    decoration: const BoxDecoration(
                                                        color: Palette.theGreen,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20))),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              15, 8, 15, 8),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            child: Text(
                                                              'งานเสร็จสิ้นแล้ว',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons.check,
                                                            color: Colors.white,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : Container(
                                                    decoration: const BoxDecoration(
                                                        color: Palette.thisBlue,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20))),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
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
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
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
                                          dashColor: Palette.thisBlue,
                                          // dashGradient: const [
                                          //   Palette.thisBlue,
                                          //   Palette.someRed
                                          // ],
                                          dashLength: 10,
                                          lineThickness: 1,
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        (state.currentjobs_list[index]
                                                    .checkin_location.length !=
                                                0)
                                            ? ListView.builder(
                                                primary: true,
                                                itemCount: state
                                                    .currentjobs_list[index]
                                                    .checkin_location
                                                    .length,
                                                shrinkWrap: true,
                                                physics:
                                                    const ClampingScrollPhysics(),
                                                itemBuilder: (context, index2) {
                                                  Map<String, String> result =
                                                      convertToThaiDateTime(
                                                          state
                                                              .currentjobs_list[
                                                                  index]
                                                              .checkin_location[
                                                                  index2]
                                                              .date
                                                              .toString());

                                                  // DateTime dateTime =
                                                  //     DateTime.parse(state
                                                  //         .currentjobs_list[
                                                  //             index]
                                                  //         .checkin_location[
                                                  //             index2]
                                                  //         .date
                                                  //         .toString());

                                                  // String formattedDate =
                                                  //     ThaiDateFormat(
                                                  //             'd MMMM y', 'th')
                                                  //         .format(dateTime);
                                                  return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 20),
                                                      child: Row(
                                                        children: [
                                                          (state
                                                                          .currentjobs_list[
                                                                              index]
                                                                          .checkin_location[
                                                                              index2]
                                                                          .checkinCategory ==
                                                                      "จุดรับสินค้า" ||
                                                                  state
                                                                          .currentjobs_list[
                                                                              index]
                                                                          .checkin_location[
                                                                              index2]
                                                                          .checkinCategory ==
                                                                      "จุดรับตู้")
                                                              ? SvgPicture
                                                                  .asset(
                                                                  'assets/images/pick_up.svg',
                                                                )
                                                              : SvgPicture
                                                                  .asset(
                                                                  'assets/images/drop.svg',
                                                                ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                      state
                                                                          .currentjobs_list[
                                                                              index]
                                                                          .checkin_location[
                                                                              index2]
                                                                          .checkinCategory,
                                                                      style: TextStyle(
                                                                          color: Palette
                                                                              .thisBlue,
                                                                          fontWeight:
                                                                              FontWeight.bold)),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  SizedBox(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.5,
                                                                    child: Text(
                                                                      (state.currentjobs_list[index].checkin_location[index2].checkinCategory.toString() ==
                                                                              'ปลายทางรอแจ้ง')
                                                                          ? ''
                                                                          : state
                                                                              .currentjobs_list[index]
                                                                              .checkin_location[index2]
                                                                              .point,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: TextStyle(
                                                                          decoration: TextDecoration
                                                                              .underline,
                                                                          decorationColor: Colors
                                                                              .blue,
                                                                          color: Colors
                                                                              .blue,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 8,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                      Icons
                                                                          .calendar_month,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          133,
                                                                          133,
                                                                          133)),
                                                                  SizedBox(
                                                                      width: 2),

                                                                  Text(
                                                                      (state.currentjobs_list[index].checkin_location[index2].checkinCategory.toString() ==
                                                                              'ปลายทางรอแจ้ง')
                                                                          ? '- รอแจ้ง -'
                                                                          : "${result['thaiDate']}" +
                                                                              " | " +
                                                                              "${result['time']}",
                                                                      overflow:
                                                                          TextOverflow
                                                                              .fade,
                                                                      style: TextStyle(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              133,
                                                                              133,
                                                                              133),
                                                                          fontWeight:
                                                                              FontWeight.bold)),
                                                                  // Text(
                                                                  //     (state.currentjobs_list[index].checkin_location[index2].checkinCategory.toString() ==
                                                                  //             'ปลายทางรอแจ้ง')
                                                                  //         ? '- รอแจ้ง -'
                                                                  //         : formattedDate,
                                                                  //     overflow:
                                                                  //         TextOverflow
                                                                  //             .fade,
                                                                  //     style: TextStyle(
                                                                  //         color: Color.fromARGB(
                                                                  //             255,
                                                                  //             133,
                                                                  //             133,
                                                                  //             133),
                                                                  //         fontWeight:
                                                                  //             FontWeight.bold)),
                                                                ],
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ));
                                                })
                                            : Text(
                                                '- ยังไม่ได้ระบุสถานที่',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ));
  }
}
