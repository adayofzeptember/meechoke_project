import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meechoke_project/ETC/ProgressHUD.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/ETC/curency.dart';
import 'package:meechoke_project/ETC/shape_painter.dart';
import 'package:meechoke_project/bloc/Jobs/jobs_bloc.dart';
import 'package:meechoke_project/ETC/thai_date_converter.dart';
import 'package:url_launcher/url_launcher.dart';

class New_JobDetail extends StatelessWidget {
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
          // flexibleSpace: Container(
          //   decoration: const BoxDecoration(
          //     gradient: LinearGradient(
          //         begin: Alignment.centerLeft,
          //         end: Alignment.centerRight,
          //         colors: <Color>[
          //           Color.fromARGB(236, 233, 65, 65),
          //           Color.fromARGB(237, 63, 131, 219),
          //           Palette.thisBlue,
          //         ]),
          //   ),
          // ),
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
            'ใบสั่งงาน',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 228, 237, 240),
        body: SingleChildScrollView(
          child: Column(children: [
            Stack(
              children: [
                CustomPaint(
                  painter: ShapesPainter(),
                  child: Container(height: 200),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    width: double.infinity,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.79,
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
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Palette.thisBlue,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
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
                                              'จำนวนที่สินค้า : ',
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
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                              state.job_info.weight + " ตัน",
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
                                                  : state.job_info
                                                          .transportAmount
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
                                              state.job_info.pallet.toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              (state.job_info.detail
                                                          .toString() ==
                                                      'null'
                                                  ? '-'
                                                  : state.job_info.detail
                                                      .toString()),
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
                                                      'null'
                                                  ? '-'
                                                  : state.job_info.contactName
                                                      .toString()),
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
                                                      'null'
                                                  ? '-'
                                                  : state.job_info.contactTel
                                                      .toString()),
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
                                            Text(
                                              state.job_info.distance,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),

                                    //?
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          color: Color.fromARGB(
                                              255, 234, 240, 255)),
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
                                                itemCount: state
                                                    .job_info
                                                    .checkInLocation_Info
                                                    .length,
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
                                                                          .job_info
                                                                          .checkInLocation_Info[
                                                                              index]
                                                                          .checkinCategory,
                                                                      style: TextStyle(
                                                                          color: Palette
                                                                              .thisBlue,
                                                                          fontWeight:
                                                                              FontWeight.bold)),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap:
                                                                        () async {
                                                                      print(state
                                                                          .job_info
                                                                          .checkInLocation_Info[
                                                                              index]
                                                                          .lat);

                                                                      final Uri
                                                                          url =
                                                                          Uri.parse(
                                                                              'https://www.google.com/maps/search/?api=1&query=${state.job_info.checkInLocation_Info[index].lat},${state.job_info.checkInLocation_Info[index].lng}');
                                                                      if (!await launchUrl(
                                                                          url)) {
                                                                        throw Exception(
                                                                            'Could not launch $url');
                                                                      }
                                                                    },
                                                                    child:
                                                                        SizedBox(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.5,
                                                                      child:
                                                                          Text(
                                                                        (state.job_info.checkInLocation_Info[index].checkinCategory ==
                                                                                'ปลายทางรอแจ้ง')
                                                                            ? ''
                                                                            : state.job_info.checkInLocation_Info[index].point,
                                                                        style: TextStyle(
                                                                            decoration:
                                                                                TextDecoration.underline,
                                                                            decorationColor: Colors.blue,
                                                                            color: Colors.blue,
                                                                            fontWeight: FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                  (state.job_info.checkInLocation_Info[index].checkinCategory ==
                                                                          'ปลายทางรอแจ้ง')
                                                                      ? 'วันที่รอแจ้ง'
                                                                      : '${formattedDate}',
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
                                                                          FontWeight
                                                                              .bold)),
                                                            ],
                                                          )
                                                        ],
                                                      ));
                                                })
                                            : Text('ไม่ได้ระบุ'),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),

                                    //*
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Text(
                                                state.job_info.remark,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              formatNumber(
                                                  state.allowance.toString()),
                                              overflow: TextOverflow.fade,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              formatNumber(
                                                  state.advance.toString()),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'หมายเหตุ DOD : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 66, 66, 66)),
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
                )
              ],
            ),
            BlocBuilder<JobsBloc, JobsState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Palette.thisBlue,
                        elevation: 0,
                        // side: BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    onPressed: (state.status3Detail != 1)
                        ? null
                        : () {
                            showCustomDialog(context, state.job_info.docNumber);
                          },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: const Text(
                          "รับงาน",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ]),
        ));
  }
}

void showCustomDialog(BuildContext context, String joNumber) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'ยืนยันรับงาน: ' + joNumber.toString(),
          style: TextStyle(
              color: Palette.thisBlue,
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.green, // Splash color
            ),
            onPressed: () {
              context.read<JobsBloc>().add(
                  Action_Status(getJONumber: joNumber, getStatus: 'รับงาน'));
              context.read<JobsBloc>().add(Load_NewJobs());
              context.read<JobsBloc>().add(Load_CurrentJobs());
              Navigator.of(context).pop();
              Navigator.of(context).pop();

              //           Navigator.of(context).pop();
              //             Navigator.push(
              //   context,
              //   PageTransition(
              //       duration: const Duration(milliseconds: 500),
              //       type: PageTransitionType.fade,
              //       child: Job_Lists()),
              // );
            },
            child: Text(
              'ยืนยัน',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Palette.someRed,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'ยกเลิก',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );
    },
  );
}
