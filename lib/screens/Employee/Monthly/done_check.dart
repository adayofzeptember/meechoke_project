import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/bloc/Employee%20Monthly/employee_check_monthly_bloc.dart';

class Monthly_Checked extends StatelessWidget {
  const Monthly_Checked({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 237, 240),
      body: RawScrollbar(
        thickness: 5,
        thumbColor: Palette.thisBlue,
        radius: Radius.circular(20),
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: BlocBuilder<EmployeeCheckMonthlyBloc,
                  EmployeeCheckMonthlyState>(
                builder: (context, state) {
                  if (state.isLoading == true) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: CircularProgressIndicator(
                            color: Palette.thisBlue,
                          ),
                        ),
                      ],
                    );
                  }
                  if (state.all_monthly_done.length == 0 &&
                      state.isLoading == false) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text('ไม่มีรายการ'),
                        ),
                      ],
                    );
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'ประจำเดือน: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Palette.theGrey),
                          ),
                          Text(
                            state.dateMonth,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Palette.thisBlue),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ListView.builder(
                          primary: true,
                          itemCount: state.all_monthly_done.length,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                  color: Palette.mainBackgroud,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: (index % 2 == 0)
                                            ? Palette.thisBlue
                                            : Palette.theGreen,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(3),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.person,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                state.all_monthly_done[index]
                                                    .name
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                'ทะเบียนแม่',
                                                style: TextStyle(
                                                    color: Palette.theGrey,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                state.all_monthly_done[index]
                                                    .primaryPlateNumber
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Palette.thisBlue),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                'ทะเบียนลูก',
                                                style: TextStyle(
                                                    color: Palette.theGrey,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                state.all_monthly_done[index]
                                                    .secondaryPlateNumber
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Palette.thisBlue),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );

                            // );
                          }),
                    ],
                  );
                },
              )),
        ),
      ),
    );
  }
}
