import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/test/thai_date_converter.dart';
import '../../../bloc/Jobs/jobs_bloc.dart';

class NewJobs_Screen extends StatelessWidget {
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
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListView.builder(
                    primary: true,
                    itemCount: state.newjobs_list.length,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          print('JO number: ' +
                              state.newjobs_list[index].jobNumber.toString());
                          context.read<JobsBloc>().add(Load_Job_Info(
                              checkPage: 'new_job',
                              context: context,
                              joNumber: state.newjobs_list[index].jobNumber
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
                                      '',
                                      //state.newjobs_list[index].checkin_location[0].date + '-'      +   state.newjobs_list[index].checkin_location[1].date,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
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
                                              state
                                                  .newjobs_list[index].jobNumber
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Palette.thisBlue,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Container(
                                              decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 193, 193, 193),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    12, 8, 12, 8),
                                                child: SizedBox(
                                                  width: 120,
                                                  child: Text(
                                                    state.newjobs_list[index]
                                                        .jobStatus
                                                        .toString(),
                                                    textAlign: TextAlign.center,
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
                                          dashColor: Palette.thisBlue,
                                          // dashGradient: const [
                                          //   Palette.thisBlue,
                                          //   Palette.someRed
                                          // ],
                                          // dashLength: 10,
                                          // lineThickness: 1,
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        (state.newjobs_list[index]
                                                    .checkin_location.length !=
                                                0)
                                            ? ListView.builder(
                                                primary: true,
                                                itemCount: state
                                                    .newjobs_list[index]
                                                    .checkin_location
                                                    .length,
                                                shrinkWrap: true,
                                                physics:
                                                    const ClampingScrollPhysics(),
                                                itemBuilder:
                                                    (context, indexLocation) {
                                                  //state.newjobs_list[index].checkin_location[indexLocation].date.toString()

                                                  DateTime dateTime =
                                                      DateTime.parse(state
                                                          .newjobs_list[index]
                                                          .checkin_location[
                                                              indexLocation]
                                                          .date
                                                          .toString());

                                                  String formattedDate =
                                                      ThaiDateFormat(
                                                              'd MMMM y', 'th')
                                                          .format(dateTime);
                                                  return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 20),
                                                      child: Row(
                                                        children: [
                                                          (state
                                                                          .newjobs_list[
                                                                              index]
                                                                          .checkin_location[
                                                                              indexLocation]
                                                                          .checkinCategory ==
                                                                      "จุดรับสินค้า" ||
                                                                  state
                                                                          .newjobs_list[
                                                                              index]
                                                                          .checkin_location[
                                                                              indexLocation]
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
                                                            width: 5,
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
                                                                      state.newjobs_list[index].checkin_location[indexLocation].checkinCategory +
                                                                          ":",
                                                                      style: TextStyle(
                                                                          color: Palette
                                                                              .thisBlue,
                                                                          fontWeight:
                                                                              FontWeight.bold)),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                    state
                                                                        .newjobs_list[
                                                                            index]
                                                                        .checkin_location[
                                                                            indexLocation]
                                                                        .point,
                                                                    style: TextStyle(
                                                                        decoration:
                                                                            TextDecoration
                                                                                .underline,
                                                                        decorationColor:
                                                                            Colors
                                                                                .blue,
                                                                        color: Colors
                                                                            .blue,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  )
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  // Icon(
                                                                  //   Icons
                                                                  //       .calendar_month_rounded,
                                                                  //   // You can customize the size, color, and other properties as needed
                                                                  //   size: 24,
                                                                  //   color: Palette
                                                                  //       .thisBlue,
                                                                  // ),
                                                                  Text(
                                                                      '[ ${formattedDate} ] ',
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
