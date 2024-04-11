import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meechoke_project/ETC/app_color.dart';

class Fuel_Done extends StatelessWidget {
  const Fuel_Done({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 237, 240),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
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
                          'วันที่สั่งเติddม ',
                          style: TextStyle(),
                        ),
                        Text(
                          '10 พ.ย. 2565 08:00',
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
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'JO65/47416',
                              style: TextStyle(
                                  color: Palette.thisBlue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 233, 196, 0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 8, 12, 8),
                                child: SizedBox(
                                  width: 130,
                                  child: Text(
                                    'ยังไม่ได้เติม',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
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
                                width: 130, child: Text('เลขที่ใบสั่งเติม :')),
                            SizedBox(
                              width: 50,
                            ),
                            Text(
                              '111',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            SizedBox(width: 130, child: Text('สถานที่เติม :')),
                            SizedBox(
                              width: 50,
                            ),
                            Text(
                              '111. ไม่ระบุ',
                              style: TextStyle(fontWeight: FontWeight.bold),
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
                                child: Text('เชื้อเพลิงที่สั่งเติม :')),
                            SizedBox(
                              width: 50,
                            ),
                            Text(
                              'ดีเซล B20',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            SizedBox(
                                width: 130, child: Text('ปริมาณ (ลิตร/กก.) :')),
                            SizedBox(
                              width: 50,
                            ),
                            Text(
                              '10 ลิตร',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            SizedBox(
                                width: 130, child: Text('จำนวนเงิน (บาท) :')),
                            SizedBox(
                              width: 50,
                            ),
                            Text(
                              '200',
                              style: TextStyle(fontWeight: FontWeight.bold),
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
                          children: [
                            SizedBox(
                                width: 130, child: Text('จำนวนเงิน (บาท) :')),
                            SizedBox(
                              width: 50,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: Text(
                                'น้ำตาลครบุรี',
                                overflow: TextOverflow.clip,
                                maxLines: 3,
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
                        Row(
                          children: [
                            SizedBox(width: 130, child: Text('จุดส่งสินค้า :')),
                            SizedBox(
                              width: 50,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: Text(
                                'นครราชสีมา',
                                overflow: TextOverflow.clip,
                                maxLines: 3,
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
                        Row(
                          children: [
                            SizedBox(width: 130, child: Text('หมายเหตุ :')),
                            SizedBox(
                              width: 50,
                            ),
                            Text(
                              '-',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
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
      ),
    );
  }
}
