import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/screens/fuel%20screens/fuel_fill_form_2.dart';
import 'package:page_transition/page_transition.dart';

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
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.person,
                color: Palette.thisBlue,
                size: 15,
              ),
            ),
          ),
        ],
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
          'เติมเชื้อเพลิง',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 228, 237, 240),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
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
                      child: 
                      Row(
                        children: [
                          SvgPicture.asset('assets/images/icon_job.svg',
                              fit: BoxFit.contain, color: Colors.white),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            'วันที่สั่งเติม 10 พ.ย. 2565 08:00',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
                    child: Row(
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
                            padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 10, 0),
                    child: Row(
                      children: [
                        SizedBox(width: 130, child: Text('เลขที่ใบสั่งเติม :')),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          '111',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.32,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.topLeft,
                        colors: [
                          Palette.thisBlue,
                          Palette.thisBlue,
                          Color.fromARGB(238, 4, 75, 163),
                        ],
                      ),
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
                              fontSize: 15,
                              color: Color.fromARGB(255, 190, 190, 190)),
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
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text(
                                '9686 เชลล์เขาหินซ้อน เขาหินซ้อน พนมสารคาม ฉะเชิงเทรา',
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
                      height: MediaQuery.of(context).size.height * 0.15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
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
                                Text(
                                  'ดีเซล',
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
                                    width: 180,
                                    child: Text('ประเภทเชื้อเพลิงเติม:')),
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  'B20',
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
                                    width: 180,
                                    child: Text('ปริมาณสั่งเติม (ลิตร/กก.):')),
                                SizedBox(
                                  width: 30,
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
                                    width: 180,
                                    child: Text('จำนวนเงิน (บาท):')),
                                SizedBox(
                                  width: 30,
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
                                    width: 180, child: Text('เลขที่บัตร:')),
                                SizedBox(
                                  width: 30,
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
                            Row(
                              children: [
                                SizedBox(
                                    width: 180,
                                    child: Text('วงเงินคงเหลือ (บาท):')),
                                SizedBox(
                                  width: 30,
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
                                    width: 180, child: Text('จุดรับสินค้า:')),
                                SizedBox(
                                  width: 30,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
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
                            Row(
                              children: [
                                SizedBox(
                                    width: 180, child: Text('จุดส่งสินค้า:')),
                                SizedBox(
                                  width: 30,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
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
                                SizedBox(width: 180, child: Text('หมายเหตุ :')),
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
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Palette.thisBlue,
                  elevation: 0,
                  // side: BorderSide(color: Colors.white),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
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
                padding: const EdgeInsets.all(20.0),
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
            ),
          ],
        ),
      ),
    );
  }
}
