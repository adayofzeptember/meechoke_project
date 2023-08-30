// ignore_for_file: unnecessary_null_comparison

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Test_ImgPicker extends StatefulWidget {
  @override
  State<Test_ImgPicker> createState() => _Test_ImgPickerState();
}

class _Test_ImgPickerState extends State<Test_ImgPicker> {
  final ImagePicker imgpicker = ImagePicker();

  List<XFile>? imagefiles;

  openImages() async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      if (pickedfiles != null) {
        imagefiles = pickedfiles;
        setState(() {});
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 178, 129, 197),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text('Images'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    openImages();
                  },
                  child: const Text("เลือกรูป")),
              const Divider(),
              const Text("แสดงรายการรูปภาพ:"),
              const Divider(),
              imagefiles != null
                  ? Wrap(
                      children: imagefiles!.map((imageone) {
                        return Card(
                          child: Container(
                            height: 100,
                            width: 100,
                            child: Image.file(
                              File(imageone.path),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }).toList(),
                    )
                  : Container()
            ],
          ),
        ));
  }
}
