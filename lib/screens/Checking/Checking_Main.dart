// ignore_for_file: deprecated_member_use
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/ETC/shape_painter.dart';
import 'package:meechoke_project/bloc/Car_Check/car_check_bloc.dart';
import 'package:meechoke_project/bloc/Profile/profile_bloc.dart';
import 'package:meechoke_project/screens/Checking/Checking_Screen.dart';
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
    context.read<CarCheckBloc>().add(Daily_Check());
    context.read<ProfileBloc>().add(Load_Profile());
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
        child: BlocBuilder<CarCheckBloc, CarCheckState>(
          builder: (context, state) {
            return Column(children: [
              Stack(
                children: [
                  CustomPaint(
                    painter: ShapesPainter(),
                    child: Container(height: 160),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        BlocBuilder<ProfileBloc, ProfileState>(
                          builder: (context, state) {
                            if (state.loading == true) {
                              return Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 238, 246, 255),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(25),
                                              topRight: Radius.circular(25))),
                                      child: const Padding(
                                        padding:
                                            EdgeInsets.only(top: 8, bottom: 8),
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
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 15, 0, 15),
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
                                                      color: Color.fromARGB(
                                                          255, 66, 66, 66),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                '.....',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Palette.thisBlue,
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                                      color: Color.fromARGB(
                                                          255, 66, 66, 66),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                '.....',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Palette.thisBlue,
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                                      color: Color.fromARGB(
                                                          255, 66, 66, 66),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                '.....',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Palette.thisBlue,
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
                              );
                            }
                            return Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 238, 246, 255),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(25))),
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.only(top: 8, bottom: 8),
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
                                  Padding(
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
                                                    color: Color.fromARGB(
                                                        255, 66, 66, 66),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              state.profile_data.name,
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
                                                    color: Color.fromARGB(
                                                        255, 66, 66, 66),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              state.profile_data.plateNumber,
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
                                                    color: Color.fromARGB(
                                                        255, 66, 66, 66),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              state.profile_data
                                                  .trailerPlateNumber,
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
                            );
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        BlocBuilder<CarCheckBloc, CarCheckState>(
                          builder: (context, state) {
                            print(state.twty4Check.toString());
                            if (state.twty4Check == true) {
                            return  Column(
                              children: [
                                SizedBox(height: 20,),
                                Center(
                                    child: Text(
                                      'ยังไม่มีรายการตรวจเช็คประจำวัน',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Palette.thisBlue,
                                          fontSize: 23),
                                    ),
                                  ),
                              ],
                            );
                            }
                            return Column(
                              children: [
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
                                    context.read<CarCheckBloc>().add(
                                        Load_CheckList(
                                            getCheckType: 'extCheckupList'));

                                    Navigator.push(
                                      context,
                                      PageTransition(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          type: PageTransitionType.rightToLeft,
                                          child: Check_Screen(
                                            checkingType: 'เบื้องต้น',
                                          )),
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Palette.thisBlue,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '1. เบื้องต้น',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                          (state.storedExtCheckupList1.length ==
                                                  0)
                                              ? Icon(
                                                  Icons
                                                      .arrow_circle_right_outlined,
                                                  color: Colors.white,
                                                )
                                              : Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                          'assets/images/normal.svg',
                                                          color:
                                                              Palette.theGreen,
                                                          width: 25,
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          'ตรวจเช็คแล้ว',
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .theGreen,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    context.read<CarCheckBloc>().add(
                                        Load_CheckList(
                                            getCheckType:
                                                'extCheckupEquipment'));

                                    Navigator.push(
                                      context,
                                      PageTransition(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          type: PageTransitionType.rightToLeft,
                                          child: Check_Screen(
                                            checkingType: 'อุปกรณ์',
                                          )),
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Palette.thisBlue,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '2. อุปกรณ์',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                          (state.storedExtCheckupEquipment2
                                                      .length ==
                                                  0)
                                              ? Icon(
                                                  Icons
                                                      .arrow_circle_right_outlined,
                                                  color: Colors.white,
                                                )
                                              : Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                          'assets/images/normal.svg',
                                                          color:
                                                              Palette.theGreen,
                                                          width: 25,
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          'ตรวจเช็คแล้ว',
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .theGreen,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    context.read<CarCheckBloc>().add(
                                        Load_CheckList(
                                            getCheckType:
                                                'extCheckupSafetyList'));

                                    Navigator.push(
                                      context,
                                      PageTransition(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          type: PageTransitionType.rightToLeft,
                                          child: Check_Screen(
                                            checkingType: 'ความปลอดภัย',
                                          )),
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Palette.thisBlue,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '3. ความปลอดภัย',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                          (state.storedExtCheckupSafety3
                                                      .length ==
                                                  0)
                                              ? Icon(
                                                  Icons
                                                      .arrow_circle_right_outlined,
                                                  color: Colors.white,
                                                )
                                              : Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                          'assets/images/normal.svg',
                                                          color:
                                                              Palette.theGreen,
                                                          width: 25,
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          'ตรวจเช็คแล้ว',
                                                          style: TextStyle(
                                                              color: Palette
                                                                  .theGreen,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Palette.theGreen,
                                      elevation: 0,
                                      // side: BorderSide(color: Colors.white),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                  onPressed: (state
                                              .storedExtCheckupList1.isEmpty ||
                                          state.storedExtCheckupEquipment2
                                              .isEmpty ||
                                          state.storedExtCheckupSafety3.isEmpty)
                                      ? null
                                      : () {
                                          context
                                              .read<CarCheckBloc>()
                                              .add(Submit_AllCheckings());
                                        },
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Container(
                                      width: double.infinity,
                                      alignment: Alignment.center,
                                      child: const Text(
                                        "ส่งแบบตรวจเช็ค",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ]);
          },
        ),
      ),
    );
  }
}
