import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/ETC/curency.dart';
import 'package:meechoke_project/ETC/shape_painter.dart';
import 'package:meechoke_project/bloc/Jobs/jobs_bloc.dart';

class Info_WorkDeclare extends StatelessWidget {
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
            '',
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
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'JO NUmber',
                                          style: TextStyle(
                                              color: Palette.thisBlue,
                                              fontWeight: FontWeight.w900),
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
                                                'ลูกค้า',
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
                                              'product X',
                                              overflow: TextOverflow.fade,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              'x' + ' ตัน',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              'กระสอบ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              'pallet',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              'รายละเอียดงาน x',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              'ชื่อ xyz ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              '087',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              'in the name of god',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              formatNumber("134756"),
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
                                                '14 กม.',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          color: Color.fromARGB(
                                              255, 234, 240, 255)),
                                      child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 20, 15, 20),
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 15),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/images/pick_up.svg',
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
                                                              Text('จุดรับ',
                                                                  style: TextStyle(
                                                                      color: Palette
                                                                          .thisBlue,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                'โรงงาน A',
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
                                                                        FontWeight
                                                                            .bold),
                                                              )
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text('DATE TIME วันเวลา',
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
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 25,
                                                  ),
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(
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
                                                              Text('จุดส่ง',
                                                                  style: TextStyle(
                                                                      color: Palette
                                                                          .thisBlue,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(
                                                                'โรงงาน B',
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
                                                                        FontWeight
                                                                            .bold),
                                                              )
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text('DATE TIME วันเวลา',
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
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ))),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
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
                                            Text(
                                              'remark',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              formatNumber("123123"),
                                              overflow: TextOverflow.fade,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              formatNumber("783485"),
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
                                            'DOD',
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
                        backgroundColor: Palette.theGreen,
                        elevation: 0,
                        // side: BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    onPressed: () {
                      showCustomAlertDialog(context);
                      // showCustomDialog(context, state.job_info.docNumber);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: const Text(
                          "สนใจรับงาน",
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

void showCustomAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Center(
          child: Text(
            'ราคาที่ต้องการ',
            style: TextStyle(
              color: Palette.thisBlue,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'กรอกราคาที่ต้องการ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Color.fromARGB(255, 70, 70, 70),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'ยกเลิก',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(width: 10), // Adds space between buttons
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'ตกลง',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
