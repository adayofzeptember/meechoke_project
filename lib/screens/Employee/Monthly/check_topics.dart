// ignore_for_file: deprecated_member_use, must_be_immutable
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/ETC/shape_painter.dart';
import 'package:meechoke_project/bloc/Car_Check/car_check_bloc.dart';
import 'package:meechoke_project/bloc/Employee%20Monthly/employee_check_monthly_bloc.dart';
import 'package:meechoke_project/screens/Checking/Checking_Screen.dart';
import 'package:page_transition/page_transition.dart';

class Employee_Check_Topics extends StatefulWidget {
  int index;

  Employee_Check_Topics({required this.index});
  @override
  _Employee_Check_TopicsState createState() => _Employee_Check_TopicsState();
}

class _Employee_Check_TopicsState extends State<Employee_Check_Topics> {
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
          'ตรวจเช็ครถประจำเดือน',
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
                  BlocBuilder<EmployeeCheckMonthlyBloc,
                      EmployeeCheckMonthlyState>(
                    builder: (context, state1) {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
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
                                          'บันทึกตรวจสภาพรถประจำเดือน',
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
                                              state1
                                                  .all_monthly_list[
                                                      widget.index]
                                                  .name,
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
                                              state1
                                                  .all_monthly_list[
                                                      widget.index]
                                                  .primaryPlateNumber,
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
                                              state1
                                                  .all_monthly_list[
                                                      widget.index]
                                                  .secondaryPlateNumber,
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
                            //* เริ่มส่วนที่เช็ค
                            Column(
                              children: [
                                Center(
                                  child: Text(
                                    'หัวข้อตรวจเช็ค',
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
                                  onTap:
                                      (state.storedExtCheckupList1.length == 0)
                                          ? () {
                                              context.read<CarCheckBloc>().add(
                                                  Test_Employee(
                                                      getCheckType:
                                                          'extCheckupList',
                                                      getIndex: widget.index));

                                              Navigator.push(
                                                context,
                                                PageTransition(
                                                    duration: const Duration(
                                                        milliseconds: 300),
                                                    type: PageTransitionType
                                                        .rightToLeft,
                                                    child: Check_Screen(
                                                      checkingType: 'เบื้องต้น',
                                                    )),
                                              );
                                            }
                                          : null,
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
                                  onTap: (state.storedExtCheckupEquipment2
                                              .length ==
                                          0)
                                      ? () {
                                          context.read<CarCheckBloc>().add(
                                              Test_Employee(
                                                  getCheckType:
                                                      'extCheckupEquipment',
                                                  getIndex: widget.index));

                                          Navigator.push(
                                            context,
                                            PageTransition(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                type: PageTransitionType
                                                    .rightToLeft,
                                                child: Check_Screen(
                                                  checkingType: 'อุปกรณ์',
                                                )),
                                          );
                                        }
                                      : null,
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
                                  onTap: (state
                                              .storedExtCheckupSafety3.length ==
                                          0)
                                      ? () {
                                          context.read<CarCheckBloc>().add(
                                              Test_Employee(
                                                  getCheckType:
                                                      'extCheckupSafetyList',
                                                  getIndex: widget.index));

                                          Navigator.push(
                                            context,
                                            PageTransition(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                type: PageTransitionType
                                                    .rightToLeft,
                                                child: Check_Screen(
                                                  checkingType: 'ความปลอดภัย',
                                                )),
                                          );
                                        }
                                      : null,
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
                                GestureDetector(
                                    onTap: () {
                                      print('----------------------------');
                                      print(jsonEncode(
                                          state.storedExtCheckupList1));

                                      print(jsonEncode(
                                          state.storedExtCheckupEquipment2));

                                      print(jsonEncode(
                                          state.storedExtCheckupSafety3));
                                      print('----------------------------');
                                    },
                                    child: Text('for dev')),
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
                                              .add(Submit_AllCheckings(
                                                context: context,
                                                getCheckupID: state1
                                                    .all_monthly_list[
                                                        widget.index]
                                                    .checkupId,
                                                getCarID: state1
                                                    .all_monthly_list[
                                                        widget.index]
                                                    .registeredCarId,
                                                getDriverID: state1
                                                    .all_monthly_list[
                                                        widget.index]
                                                    .registeredDriverId,
                                              ));
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
                            )
                          ],
                        ),
                      );
                    },
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
