import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meechoke_project/ETC/app_color.dart';

class Allience_Interested_Works extends StatelessWidget {
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
                            "Date Time",
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
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: [
                                  Text(
                                    'ราคางาน: ',
                                    style: TextStyle(
                                        color: Palette.thisBlue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '9,999 บาท',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
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
                                              Text('จุดรับสินค้า',
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
                                                  '',
                                                  overflow: TextOverflow.ellipsis,
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
                                          Text("โรงงาน 2 ",
                                              overflow: TextOverflow.fade,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
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
                                              Text('จุดรับสินค้า',
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
                                                  '',
                                                  overflow: TextOverflow.ellipsis,
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
                                          Text("โรงงาน 2 ",
                                              overflow: TextOverflow.fade,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  )),
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
