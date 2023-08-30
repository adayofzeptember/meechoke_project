import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraImagePicker extends StatefulWidget {
  @override
  _CameraImagePickerState createState() => _CameraImagePickerState();
}

class _CameraImagePickerState extends State<CameraImagePicker> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('CAMERA'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _pickImageFromCamera,
              child: const Text('เปิดกล้องถ่ายรูป'),
            ),
            const SizedBox(
              height: 10,
            ),
            _image == null
                ? Container(
                    color: Colors.red,
                    height: 300,
                    width: 150,
                  )
                : Container(
                    height: 300,
                    width: 150,
                    child: Image.file(
                      _image!,
                      fit: BoxFit.contain,
                    ),
                  ),
          ],
        ),
      ),
    );
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
