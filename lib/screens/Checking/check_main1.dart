import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/ETC/shape_painter.dart';
import 'package:meechoke_project/bloc/Car_Check/car_check_bloc.dart';
import 'package:meechoke_project/screens/Checking/testCheck.dart';
import 'package:page_transition/page_transition.dart';

class Check_Daily extends StatefulWidget {
  @override
  _Check_DailyState createState() => _Check_DailyState();
}

class _Check_DailyState extends State<Check_Daily> {
  List<File> selectedImages = [];
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
          'ตรวจเช็ครถประจำวัน',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 228, 237, 240),
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              CustomPaint(
                painter: ShapesPainter(),
                child: Container(height: 160),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 238, 246, 255),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25))),
                            child: const Padding(
                              padding: EdgeInsets.only(top: 8, bottom: 8),
                              child: Center(
                                child: Text(
                                  'บันทึกตรวจสภาพรถประจำวัน',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Palette.thisBlue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(20, 15, 0, 15),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 90,
                                      child: Text(
                                        'ชื่อพขร. :',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color:
                                                Color.fromARGB(255, 66, 66, 66),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'ทวีศักดิ์ ชยันกลาง',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Palette.thisBlue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 90,
                                      child: Text(
                                        'ทะเบียนแม่ :',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color:
                                                Color.fromARGB(255, 66, 66, 66),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '71-0151',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Palette.thisBlue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 90,
                                      child: Text(
                                        'ทะเบียนลูก :',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color:
                                                Color.fromARGB(255, 66, 66, 66),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '71-71-0152',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Palette.thisBlue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        'รายการตรวจเช็ค',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Palette.thisBlue,
                            fontSize: 23),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        //    Navigator.push(
                        //   context,
                        //   PageTransition(
                        //       duration: const Duration(milliseconds: 300),
                        //       type: PageTransitionType.rightToLeft,
                        //       child: Check_Does()),
                        // );

                        context.read<CarCheckBloc>().add(Load_CheckList());

                        Navigator.push(
                          context,
                          PageTransition(
                              duration: const Duration(milliseconds: 300),
                              type: PageTransitionType.rightToLeft,
                              child: Test_Check()),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Palette.thisBlue,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '1. เบื้องต้น',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_circle_right_outlined,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Palette.thisBlue,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '2. อุปกรณ์',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_circle_right_outlined,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Palette.thisBlue,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '3. เซฟตี้',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_circle_right_outlined,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
