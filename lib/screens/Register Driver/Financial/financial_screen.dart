import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/ETC/curency.dart';
import 'package:meechoke_project/ETC/shape_painter.dart';
import 'package:meechoke_project/bloc/Financial/financial_bloc.dart';

class Financial_List extends StatefulWidget {
  @override
  _Financial_ListState createState() => _Financial_ListState();
}

class _Financial_ListState extends State<Financial_List>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    super.initState();
  }

  void _handleRefresh() {
    _animationController.repeat();
    Future.delayed(Duration(milliseconds: 500), () {
      _animationController.stop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Palette.thisBlue,
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
          actions: [
            RotationTransition(
              turns: _animation,
              child: IconButton(
                icon: Icon(
                  Icons.refresh,
                  color: Colors.white,
                  size: MediaQuery.of(context).size.height * 0.04,
                ),
                onPressed: () {
                  _handleRefresh();
                  context.read<FinancialBloc>().add(Load_Financial());
                },
              ),
            ),
          ],
          title: Text(
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
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Column(
                        children: [
                          BlocBuilder<FinancialBloc, FinancialState>(
                            builder: (context, state) {
                              if (state.status1 == 0) {
                                return Center(
                                    child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ],
                                ));
                              } else if (state.status1 == 1 &&
                                  state.financial_list.isEmpty) {
                                return Center(
                                    child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.error,
                                          color: Palette.someRed,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          child: Text(
                                            'ยังไม่มีประวัติการเงิน',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ));
                              } else if (state.status1 == 2) {
                                return GestureDetector(
                                  onTap: () {},
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
                              }
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                      ' *หมายเหตุ: วันเวลาที่แสดงนี้จะช้ากว่าเวลาที่โอนจริง',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color.fromARGB(255, 255, 0, 4),
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: ListView.builder(
                                          primary: true,
                                          itemCount:
                                              state.financial_list.length,
                                          shrinkWrap: true,
                                          physics:
                                              const ClampingScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return ExpansionTile(
                                              title: Container(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          (state
                                                                      .financial_list[
                                                                          index]
                                                                      .transferMethod ==
                                                                  'null')
                                                              ? '-'
                                                              : state
                                                                  .financial_list[
                                                                      index]
                                                                  .transferMethod
                                                                  .toString(),
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color: Palette
                                                                  .thisBlue,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          formatNumber(state
                                                              .financial_list[
                                                                  index]
                                                              .total
                                                              .toString()),
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color: (int.parse(state
                                                                          .financial_list[
                                                                              index]
                                                                          .total
                                                                          .toString()) <
                                                                      0)
                                                                  ? Colors.red
                                                                  : Colors
                                                                      .green,
                                                              // color:
                                                              //     Colors.green,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      state
                                                          .financial_list[index]
                                                          .clearingDate
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(height: 5),
                                                  ],
                                                ),
                                              ),
                                              children: <Widget>[
                                                ListView.builder(
                                                    primary: true,
                                                    itemCount: state
                                                        .financial_list[index]
                                                        .expanded_list
                                                        .length,
                                                    shrinkWrap: true,
                                                    physics:
                                                        const ClampingScrollPhysics(),
                                                    itemBuilder:
                                                        (context, index2) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 10,
                                                                right: 10,
                                                                bottom: 5),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            showDialog(
                                                              context: context,
                                                              barrierDismissible:
                                                                  false, //* user must tap button!
                                                              builder:
                                                                  (context) {
                                                                return AlertDialog(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white,
                                                                  content:
                                                                      SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Center(
                                                                            child:
                                                                                Text(
                                                                          state
                                                                              .financial_list[index]
                                                                              .expanded_list[index2]
                                                                              .documentNumber,
                                                                          style: TextStyle(
                                                                              color: Palette.thisBlue,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 18),
                                                                        )),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Container(
                                                                          decoration: BoxDecoration(
                                                                              color: const Color.fromARGB(255, 191, 191, 191),
                                                                              borderRadius: BorderRadius.all(Radius.circular(20))),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8),
                                                                            child:
                                                                                Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  'เงินที่ได้รับในเที่ยวนี้: ',
                                                                                  style: const TextStyle(color: Color.fromARGB(255, 49, 48, 48), fontWeight: FontWeight.bold),
                                                                                ),
                                                                                Text(
                                                                                  formatNumber(state.financial_list[index].expanded_list[index2].jobTotal) + " บาท",
                                                                                  style: const TextStyle(color: Palette.thisBlue, fontWeight: FontWeight.bold),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Divider(),
                                                                        const SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Center(
                                                                          child:
                                                                              Text(
                                                                            'รายละเอียดยอดเงินรับในเที่ยวนี้',
                                                                            style:
                                                                                const TextStyle(color: Palette.thisBlue, fontWeight: FontWeight.bold),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              15,
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              'ค่าเบี้ยเลี้ยง: ',
                                                                              style: const TextStyle(color: Color.fromARGB(255, 49, 48, 48), fontWeight: FontWeight.bold),
                                                                            ),
                                                                            Text(
                                                                              formatNumber(state.financial_list[index].expanded_list[index2].allowance_total) + " บาท",
                                                                              style: const TextStyle(color: Palette.thisBlue, fontWeight: FontWeight.bold),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              15,
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              'ค่าทางด่วน: ',
                                                                              style: const TextStyle(color: Color.fromARGB(255, 49, 48, 48), fontWeight: FontWeight.bold),
                                                                            ),
                                                                            Text(
                                                                              formatNumber(state.financial_list[index].expanded_list[index2].highwayTotal) + " บาท",
                                                                              style: const TextStyle(color: Palette.thisBlue, fontWeight: FontWeight.bold),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              15,
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              'รวมเงินที่ได้รับ: ',
                                                                              style: const TextStyle(color: Color.fromARGB(255, 49, 48, 48), fontWeight: FontWeight.bold),
                                                                            ),
                                                                            Text(
                                                                              formatNumber(state.financial_list[index].expanded_list[index2].sum.toString()) + " บาท",
                                                                              style: const TextStyle(color: Palette.theGreen, fontWeight: FontWeight.bold),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Divider(),
                                                                        const SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Center(
                                                                          child:
                                                                              Text(
                                                                            'รายการที่หักในเที่ยววิ่งนี้',
                                                                            style:
                                                                                const TextStyle(color: Palette.thisBlue, fontWeight: FontWeight.bold),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              15,
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              'เงินทดรอง: ',
                                                                              style: const TextStyle(color: Color.fromARGB(255, 49, 48, 48), fontWeight: FontWeight.bold),
                                                                            ),
                                                                            Text(
                                                                              formatNumber(state.financial_list[index].expanded_list[index2].advance_total) + " บาท",
                                                                              style: const TextStyle(color: Palette.thisBlue, fontWeight: FontWeight.bold),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              15,
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              'หนี้ค้างเดิม: ',
                                                                              style: const TextStyle(color: Color.fromARGB(255, 49, 48, 48), fontWeight: FontWeight.bold),
                                                                            ),
                                                                            Text(
                                                                              formatNumber(state.financial_list[index].driverDebt) + " บาท",
                                                                              style: const TextStyle(color: Palette.thisBlue, fontWeight: FontWeight.bold),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              15,
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              'รวมเงินที่หัก: ',
                                                                              style: const TextStyle(color: Color.fromARGB(255, 49, 48, 48), fontWeight: FontWeight.bold),
                                                                            ),
                                                                            Text(
                                                                              (formatNumber((double.parse(state.financial_list[index].expanded_list[index2].advance_total) + double.parse(state.financial_list[index].driverDebt)).toString()) + " บาท"),
                                                                              style: const TextStyle(color: Palette.someRed, fontWeight: FontWeight.bold),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  actions: <Widget>[
                                                                    Center(
                                                                      child:
                                                                          ElevatedButton(
                                                                        style: ElevatedButton.styleFrom(
                                                                            primary: const Color.fromARGB(255, 234, 240, 255),
                                                                            elevation: 0,
                                                                            side: const BorderSide(color: Palette.thisBlue),
                                                                            shape: RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(10),
                                                                            )),
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              10.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            alignment:
                                                                                Alignment.center,
                                                                            child:
                                                                                Text(
                                                                              "ปิด",
                                                                              style: TextStyle(fontWeight: FontWeight.bold, color: Palette.thisBlue, fontSize: 15),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          },
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center, // Align children vertically centered

                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      state
                                                                          .financial_list[
                                                                              index]
                                                                          .expanded_list[
                                                                              index2]
                                                                          .documentNumber,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color:
                                                                              Colors.black),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child: Text(
                                                                      formatNumber(state
                                                                          .financial_list[
                                                                              index]
                                                                          .expanded_list[
                                                                              index2]
                                                                          .jobTotal),
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color:
                                                                              Palette.thisBlue),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child: Text(
                                                                      state
                                                                          .financial_list[
                                                                              index]
                                                                          .expanded_list[
                                                                              index2]
                                                                          .jobStatus,
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    })
                                              ],
                                            );

                                            // );
                                          }),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ]),
        ));
  }
}
