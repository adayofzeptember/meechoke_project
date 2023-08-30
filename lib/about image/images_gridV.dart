import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MultipleImageSelector extends StatefulWidget {
  const MultipleImageSelector({super.key});

  @override
  State<MultipleImageSelector> createState() => _MultipleImageSelectorState();
}

class _MultipleImageSelectorState extends State<MultipleImageSelector> {
  List<File> selectedImages = [];
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
 
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Images GridView'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple)),
                child: const Text(
                  'เลือกรูปภาพ',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  getImages();
                },
              ), 
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: SizedBox(
                  width: 300,
                  child: selectedImages.isEmpty
                      ? const Text(' ')
                      : GridView.builder(
                          itemCount: selectedImages.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemBuilder: (BuildContext context, int index) {
                            return Center(
                                child: GestureDetector(
                              onTap: () {
                                print(selectedImages[index].toString());
                                print(selectedImages.length);
                              },
                              child: Container(
                                  child: Card(
                                child: SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Image.file(
                                    selectedImages[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )),
                            ));
                          },
                        ),
                ),
              ),
            ],
          ), 
        ),
      ),
    );
  }

  Future getImages() async {
    final pickedFile = await picker.pickMultiImage(
        imageQuality: 100, maxHeight: 1000, maxWidth: 1000);
    List<XFile> xfilePick = pickedFile;

    setState(
      () {
        if (xfilePick.isNotEmpty) {
          for (var i = 0; i < xfilePick.length; i++) {
            selectedImages.add(File(xfilePick[i].path));
          }
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text(' ')));

        }
      },
    );
  }
}






