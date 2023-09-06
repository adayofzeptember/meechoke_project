import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../about image/image_camera.dart';

class OnGoing extends StatefulWidget {
  @override
  _OnGoingState createState() => _OnGoingState();
}

class _OnGoingState extends State<OnGoing> {
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
            Icons.home,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'งาน',
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
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    SvgPicture.asset(
                      'assets/images/dest.svg',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "จุดรับสินค้า",
                      style: TextStyle(
                          color: Color.fromARGB(255, 97, 97, 97),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.pin_drop,
                          color: Colors.red,
                        ),
                        Text(
                          "โรงน้ำตาลครบุรี อ.ครบุรี จ.นครราชสีมา",
                          style: TextStyle(
                              color: Palette.thisBlue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 174, 210, 252),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                "ควรถึงก่อนเวลา",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 97, 97, 97),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "17.00 น.",
                                style: TextStyle(
                                    color: Palette.thisBlue,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        elevation: 0,
                        // side: BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                    onPressed: () {
                      _onAlert(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: const Text(
                          "ถึงจุดส่งสินค้า",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        elevation: 0,
                        // side: BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: const Text(
                          "กลับสู่หน้าหลัก",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Palette.thisBlue,
                              fontSize: 15),
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

_onAlert(context) {
  var alertStyle = AlertStyle(
    isCloseButton: false,
    isOverlayTapDismiss: true,
    descStyle: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Sarabun'),
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: TextStyle(
      color: Colors.red,
    ),
    animationType: AnimationType.grow,
    overlayColor: Color(0x55000000),
    alertElevation: 0,
  );
  //!
  Alert(
    context: context,
    style: alertStyle,
    // type: AlertType.warning,
    // title: "RFLUTTER ALERT",
    // desc: "ต้องการรับงานนี้",
    content: SizedBox(
      child: Center(
          child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          SvgPicture.asset(
            'assets/images/warn.svg',
            fit: BoxFit.fill,
          ),
          // Icon(
          //   Icons.warning_rounded,
          //   size: 50,
          //   color: Color.fromARGB(255, 97, 97, 97),
          // ),
          SizedBox(height: 10),
          Text(
            'ถึงจุดส่งสินค้า',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 97, 97, 97)),
          ),
        ],
      )),
    ),
    buttons: [
      DialogButton(
        child: Text(
          "ยกเลิก",
          style:
              TextStyle(color: Color.fromARGB(255, 97, 97, 97), fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        color: Color.fromARGB(255, 237, 237, 237),
      ),
      DialogButton(
        child: Text(
          "ยืนยัน",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => Navigator.push(
          context,
          PageTransition(
              duration: const Duration(milliseconds: 500),
              type: PageTransitionType.fade,
              child: CameraImagePicker()),
        ),
        color: Color.fromARGB(255, 9, 154, 75),
      ),
    ],
  ).show();
}
