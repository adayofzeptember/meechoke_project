import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/ETC/shape_painter.dart';
import 'package:meechoke_project/bloc/Financial/financial_bloc.dart';

class Financial_List extends StatefulWidget {
  @override
  _Financial_ListState createState() => _Financial_ListState();
}

class _Financial_ListState extends State<Financial_List> {
  @override
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
            'ประวัติการเงิน',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        backgroundColor: Palette.mainBackgroud,
        body: SingleChildScrollView(
          child: Column(children: [
            Stack(
              children: [
                CustomPaint(
                  painter: ShapesPainter(),
                  child: Container(height: 200),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                const Text(
                                  'รายการประวัติการเงิน',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 79, 79, 79),
                                      fontWeight: FontWeight.bold),
                                ),
                                BlocBuilder<FinancialBloc, FinancialState>(
                                  builder: (context, state) {
                                    if (state.status1 == 0) {
                                      return Center(
                                          child: Column(
                                        children: [
                                          SizedBox(
                                            height: 20,
                                          ),
                                          CircularProgressIndicator(),
                                        ],
                                      ));
                                    } else if (state.status1 == 2) {
                                      return GestureDetector(
                                        onTap: () {
                                          // context
                                          //     .read<JobsBloc>()
                                          //     .add(Load_NewJobs());
                                        },
                                        child: Center(
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
                                        )),
                                      );
                                    } else if (state.status1 == 1 &&
                                        state.financial_list.isEmpty) {
                                      return Center(
                                          child: Column(
                                        children: [
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'ยังไม่มีรายการเงิน',
                                            style: TextStyle(
                                                color: Palette.thisBlue,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          )
                                        ],
                                      ));
                                    }
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 20  ),
                                      child: ListView.builder(
                                          primary: true,
                                          itemCount: state.financial_list.length,
                                          shrinkWrap: true,
                                          physics: const ClampingScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      state.financial_list[index].transferMethod,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color:
                                                              Palette.thisBlue,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      '17,890.00',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.green,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  '15 ก.พ. 23 10:26 น.',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(height: 5),
                                                Divider()
                                              ],
                                            );
                                          }),
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                      color:
                                          Color.fromARGB(255, 236, 212, 212)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'หมายเหตุ: ',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'วันเวลาที่แสดงนี้จะช้ากว่าเวลาที่โอนจริงเนื่องจากเป็นการ บันทึกเข้าโปรแกรมหลังจากที่ได้โอนเงินผ่านธนาคารแล้วแต่จะอยู่ภายในวันเดียวกัน',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ]),
        ));
  }
}
