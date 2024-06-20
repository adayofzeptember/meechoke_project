// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meechoke_project/ETC/app_color.dart';

class Allience_Docs extends StatefulWidget {
  Allience_Docs() : super();
  @override
  _Allience_DocsState createState() => _Allience_DocsState();
}

class _Allience_DocsState extends State<Allience_Docs> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 54, 120),
                Color.fromARGB(238, 0, 8, 18)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        backgroundColor: Palette.thisBlue,
        automaticallyImplyLeading: false,
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
          'เอกสาร',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 228, 237, 240),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'เอกสารสัญญารับงาน',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Palette.thisBlue,
              ),
            ),
            SizedBox(
              height: 15,
            ),
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
                  '10 พ.ย. 2559 - 11 พ.ย. 2588',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Color.fromARGB(255, 224, 224, 224)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'JO50/1234',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Palette.thisBlue,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'เลขที่สัญญา 4444',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Palette.theGrey,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: Palette.someRed,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Center(
                        child: Text(
                          'ไม่ยินยอม',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Color.fromARGB(255, 224, 224, 224)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'JO99/9998',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Palette.thisBlue,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'เลขที่สัญญา 12345',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Palette.theGrey,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: Palette.theGreen,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Center(
                        child: Text(
                          'ยินยอม',
                          style: TextStyle(color: Colors.white),
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
