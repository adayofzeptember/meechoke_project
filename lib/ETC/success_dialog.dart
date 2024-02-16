import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<void> SuccessMessage_Dialog(BuildContext context, String message) async {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            scrollable: true, // <-- Set it to true
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
    Navigator.of(context).pop(); // Close the AlertDialog
  });
}
