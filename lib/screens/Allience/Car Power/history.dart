import 'package:flutter/material.dart';
import 'package:meechoke_project/ETC/app_color.dart';

class CarPower_History extends StatefulWidget {
  @override
  _CarPower_HistoryState createState() => _CarPower_HistoryState();
}

class _CarPower_HistoryState extends State<CarPower_History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 237, 240),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
        child: Column(
          children: [
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
                        '4 ล้อพ่วง',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Palette.thisBlue,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '4 ล้อพ่วง รูปแบบที่ 1',
                        style: TextStyle(
                          fontSize: 18,
                          color: Palette.theGrey,
                        ),
                      ),
                      Text(
                        '2 คัน',
                        style: TextStyle(
                          fontSize: 18,
                          color: Palette.theGrey,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 80,
                    // Adjust height to match the design
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                          color: Palette.someRed,
                          width: 2), // Border color and width
                    ),
                    child: IconButton(
                      icon: Icon(Icons.delete),
                      color: Palette.someRed,

                      iconSize: 30, // Adjust icon size if needed
                      onPressed: () {
                        // Add delete functionality here
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
