import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/ETC/curency.dart';
import 'package:meechoke_project/bloc/Fuel/fuel_bloc.dart';
import 'package:meechoke_project/screens/Fuel/fill_form.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quiver/collection.dart';

class Fuel_Detail extends StatefulWidget {
  @override
  _Fuel_DetailState createState() => _Fuel_DetailState();
}

class _Fuel_DetailState extends State<Fuel_Detail> {
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
          ' ',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 228, 237, 240),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<FuelBloc, FuelState>(
            builder: (context, state) {
              if (state.status2_info == 0) {
                return Center(
                    child: Column(
                  children: [
                    Text('data'),
                    Row(
                      children: [
                        Text('data'),
                        Row(
                          children: [
                            Container(
                              child: Center(
                                child: Text('Controller pAnel'),
                              ),
                            )
                          ],
                        ),
                        Container(
                          child: Text('Conmkdfuvcvtc'),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CircularProgressIndicator(
                      color: Palette.thisBlue,
                    ),
                  ],
                ));
              } else if (state.status2_info == 2) {
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
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Palette.thisBlue,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/images/icon_job.svg',
                                    fit: BoxFit.contain, color: Colors.white),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  state.fuelInfo.date,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(''),
                          ],
                        ),
                        Container(
                          child: Column(
                            children: [Text('data')],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.fuelInfo.jo_number,
                                style: TextStyle(
                                    color: Palette.thisBlue,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(),
                              Container(
                                decoration: BoxDecoration(
                                    color:
                                        (state.fuelInfo.status == 'ยังไม่เติม')
                                            ? Color.fromARGB(255, 233, 196, 0)
                                            : Colors.green,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 8, 12, 8),
                                  child: SizedBox(
                                    width: 130,
                                    child: Text(
                                      state.fuelInfo.status,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: (state.fuelInfo.status ==
                                                  'ยังไม่เติม')
                                              ? Colors.black
                                              : Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  children: [Text('data')],
                                ),
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        children: [],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text('data'),
                                  Container(
                                    child: Text('data'),
                                  ),
                                  Row(
                                    children: [ListView()],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 5, 10, 0),
                          child: Row(
                            children: [
                              SizedBox(
                                  width: 130,
                                  child: Text('เลขที่ใบสั่งเติม :')),
                              SizedBox(
                                width: 50,
                              ),
                              Text(
                                state.fuelInfo.doc_number,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Text('data'),
                      Row(
                        children: [
                          Container(
                              child: Row(
                            children: [Container()],
                          ))
                        ],
                      )
                    ],
                  ),
                  Container(),
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.32,
                        decoration: BoxDecoration(
                            color: Palette.thisBlue,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'สถานที่เติม:',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.pin_drop_outlined,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: Text(
                                      state.fuelInfo.location_name,
                                      overflow: TextOverflow.clip,
                                      maxLines: 3,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.13,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(30),
                                    bottomLeft: Radius.circular(30))),
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                          width: 180,
                                          child: Text('เชื้อเพลิงสั่งเติม:')),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.23,
                                        child: Text(
                                          state.fuelInfo.fuelType,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                          width: 180,
                                          child: Text('ประเภทเชื้อเพลิงเติม:')),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Text(
                                        state.fuelInfo.fuelGroup,
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
                                          width: 180,
                                          child: Text(
                                              'ปริมาณสั่งเติม (ลิตร/กก.):')),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Text(
                                        (state.fuelInfo.volum.toString() ==
                                                'null')
                                            ? '-'
                                            : state.fuelInfo.volum.toString(),
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
                                          width: 180,
                                          child: Text('จำนวนเงิน (บาท):')),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Text(
                                        formatNumber(state.fuelInfo.totalprice)
                                            .toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        child: Text('data'),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                          width: 180,
                                          child: Text('วงเงินคงเหลือ (บาท):')),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Text(
                                        formatNumber(
                                            state.fuelInfo.creditRemains),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Divider(),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('จุดรับสินค้า: '),
                                      SizedBox(
                                        width: 250,
                                        child: Text(
                                          state.fuelInfo.source.toString(),
                                          overflow: TextOverflow.clip,
                                          maxLines: 2,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('จุดส่งสินค้า: '),
                                      SizedBox(
                                        width: 250,
                                        child: Text(
                                          state.fuelInfo.destination.toString(),
                                          overflow: TextOverflow.clip,
                                          maxLines: 2,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Divider(),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "*" + state.fuelInfo.remark,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  (state.fuelInfo.status == 'ยังไม่เติม')
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Palette.thisBlue,
                              elevation: 0,
                              // side: BorderSide(color: Colors.white),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                  duration: const Duration(milliseconds: 500),
                                  type: PageTransitionType.fade,
                                  child: Fuel_fillForm()),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: const Text(
                                "เติมเชื้อเพลิง",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                        )
                      : Container()
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
