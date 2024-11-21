import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meechoke_project/ETC/app_color.dart';

class Allience_Jobs_Confirm extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 228, 237, 240),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RawScrollbar(
            thickness: 8,
            thumbColor: Palette.thisBlue,
            radius: Radius.circular(20),
            child: SingleChildScrollView(
                child: GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/icon_job.svg',
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            "Date Time - Date Time",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '',
                                    style: TextStyle(
                                        color: Palette.thisBlue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 235, 214, 19),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(12, 8, 12, 8),
                                      child: SizedBox(
                                        width: 120,
                                        child: Text(
                                          'ยืนยันงาน',
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
                              const SizedBox(
                                height: 10,
                              ),
                              DottedLine(
                                dashColor: Palette.thisBlue,
                                // dashGradient: const [
                                //   Palette.thisBlue,
                                //   Palette.someRed
                                // ],
                                dashLength: 10,
                                lineThickness: 1,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/pick_up.svg',
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
                                              Text('จุดรับ',
                                                  style: TextStyle(
                                                      color: Palette.thisBlue,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.5,
                                                child: Text(
                                                  "10 พ.ย. 2555",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      decoration: TextDecoration
                                                          .underline,
                                                      decorationColor:
                                                          Colors.blue,
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              Text('โรงงาน G',
                                                  overflow: TextOverflow.fade,
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 133, 133, 133),
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  )),
                              Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/drop.svg',
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
                                              Text('จุดส่ง',
                                                  style: TextStyle(
                                                      color: Palette.thisBlue,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.5,
                                                child: Text(
                                                  "10 พ.ย. 2555",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      decoration: TextDecoration
                                                          .underline,
                                                      decorationColor:
                                                          Colors.blue,
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              Text('โรงงาน A',
                                                  overflow: TextOverflow.fade,
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 133, 133, 133),
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
          ),
        ));
  }
}
