import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/bloc/Jobs/jobs_bloc.dart';

class FinishJob_Screen extends StatelessWidget {
  FinishJob_Screen() : super();
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
            title: const Text(
              'เสร็จงาน',
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
                        SvgPicture.asset('assets/images/jobdone.svg'),
                        SizedBox(
                          height: 13,
                        ),
                        Text(
                          "งานสำเร็จแล้ว ! ",
                          style: TextStyle(
                              color: Color.fromARGB(255, 97, 97, 97),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "กดปุ่ม",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 97, 97, 97),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Palette.theGreen,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(7, 3, 7, 3),
                                child: Text(
                                  "จบงาน",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "ด้านล่าง",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 97, 97, 97),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 171, 204, 241),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    "เวลาทำงานทั้งหมด",
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
                                        color: Palette.thisBlue,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Palette.theGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          showFinishDialog(
                              context, state.job_info.docNumber.toString());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: Text(
                              'จบงาน',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
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

void showFinishDialog(BuildContext context, String joNumber) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'ยืนยันเสร็จงาน: ' + joNumber.toString(),
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
              // Navigator.pop(context);
              context.read<JobsBloc>().add(Action_Status(
                  getStatus: 'จบงาน',
                  context: context,
                  getJONumber: joNumber));
              // context.read<JobsBloc>().add(FinishTheJob(
              //     check: '',
              //     type: 'เสร็จงาน',
              //     context: context,
              //     getJoNumber: joNumber));
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
