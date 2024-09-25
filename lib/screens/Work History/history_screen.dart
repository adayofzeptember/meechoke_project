// ignore_for_file: camel_case_types, must_be_immutable
import 'package:dotted_line/dotted_line.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/ETC/curency.dart';
import 'package:meechoke_project/bloc/HistoryWork/history_work_bloc.dart';
import 'package:meechoke_project/bloc/Jobs/jobs_bloc.dart';

class History_Page extends StatefulWidget {
  @override
  _History_PageState createState() => _History_PageState();
}

class _History_PageState extends State<History_Page> {
  final List<String> items = [
    'มกราคม', // January
    'กุมภาพันธ์', // February
    'มีนาคม', // March
    'เมษายน', // April
    'พฤษภาคม', // May
    'มิถุนายน', // June
    'กรกฎาคม', // July
    'สิงหาคม', // August
    'กันยายน', // September
    'ตุลาคม', // October
    'พฤศจิกายน', // November
    'ธันวาคม', // December
  ];

  final year = List<String>.generate(3, (index) {
    int currentYear = DateTime.now().year;
    return (currentYear - 2 + index).toString();
  }).reversed.toList();

  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.circular(30),
        //   ),
        // ),
        backgroundColor: Palette.mainBackgroud,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Palette.thisBlue,
          ),
        ),
        title: const Text(
          'ประวัติงาน',
          style: TextStyle(
              color: Palette.thisBlue,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
      backgroundColor: Palette.mainBackgroud,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<HistoryWorkBloc, HistoryWorkState>(
                builder: (context, state) {
                  return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Palette.thisBlue),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'รายได้เดือน ${state.month}',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '${state.total} บาท',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/icon_job.svg',
                                      height: 30,
                                      color: Palette.thisBlue,
                                    ),
                                    Text(
                                      'จำนวน ${state.count} งาน',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Palette.thisBlue),
                                    ),
                                  ],
                                )),
                              ))
                        ],
                      ));
                },
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'เดือน: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 150,
                    child: DropdownButtonFormField2<String>(
                      isExpanded: false,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        // Add more decoration..
                      ),
                      hint: const Text(
                        'เลือกเดือน',
                        style: TextStyle(fontSize: 14),
                      ),
                      items: items
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Palette.thisBlue),
                                ),
                              ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'โปรดเลือกเดือน';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        context
                            .read<HistoryWorkBloc>()
                            .add(GetDate(getMonth: value.toString()));
                        context.read<HistoryWorkBloc>().add(LoadHistoryWorks());
                      },
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.only(right: 8),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 24,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  //!
                  Text(
                    'ปี: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 120,
                    child: DropdownButtonFormField2<String>(
                      value: DateTime.now()
                          .year
                          .toString(), // Set default value to current year

                      isExpanded: false,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        // Add more decoration..
                      ),
                      hint: const Text(
                        'เลือกปี',
                        style: TextStyle(fontSize: 14),
                      ),
                      items: year
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Palette.thisBlue),
                                ),
                              ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'โปรดเลือกปี';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        context
                            .read<HistoryWorkBloc>()
                            .add(GetDate(getYear: value.toString()));
                        context.read<HistoryWorkBloc>().add(LoadHistoryWorks());
                      },

                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.only(right: 8),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 24,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              BlocBuilder<HistoryWorkBloc, HistoryWorkState>(
                  builder: (context, state) {
                if (state.status == 'wait') {
                  return Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Text(
                          'เลือกเดือนและปี',
                          style: TextStyle(
                              fontSize: 20,
                              color: Palette.thisBlue,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  );
                } else if (state.status == 'loading') {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.workhistory_list.length == 0) {
                  return Center(
                      child: Text(
                    'ไม่มีข้อมูลประจำเดือน ${state.month}/${state.year}',
                    style: TextStyle(
                        fontSize: 18,
                        color: const Color.fromARGB(255, 62, 62, 62)),
                  ));
                } else if (state.status == 'error') {
                  return Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Text(
                          'เกิดข้อผิดพลาด',
                          style: TextStyle(
                              fontSize: 20,
                              color: Palette.someRed,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  );
                }

                return ListView.builder(
                  primary: true,
                  itemCount: state.workhistory_list.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/icon_job.svg',
                              fit: BoxFit.contain,
                              color: Palette.thisBlue,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              state.workhistory_list[index].date_range,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Palette.thisBlue,
                              ),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            print(state
                                    .workhistory_list[index].doc_number
                                    .toString());
                            context.read<JobsBloc>().add(Load_Job_Info(
                                checkPage: 'history',
                                context: context,
                                joNumber: state
                                    .workhistory_list[index].doc_number
                                    .toString()));
                          },
                          child: Stack(
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/images/card_history.svg',
                                width: MediaQuery.of(context).size.width,
                              ),
                              Positioned(
                                top: 10,
                                left: 25,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
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
                                              state.workhistory_list[index]
                                                  .doc_number,
                                              style: TextStyle(
                                                  color: Palette.thisBlue,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        12, 8, 12, 8),
                                                child: Text(
                                                  '${formatNumber(state.workhistory_list[index].allowance)} บาท',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.green,
                                                      fontWeight:
                                                          FontWeight.bold),
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
                                          // dashGradient: [
                                          //   Colors.red,
                                          //   Colors.blue,
                                          // ],
                                          dashLength: 10,
                                          lineThickness: 2,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text('ลูกค้า: '),
                                            Text(
                                              state.workhistory_list[index]
                                                  .customer,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Palette.thisBlue),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
