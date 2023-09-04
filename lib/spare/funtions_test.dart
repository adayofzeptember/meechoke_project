import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';
import '../about image/image_camera.dart';

class Main_Menu_Page extends StatefulWidget {
  const Main_Menu_Page({super.key});

  @override
  State<Main_Menu_Page> createState() => _Main_Menu_PageState();
}

class _Main_Menu_PageState extends State<Main_Menu_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Color.fromARGB(255, 83, 145, 216),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Idea(s)',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 120, 171, 230),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'MEECHOKE',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                'Logistic Management System',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () async {},
                child: Text('Menu Table'),
              ),
              ElevatedButton(
                onPressed: () async {
                  String lat = '13.7563';
                  String long = '100.5018';
                  openMap(lat, long);
                },
                child: Text('เปิดแผนที่'),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    PageTransition(
                        duration: const Duration(milliseconds: 500),
                        type: PageTransitionType.fade,
                        child: CameraImagePicker()),
                  );
                },
                child: Text('กล้อง'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> openMap(String latitude, String longitude) async {
  String url =
      'https://www.google.com/maps/search/?api=1&query=${latitude},${longitude}';
  try {
    await launch(
      url,
    );
  } catch (e) {
    print(e.toString());
  }
}
