import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/bloc/Fuel/fuel_bloc.dart';

class Fuel_NotDone extends StatelessWidget {
  const Fuel_NotDone({super.key});

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
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<FuelBloc, FuelState>(
              builder: (context, state) {
                if (state.status1 == 0)
                  return Center(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      CircularProgressIndicator(
                        color: Palette.thisBlue,
                      ),
                    ],
                  ));
                else if (state.status1 == 2) {
                  return Center(
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
                    ),
                  );
                } else if (state.status1 == 1 && state.fuel_notYet_list.length == 0) {
                  return Center(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      SvgPicture.asset(
                        'assets/images/nojob.svg',
                      ),
                      Text(
                        'ไม่มีรายการ',
                        style: TextStyle(
                            color: Palette.thisBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  ));
                } 
                  return ListView.builder(
                    primary: true,
                    itemCount: state.fuel_notYet_list.length,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          print(state.fuel_notYet_list[index].id);
                          context.read<FuelBloc>().add(Load_Fuel_Info(
                              checkPage: 'notfill',
                              context: context,
                              joNumber: state.fuel_notYet_list[index].id));
                        },
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        15, 15, 15, 5),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/images/icon_job.svg',
                                                  fit: BoxFit.contain,
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  state.fuel_notYet_list[index]
                                                      .jo_number,
                                                  style: TextStyle(
                                                      color: (state
                                                                  .fuel_notYet_list[
                                                                      index]
                                                                  .jo_number ==
                                                              'ไม่มี JO')
                                                          ? Palette.someRed
                                                          : Palette.thisBlue,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 233, 196, 0),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        12, 8, 12, 8),
                                                child: SizedBox(
                                                  width: 130,
                                                  child: Text(
                                                    state
                                                        .fuel_notYet_list[index]
                                                        .status,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                                child: Text(
                                                    'เลขที่ใบสั่งเติม : ')),
                                            Text(
                                              state.fuel_notYet_list[index]
                                                  .doc_number,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Palette.thisBlue),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            // SvgPicture.asset(
                                            //   'assets/images/icon_job.svg',
                                            //   fit: BoxFit.contain,
                                            // ),
                                            // SizedBox(
                                            //   width: 3,
                                            // ),
                                            Row(
                                              children: [
                                                Text(
                                                  'วันที่สั่งเติม: ',
                                                  style: TextStyle(),
                                                ),
                                                Text(
                                                  state.fuel_notYet_list[index]
                                                      .date,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Palette.thisBlue),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Divider(),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Palette.mainBackgroud,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/images/fuel.svg',
                                                  fit: BoxFit.fill,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  state.fuel_notYet_list[index]
                                                      .location_name,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Palette.thisBlue,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                                width: 130,
                                                child: Text(
                                                    'ปริมาณ (ลิตร/กก.) :')),
                                            SizedBox(
                                              width: 50,
                                            ),
                                            Text(
                                              state.fuel_notYet_list[index]
                                                  .volum,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                                width: 130,
                                                child: Text(
                                                  'หมายเหตุ :',
                                                )),
                                            SizedBox(
                                              width: 50,
                                            ),
                                            Text(
                                              '*' +
                                                  state.fuel_notYet_list[index]
                                                      .remark,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                // Container(
                //   child: Column(
                //     children: <Widget>[
                //       Row(
                //         children: [
                //           SvgPicture.asset(
                //             'assets/images/icon_job.svg',
                //             fit: BoxFit.contain,
                //           ),
                //           SizedBox(
                //             width: 3,
                //           ),
                //           Row(
                //             children: [
                //               Text(
                //                 'วันที่สั่งเติม ',
                //                 style: TextStyle(),
                //               ),
                //               Text(
                //                 '10 พ.ย. 2565 08:00',
                //                 style: TextStyle(
                //                     fontWeight: FontWeight.bold,
                //                     color: Palette.thisBlue),
                //               ),
                //             ],
                //           )
                //         ],
                //       ),
                //       SizedBox(
                //         height: 8,
                //       ),
                //       Container(
                //         decoration: BoxDecoration(
                //             color: Colors.white,
                //             borderRadius: BorderRadius.all(Radius.circular(20))),
                //         child: Padding(
                //           padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
                //           child: Column(
                //             children: [
                //               Row(
                //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   Text(
                //                     'JO65/47416',
                //                     style: TextStyle(
                //                         color: Palette.thisBlue,
                //                         fontWeight: FontWeight.bold),
                //                   ),
                //                   Container(
                //                     decoration: BoxDecoration(
                //                         color: Color.fromARGB(255, 233, 196, 0),
                //                         borderRadius: BorderRadius.all(
                //                             Radius.circular(20))),
                //                     child: Padding(
                //                       padding:
                //                           const EdgeInsets.fromLTRB(12, 8, 12, 8),
                //                       child: SizedBox(
                //                         width: 130,
                //                         child: Text(
                //                           'ยังไม่ได้เติม',
                //                           textAlign: TextAlign.center,
                //                           style: TextStyle(
                //                               color: Colors.white,
                //                               fontWeight: FontWeight.bold),
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //               SizedBox(
                //                 height: 10,
                //               ),
                //               Row(
                //                 children: [
                //                   SizedBox(
                //                       width: 130,
                //                       child: Text('เลขที่ใบสั่งเติม :')),
                //                   SizedBox(
                //                     width: 50,
                //                   ),
                //                   Text(
                //                     '111',
                //                     style: TextStyle(fontWeight: FontWeight.bold),
                //                   )
                //                 ],
                //               ),
                //               SizedBox(
                //                 height: 8,
                //               ),
                //               Row(
                //                 children: [
                //                   SizedBox(
                //                       width: 130, child: Text('สถานที่เติม :')),
                //                   SizedBox(
                //                     width: 50,
                //                   ),
                //                   Text(
                //                     '111. ไม่ระบุ',
                //                     style: TextStyle(fontWeight: FontWeight.bold),
                //                   )
                //                 ],
                //               ),
                //               SizedBox(
                //                 height: 8,
                //               ),
                //               Row(
                //                 children: [
                //                   SizedBox(
                //                       width: 130,
                //                       child: Text('เชื้อเพลิงที่สั่งเติม :')),
                //                   SizedBox(
                //                     width: 50,
                //                   ),
                //                   Text(
                //                     'ดีเซล B20',
                //                     style: TextStyle(fontWeight: FontWeight.bold),
                //                   )
                //                 ],
                //               ),
                //               SizedBox(
                //                 height: 8,
                //               ),
                //               Row(
                //                 children: [
                //                   SizedBox(
                //                       width: 130,
                //                       child: Text('ปริมาณ (ลิตร/กก.) :')),
                //                   SizedBox(
                //                     width: 50,
                //                   ),
                //                   Text(
                //                     '10 ลิตร',
                //                     style: TextStyle(fontWeight: FontWeight.bold),
                //                   )
                //                 ],
                //               ),
                //               SizedBox(
                //                 height: 8,
                //               ),
                //               Row(
                //                 children: [
                //                   SizedBox(
                //                       width: 130,
                //                       child: Text('จำนวนเงิน (บาท) :')),
                //                   SizedBox(
                //                     width: 50,
                //                   ),
                //                   Text(
                //                     '200',
                //                     style: TextStyle(fontWeight: FontWeight.bold),
                //                   )
                //                 ],
                //               ),
                //               SizedBox(
                //                 height: 8,
                //               ),
                //               Divider(),
                //               SizedBox(
                //                 height: 5,
                //               ),
                //               Row(
                //                 children: [
                //                   SizedBox(
                //                       width: 130,
                //                       child: Text('จำนวนเงิน (บาท) :')),
                //                   SizedBox(
                //                     width: 50,
                //                   ),
                //                   SizedBox(
                //                     width:
                //                         MediaQuery.of(context).size.width * 0.35,
                //                     child: Text(
                //                       'น้ำตาลครบุรี',
                //                       overflow: TextOverflow.clip,
                //                       maxLines: 3,
                //                       style: TextStyle(
                //                           color: Colors.black,
                //                           fontWeight: FontWeight.bold),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //               SizedBox(
                //                 height: 8,
                //               ),
                //               Row(
                //                 children: [
                //                   SizedBox(
                //                       width: 130, child: Text('จุดส่งสินค้า :')),
                //                   SizedBox(
                //                     width: 50,
                //                   ),
                //                   SizedBox(
                //                     width:
                //                         MediaQuery.of(context).size.width * 0.35,
                //                     child: Text(
                //                       'นครราชสีมา',
                //                       overflow: TextOverflow.clip,
                //                       maxLines: 3,
                //                       style: TextStyle(
                //                           color: Colors.black,
                //                           fontWeight: FontWeight.bold),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //               SizedBox(
                //                 height: 8,
                //               ),
                //               Divider(),
                //               Row(
                //                 children: [
                //                   SizedBox(width: 130, child: Text('หมายเหตุ :')),
                //                   SizedBox(
                //                     width: 50,
                //                   ),
                //                   Text(
                //                     '-',
                //                     style: TextStyle(
                //                         fontWeight: FontWeight.bold,
                //                         color: Colors.red),
                //                   )
                //                 ],
                //               ),
                //             ],
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // );
              },
            ),
          ),
        ),
      ),
    );
  }
}
