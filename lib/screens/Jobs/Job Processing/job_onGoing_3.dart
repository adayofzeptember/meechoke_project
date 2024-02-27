// ignore_for_file: camel_case_types, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/bloc/Jobs/jobs_bloc.dart';


// หน้ารถ
class Job_OnGoing extends StatefulWidget {
  Job_OnGoing() : super();
  @override
  _Job_OnGoingState createState() => _Job_OnGoingState();
}

class _Job_OnGoingState extends State<Job_OnGoing> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobsBloc, JobsState>(
      builder: (context, state) {
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
            title: Text(
              state.job_info.docNumber,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 1, 44, 97),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "จุดรับสินค้า",
                          style: TextStyle(
                              color: Color.fromARGB(255, 97, 97, 97),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.pin_drop,
                              color: Colors.red,
                            ),
                            Text(
                              "โรงน้ำตาลครบุรี อ.ครบุรี จ.นครราชสีมา",
                              style: TextStyle(
                                  color: Palette.thisBlue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SvgPicture.asset(
                          'assets/images/dest.svg',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  "ควรถึงก่อนเวลา",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 97, 97, 97),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "17.00 น.",
                                  style: TextStyle(
                                      color: Palette.thisBlue,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 246, 246),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    "เหลือเวลา",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 97, 97, 97),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "06:25:15",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Spacer(),
                // if (widget.check == "fg")
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            elevation: 0,
                            // side: BorderSide(color: Colors.white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: Text(
                              'ถึงจุดรับสินค้า',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            elevation: 0,
                            // side: BorderSide(color: Colors.white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: const Text(
                              "กลับสู่หน้าหลัก",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Palette.thisBlue,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
