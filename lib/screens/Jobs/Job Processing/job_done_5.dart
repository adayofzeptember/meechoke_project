import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../../menu_screen.dart';
 

class Job_Done extends StatefulWidget {
  @override
  _Job_DoneState createState() => _Job_DoneState();
}

class _Job_DoneState extends State<Job_Done> {
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
                      height: 10,
                    ),
                    SvgPicture.asset('assets/images/jobdone.svg'),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "งานทั้งหมดสำเร็จแล้ว",
                      style: TextStyle(
                          color: Color.fromARGB(255, 97, 97, 97),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 171, 204, 241),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                "เวลาทำงานทั้งหมด",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 97, 97, 97),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "06:25:15",
                                style: TextStyle(
                                    color: Palette.thisBlue,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            // if (widget.check == "fg")
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
                      openAlertBox(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: const Text(
                          "เสร็จงาน",
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
          ],
        ),
      ),
    );
  }
}

openAlertBox(context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true, // <-- Set it to true

          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          contentPadding: EdgeInsets.only(top: 0.0),
          content: Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 30,
              ),
              SvgPicture.asset(
                'assets/images/done.svg',
                fit: BoxFit.fill,
              ),
              SizedBox(height: 10),
              Text(
                'บันทึกสำเร็จ',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 97, 97, 97)),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          )),
        );
      });

  Future.delayed(Duration(seconds: 2), () {
     Navigator.pushReplacement(
          context,
          PageTransition(
              duration: const Duration(milliseconds: 500),
              type: PageTransitionType.fade,
              child: MainMenu_Page()),
        );
  });
}

_onAlerJobDone(context) {
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
    content: SizedBox(
      child: Center(
          child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          SvgPicture.asset(
            'assets/images/done.svg',
            fit: BoxFit.fill,
          ),
          SizedBox(height: 10),
          Text(
            'บันทึกสำเร็จ',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 97, 97, 97)),
          ),
        ],
      )),
    ),
  ).show();
}
