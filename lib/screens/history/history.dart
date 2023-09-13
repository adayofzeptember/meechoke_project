// ignore_for_file: camel_case_types, must_be_immutable
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/screens/history/history_detail.dart';
import 'package:page_transition/page_transition.dart';

class History_Page extends StatefulWidget {
  @override
  _History_PageState createState() => _History_PageState();
}

class _History_PageState extends State<History_Page> {
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
          'ประวัติงาน',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 1, 44, 97),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromARGB(255, 172, 211, 255)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'รายได้เดือน พฤษจิกายน',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Palette.thisBlue),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '2,400 บาท',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Palette.thisBlue),
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
                                'จำนวน 3 งาน',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Palette.thisBlue),
                              ),
                            ],
                          )),
                        ))
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/images/icon_job.svg',
                  fit: BoxFit.contain,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  '10 พ.ย. 2565 08:00 - 11 พ.ย. 2565 15:00',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      duration: const Duration(milliseconds: 500),
                      type: PageTransitionType.fade,
                      child: History_Detail()),
                );
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
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(12, 8, 12, 8),
                                    child: Text(
                                      '0.00 บาท',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            DottedLine(
                              dashGradient: [
                                Colors.red,
                                Colors.blue,
                              ],
                              dashLength: 10,
                              lineThickness: 2,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('ลูกค้า: '),
                                Text(
                                  'น้ำตาบครยบุรี',
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
        ),
      ),
    );
  }
}
