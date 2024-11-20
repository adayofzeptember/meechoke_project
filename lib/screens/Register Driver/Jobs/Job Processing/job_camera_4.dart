// ignore_for_file: camel_case_types
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meechoke_project/ETC/app_color.dart';

// ignore: must_be_immutable
class Job_Camera extends StatefulWidget {
  bool check;
  Job_Camera({required this.check}) : super();
  @override
  _Job_CameraState createState() => _Job_CameraState();
}

class _Job_CameraState extends State<Job_Camera> {
  File? _image;

  @override
  void initState() {
    _pickImageFromCamera();
    super.initState();
  }

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
              Icons.arrow_back_ios,
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
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              _image == null
                  ? Container(
                      color: Colors.red,
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: double.infinity,
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: double.infinity,
                      child: Image.file(
                        _image!,
                        fit: BoxFit.cover,
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            elevation: 0,
                            side: BorderSide(color: Palette.thisBlue),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                        onPressed: _pickImageFromCamera,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: const Text(
                            'ถ่ายใหม่',
                            style: TextStyle(
                                color: Palette.thisBlue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            elevation: 0,
                            // side: BorderSide(color: Colors.white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                        onPressed: () {
                       
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: const Text(
                            'อัปโหลด',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Future<void> _pickImageFromCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }
}
