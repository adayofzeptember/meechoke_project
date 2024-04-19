import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/bloc/Fuel/fuel_bloc.dart';

class Fuel_Filled extends StatelessWidget {
  Fuel_Filled({super.key});

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
                } else if (state.status1 == 1 &&
                    state.fuel_filled_list.isEmpty) {
                  return Center(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'ไม่มีรายการเติมเชื้อเพลิง',
                        style: TextStyle(
                            color: Palette.thisBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  ));
                } else
                  return ListView.builder(
                    primary: true,
                    itemCount: state.fuel_filled_list.length,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          print(state.fuel_filled_list[index].id);
                          context.read<FuelBloc>().add(Load_Fuel_Info(
                            checkPage: 'filled',
                            context: context,
                              joNumber:
                                  state.fuel_filled_list[index].id));
                        },
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/icon_job.svg',
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'วันที่สั่งเติม ',
                                          style: TextStyle(),
                                        ),
                                        Text(
                                          state.fuel_filled_list[index].date,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Palette.thisBlue),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
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
                                        15, 15, 15, 20),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              state.fuel_filled_list[index]
                                                  .jo_number,
                                              style: TextStyle(
                                                  color: (state
                                                              .fuel_filled_list[
                                                                  index]
                                                              .jo_number ==
                                                          'ไม่มี JO')
                                                      ? Palette.someRed
                                                      : Palette.thisBlue,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.green,
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
                                                        .fuel_filled_list[index]
                                                        .status,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white,
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
                                                width: 130,
                                                child:
                                                    Text('เลขที่ใบสั่งเติม :')),
                                            SizedBox(
                                              width: 50,
                                            ),
                                            Text(
                                              state.fuel_filled_list[index]
                                                  .doc_number,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Palette.thisBlue),
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
                                                  state.fuel_filled_list[index]
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
                                              state.fuel_filled_list[index]
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
                                                  state.fuel_filled_list[index]
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
           
              },
            ),
          ),
        ),
      ),
    );
  }
}
