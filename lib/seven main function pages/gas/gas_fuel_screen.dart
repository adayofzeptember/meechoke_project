import 'package:flutter/material.dart';
import 'package:meechoke_project/seven%20main%20function%20pages/gas/gas_info.dart';
import 'package:page_transition/page_transition.dart';

class GasFuel_Screen extends StatefulWidget {
  const GasFuel_Screen({super.key});

  @override
  State<GasFuel_Screen> createState() => _GasFuel_ScreenState();
}

class _GasFuel_ScreenState extends State<GasFuel_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.call_outlined,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 83, 145, 216),
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
          'เติมน้ำมัน',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 119, 169, 226),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
          child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Column(
                children: [
                  //*
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              duration: const Duration(milliseconds: 500),
                              type: PageTransitionType.fade,
                              child: GasFuel_Info()),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'วันที่สั่งเติม',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      '2019-08-14',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ]),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'No. JO99/98958',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 33, 107, 243),
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: Text(
                                        ' ยังไม่ได้เติม ',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 17),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                child: Divider(
                                    thickness: 1,
                                    color: Color.fromARGB(255, 212, 212, 212)),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'เลขที่ใบสั่งเติม : ',
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 126, 126, 126),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        'สถานที่เติม :',
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 126, 126, 126),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        'เชื้อเพลิงสั่งเติม :',
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 126, 126, 126),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        'ปริมาณสั่งเติม (ลิตร/กก.) :',
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 126, 126, 126),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        'จำนวนเงิน :',
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 126, 126, 126),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        'Job ID :',
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 126, 126, 126),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        '*หมายเหตุ : ',
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 126, 126, 126),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '185FS180',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 51, 169, 216),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        'ไม่ระบุ',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 51, 169, 216),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        'NGV',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 51, 169, 216),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        '196.6',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 51, 169, 216),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        '3,156.90 บาท',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 51, 169, 216),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        'JO 88/8989',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 51, 169, 216),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        ' ',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 51, 169, 216),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'วันที่สั่งเติม',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    '2019-08-14',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'No. JO99/98958',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 33, 107, 243),
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Text(
                                      ' ยังไม่ได้เติม ',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: Divider(
                                  thickness: 1,
                                  color: Color.fromARGB(255, 212, 212, 212)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'เลขที่ใบสั่งเติม : ',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 126, 126, 126),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'สถานที่เติม :',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 126, 126, 126),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'เชื้อเพลิงสั่งเติม :',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 126, 126, 126),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'ปริมาณสั่งเติม (ลิตร/กก.) :',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 126, 126, 126),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'จำนวนเงิน :',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 126, 126, 126),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'Job ID :',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 126, 126, 126),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      '*หมายเหตุ : ',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 126, 126, 126),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '185FS180',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 51, 169, 216),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'ไม่ระบุ',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 51, 169, 216),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'NGV',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 51, 169, 216),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      '196.6',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 51, 169, 216),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      '3,156.90 บาท',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 51, 169, 216),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'JO 88/8989',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 51, 169, 216),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      ' ',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 51, 169, 216),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'วันที่สั่งเติม',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    '2019-08-14',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'No. JO99/98958',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 33, 107, 243),
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Text(
                                      ' ยังไม่ได้เติม ',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: Divider(
                                  thickness: 1,
                                  color: Color.fromARGB(255, 212, 212, 212)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'เลขที่ใบสั่งเติม : ',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 126, 126, 126),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'สถานที่เติม :',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 126, 126, 126),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'เชื้อเพลิงสั่งเติม :',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 126, 126, 126),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'ปริมาณสั่งเติม (ลิตร/กก.) :',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 126, 126, 126),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'จำนวนเงิน :',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 126, 126, 126),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'Job ID :',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 126, 126, 126),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      '*หมายเหตุ : ',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 126, 126, 126),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '185FS180',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 51, 169, 216),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'ไม่ระบุ',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 51, 169, 216),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'NGV',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 51, 169, 216),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      '196.6',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 51, 169, 216),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      '3,156.90 บาท',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 51, 169, 216),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'JO 88/8989',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 51, 169, 216),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      ' ',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 51, 169, 216),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
