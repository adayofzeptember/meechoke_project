import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meechoke_project/ETC/app_color.dart';

import '../../ETC/shape_painter.dart';

class Job_Details extends StatefulWidget {
  @override
  _Job_DetailsState createState() => _Job_DetailsState();
}

class _Job_DetailsState extends State<Job_Details>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.thisBlue,
          // flexibleSpace: Container(
          //   decoration: const BoxDecoration(
          //     gradient: LinearGradient(
          //         begin: Alignment.centerLeft,
          //         end: Alignment.centerRight,
          //         colors: <Color>[
          //           Color.fromARGB(236, 233, 65, 65),
          //           Color.fromARGB(237, 63, 131, 219),
          //           Palette.thisBlue,
          //         ]),
          //   ),
          // ),
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
            'ใบสั่งงานทั่วไป',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 228, 237, 240),
        body: SingleChildScrollView(
          child: Column(children: [
            Stack(
              children: [
                CustomPaint(
                  painter: ShapesPainter(),
                  child: Container(height: 200),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Stack(
                    children: <Widget>[
                      SvgPicture.asset(
                        'assets/images/card_large.svg',
                        width: MediaQuery.of(context).size.width,
                      ),
                      Positioned(
                        top: 20,
                        left: 25,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 15, 8, 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'JO65/47416',
                                      style: TextStyle(
                                          color: Palette.thisBlue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 114, 57, 234),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            12, 8, 12, 8),
                                        child: SizedBox(
                                          width: 120,
                                          child: Text(
                                            'ยังไม่รับงาน',
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
                                DottedLine(
                                  dashGradient: [
                                    Colors.red,
                                    Colors.blue,
                                  ],
                                  dashLength: 10,
                                  lineThickness: 2,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'ลูกค้า : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 66, 66, 66)),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'สินค้า : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 66, 66, 66)),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'จำนวนที่รับ : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 66, 66, 66)),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'จำนวนพาเลท : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 66, 66, 66)),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'ลักษณะงาน : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 66, 66, 66)),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'ผู้ติดต่อ : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 66, 66, 66)),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'เบอร์โทรผู้ติดต่อ : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 66, 66, 66)),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'ขนส่งในนาม : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 66, 66, 66)),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'เก็บเงินสดจากลููกค้า : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 66, 66, 66)),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'ระยะทางรวม (กม.) : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 66, 66, 66)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    //!
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35,
                                          child: Text(
                                            'น้ำตาลครบุรี(ครบุรี)',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'น้ำตาลครบุรี(ครบุรี)',
                                          overflow: TextOverflow.fade,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          '32.00 ตัน',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          '0',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'ตามน้ำหนัก',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          '-',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          '-',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'น้ำตาลครบุรี(ครบุรี)',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'ไม่มี',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          '423',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),

                                //?
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      color:
                                          Color.fromARGB(255, 234, 240, 255)),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        15, 25, 15, 25),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/images/allpoints.svg',
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text('จุดรับ'),
                                                SizedBox(width: 5,),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Palette.thisBlue,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20))),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(3, 3, 3, 3),
                                                    child: Text(
                                                      '10 พ.ย. 2023 - 08:00',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                         
                                            Text(
                                              'โรงน้ำตาลครบุรี อ.ครบุรี จ.นครราชสีมา',
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  decorationColor: Colors.blue,
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04,
                                            ),
                                            Row(
                                              children: [
                                                Text('จุดส่ง'),
                                                   SizedBox(width: 5,),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Palette.thisBlue,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20))),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(3, 3, 3, 3),
                                                    child: Text(
                                                      '10 พ.ย. 2023 - 08:00',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'โรงน้ำตาลครบุรี อ.ครบุรี จ.นครราชสีมา',
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  decorationColor: Colors.blue,
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),

                                //*
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'หมายเหตุ : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 66, 66, 66)),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'เบี้ยเลี้ยง : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 66, 66, 66)),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'โอนล่วงหน้า : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 66, 66, 66)),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 65,
                                    ),

                                    //!
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          '11.1',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          '0.00',
                                          overflow: TextOverflow.fade,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          '0.00',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'หมายเหตุ DOD : ',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 66, 66, 66)),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'It is a long established fact that a readffffffffffffffffffffffdhigivadfuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu',
                                        softWrap: false,
                                        maxLines: 5,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
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
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Palette.thisBlue,
                    elevation: 0,
                    // side: BorderSide(color: Colors.white),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                onPressed: () {
                  // _onAlert(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: const Text(
                      "รับงาน",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}

// _onAlert(context) {
//   var alertStyle = AlertStyle(
//     isCloseButton: false,
//     isOverlayTapDismiss: true,
//     descStyle: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Sarabun'),
//     animationDuration: Duration(milliseconds: 400),
//     alertBorder: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(30),
//       side: BorderSide(
//         color: Colors.grey,
//       ),
//     ),
//     titleStyle: TextStyle(
//       color: Colors.red,
//     ),
//     animationType: AnimationType.grow,
//     overlayColor: Color(0x55000000),
//     alertElevation: 0,
//   );
//   //!
//   Alert(
//     context: context,
//     style: alertStyle,
//     // type: AlertType.warning,
//     // title: "RFLUTTER ALERT",
//     // desc: "ต้องการรับงานนี้",
//     content: SizedBox(
//       child: Center(
//           child: Column(
//         children: [
//           SizedBox(
//             height: 10,
//           ),
//           SvgPicture.asset(
//             'assets/images/warn.svg',
//             fit: BoxFit.fill,
//           ),
//           // Icon(
//           //   Icons.warning_rounded,
//           //   size: 50,
//           //   color: Color.fromARGB(255, 97, 97, 97),
//           // ),
//           SizedBox(height: 10),
//           Text(
//             'ต้องการรับงานนี้หรือไม่ ?',
//             style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Color.fromARGB(255, 97, 97, 97)),
//           ),
//         ],
//       )),
//     ),
//     buttons: [
//       DialogButton(
//         child: Text(
//           "ยกเลิก",
//           style:
//               TextStyle(color: Color.fromARGB(255, 97, 97, 97), fontSize: 20),
//         ),
//         onPressed: () => Navigator.pop(context),
//         color: Color.fromARGB(255, 237, 237, 237),
//       ),
//       DialogButton(
//         child: Text(
//           "ยืนยัน",
//           style: TextStyle(color: Colors.white, fontSize: 20),
//         ),
//         onPressed: () => 
//         Navigator.push(
//           context,
//           PageTransition(
//               duration: const Duration(milliseconds: 500),
//               type: PageTransitionType.fade,
//               child: Job_OnGoing()),
//         ),
//         color: Color.fromARGB(255, 9, 154, 75),
//       ),
//     ],
//   ).show();
// }
