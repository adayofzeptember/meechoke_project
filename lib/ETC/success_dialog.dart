import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meechoke_project/screens/Jobs/1.%20Main%20Pages%20List/tab_main.dart';
import 'package:page_transition/page_transition.dart';

Future<void> SuccessMessage_Dialog(
    BuildContext context, String message, String check) async {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            scrollable: true, //! <-- Set it to true
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            contentPadding: const EdgeInsets.all(20),
            content: Center(
              child: Column(
                children: [
                  SvgPicture.asset('assets/images/circle-check.svg'),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    message,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ));
      });

  Future.delayed(const Duration(seconds: 2), () {
    if (check == 'ส่งแจ้ง') {
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    } else {
      Navigator.pushReplacement(
        context,
        PageTransition(
            duration: const Duration(milliseconds: 500),
            type: PageTransitionType.fade,
            child: Job_Lists(
              toCheck: 1,
            )),
      );
    }
  });
}
