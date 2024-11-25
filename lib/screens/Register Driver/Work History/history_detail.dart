import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meechoke_project/ETC/ProgressHUD.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/ETC/curency.dart';
import 'package:meechoke_project/bloc/Jobs/jobs_bloc.dart';
import 'package:meechoke_project/ETC/thai_date_converter.dart';

class HistoryJob_Detail extends StatelessWidget {
  Widget build(BuildContext context) {
    return BlocBuilder<JobsBloc, JobsState>(
      builder: (context, state) {
        return ProgressHUD(
            child: _uiNewJobDetail(context),
            inAsyncCall: state.isLoading,
            opacity: 0.3);
      },
    );
  }

  Widget _uiNewJobDetail(BuildContext context) {
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
            'ใบสั่งงานทั่วไป (จบงานแล้ว)',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 1, 44, 97),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: SizedBox(
                  child: RawScrollbar(
                    thickness: 5,
                    radius: Radius.circular(15),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: BlocBuilder<JobsBloc, JobsState>(
                          builder: (context, state) {
                            if (state.status3Detail == 0) {
                              return Center(
                                  child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  CircularProgressIndicator(),
                                ],
                              ));
                            } else if (state.status3Detail == 2) {
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
                            }
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      state.job_info.docNumber,
                                      style: TextStyle(
                                          color: Palette.thisBlue,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    (state.job_info.current_status ==
                                            'เสร็จงาน')
                                        ? Container(
                                            decoration: BoxDecoration(
                                                color: Palette.theGreen,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      15, 8, 15, 8),
                                              child: SizedBox(
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'งานเสร็จสิ้น',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      width: 3,
                                                    ),
                                                    Icon(
                                                      Icons.check,
                                                      color: Colors.white,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            decoration: BoxDecoration(
                                                color: Palette.thisBlue,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      12, 8, 12, 8),
                                              child: SizedBox(
                                                width: 120,
                                                child: Text(
                                                  state.job_info.docStatus,
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
                                SizedBox(
                                  height: 10,
                                ),
                                DottedLine(
                                  dashColor: Palette.thisBlue,
                                  // dashGradient: const [
                                  //   Palette.thisBlue,
                                  //   Palette.someRed
                                  // ],
                                  dashLength: 5,
                                  lineThickness: 1,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'ลูกค้า : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 66, 66, 66)),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'สินค้า : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 66, 66, 66)),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'จำนวนที่รับ : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 66, 66, 66)),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'จำนวนสินค้า : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 66, 66, 66)),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'จำนวนพาเลท : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 66, 66, 66)),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'ลักษณะงาน : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 66, 66, 66)),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'ผู้ติดต่อ : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 66, 66, 66)),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'เบอร์โทรผู้ติดต่อ : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 66, 66, 66)),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'ขนส่งในนาม : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 66, 66, 66)),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'เก็บเงินสดจากลูกค้า : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 66, 66, 66)),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'ระยะทางรวม (กม.) : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 66, 66, 66)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    //!
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35,
                                          child: Text(
                                            state.job_info.customerName,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          state.job_info.productName,
                                          overflow: TextOverflow.fade,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          state.job_info.weight + ' ตัน',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          (state.job_info.transportAmount
                                                      .toString() ==
                                                  'null')
                                              ? '-'
                                              : state.job_info.transportAmount
                                                      .toString() +
                                                  ' ' +
                                                  state.job_info.unitType,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          state.job_info.pallet,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          state.job_info.detail,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          (state.job_info.contactName
                                                      .toString() ==
                                                  'null')
                                              ? '-'
                                              : state.job_info.contactName
                                                  .toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          (state.job_info.contactTel
                                                      .toString() ==
                                                  'null')
                                              ? '-'
                                              : state.job_info.contactTel
                                                  .toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          (state.job_info.inTheNameOf
                                                      .toString() ==
                                                  'null')
                                              ? '-'
                                              : state.job_info.inTheNameOf
                                                  .toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          formatNumber(
                                              state.job_info.collectMoney),
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        SizedBox(
                                          width: 90,
                                          child: Text(
                                            (state.job_info.distance
                                                        .toString() ==
                                                    'null')
                                                ? '-'
                                                : state.job_info.distance
                                                    .toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),

                                //?
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      barrierDismissible:
                                          true, //* user must tap button!
                                      builder: (context) {
                                        return AlertDialog(
                                          backgroundColor: Colors.white,
                                          content: SingleChildScrollView(
                                            primary: true,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 300,
                                                  height: 300,
                                                  child: ListView.builder(
                                                      itemCount: state.job_info
                                                          .img_info.length,
                                                      shrinkWrap: true,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  bottom: 10),
                                                          child: Row(
                                                            children: [
                                                              GestureDetector(
                                                                onTap: () {
                                                                  (state.job_info.img_info[index].imgURL
                                                                              .toString() ==
                                                                          '')
                                                                      ? Text(
                                                                          'ไม่พบรูป')
                                                                      : showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return Dialog(
                                                                              child: InteractiveViewer(
                                                                                child: Image.network(state.job_info.img_info[index].imgURL.toString()),
                                                                              ),
                                                                            );
                                                                          },
                                                                        );
                                                                  // showDialog(
                                                                  //   context:
                                                                  //       context,
                                                                  //   builder:
                                                                  //       (context) {
                                                                  //     return Dialog(
                                                                  //       child:
                                                                  //           InteractiveViewer(
                                                                  //         child: Image.network(state.job_info.img_info[index].imgURL.toString()),
                                                                  //       ),
                                                                  //     );
                                                                  //   },
                                                                  // );
                                                                },
                                                                child: (state
                                                                            .job_info
                                                                            .img_info[
                                                                                index]
                                                                            .imgURL
                                                                            .toString() ==
                                                                        '')
                                                                    ? Text(
                                                                        'ไม่พบรูป')
                                                                    : Image
                                                                        .network(
                                                                        state
                                                                            .job_info
                                                                            .img_info[index]
                                                                            .imgURL
                                                                            .toString(),
                                                                        height:
                                                                            100,
                                                                      ),
                                                              ),
                                                              SizedBox(
                                                                width: 20,
                                                              ),
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    state
                                                                        .job_info
                                                                        .img_info[
                                                                            index]
                                                                        .checkinCategory
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  Text(
                                                                    state
                                                                        .job_info
                                                                        .img_info[
                                                                            index]
                                                                        .timeStamp
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      }),
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            Center(
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary:
                                                        const Color.fromARGB(
                                                            255, 234, 240, 255),
                                                    elevation: 0,
                                                    side: const BorderSide(
                                                        color:
                                                            Palette.thisBlue),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    )),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "ปิด",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Palette.thisBlue,
                                                          fontSize: 15),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        color:
                                            Color.fromARGB(255, 234, 240, 255)),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 20, 15, 20),
                                      child: (state
                                                  .job_info
                                                  .checkInLocation_Info
                                                  .length !=
                                              0)
                                          ? ListView.builder(
                                              primary: true,
                                              itemCount: state.job_info
                                                  .checkInLocation_Info.length,
                                              shrinkWrap: true,
                                              physics:
                                                  const ClampingScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                DateTime dateTime =
                                                    DateTime.parse(state
                                                        .job_info
                                                        .checkInLocation_Info[
                                                            index]
                                                        .date);

                                                String formattedDate =
                                                    ThaiDateFormat(
                                                            'd MMMM y', 'th')
                                                        .format(dateTime);
                                                return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 15),
                                                    child: Row(
                                                      children: [
                                                        (state
                                                                        .job_info
                                                                        .checkInLocation_Info[
                                                                            index]
                                                                        .checkinCategory ==
                                                                    "จุดรับสินค้า" ||
                                                                state
                                                                        .job_info
                                                                        .checkInLocation_Info[
                                                                            index]
                                                                        .checkinCategory ==
                                                                    "จุดรับตู้")
                                                            ? SvgPicture.asset(
                                                                'assets/images/pick_up.svg',
                                                              )
                                                            : SvgPicture.asset(
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
                                                                            .job_info
                                                                            .checkInLocation_Info[
                                                                                index]
                                                                            .checkinCategory +
                                                                        ":",
                                                                    style: TextStyle(
                                                                        color: Palette
                                                                            .thisBlue,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                SizedBox(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.5,
                                                                  child: Text(
                                                                    state
                                                                        .job_info
                                                                        .checkInLocation_Info[
                                                                            index]
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
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                    '${formattedDate}',
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
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Text(
                                                                    state
                                                                        .job_info
                                                                        .checkInLocation_Info[
                                                                            index]
                                                                        .time,
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
                                          : Text('ไม่ได้ระบุ'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),

                                //*
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'หมายเหตุ : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 66, 66, 66)),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'เบี้ยเลี้ยง : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 66, 66, 66)),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'โอนล่วงหน้า : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 66, 66, 66)),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 65,
                                    ),

                                    //!
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.job_info.remark,
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          formatNumber(state.allowance),
                                          overflow: TextOverflow.fade,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          formatNumber(state.advance),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'หมายเหตุ DOD : ',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 66, 66, 66)),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Expanded(
                                      child: Text(
                                        state.job_info.dod,
                                        softWrap: false,
                                        maxLines: 10,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}
