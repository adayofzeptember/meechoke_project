import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/ETC/shape_painter.dart';
import 'package:meechoke_project/screens/Checking/checking_result.dart';
import 'package:page_transition/page_transition.dart';

class Check_Does extends StatefulWidget {
  @override
  _Check_DoesState createState() => _Check_DoesState();
}

class _Check_DoesState extends State<Check_Does> {
  List<File> selectedImages = [];
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
          'เบื้องต้น',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 228, 237, 240),
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              CustomPaint(
                painter: ShapesPainter(),
                child: Container(height: 160),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: Column(
                        children: [
                          Container(
                            height: 130,
                            decoration: BoxDecoration(
                                border: Border.all(color: Palette.thisBlue, width: 2),
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            child: const Center(
                              child: Text(
                                '1. น้ำในหม้อและสภาพหม้อน้ำ',
                                style: TextStyle(
                                    color: Palette.thisBlue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Palette.thisBlue,
                                        elevation: 0,
                                        // side: BorderSide(color: Colors.white),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )),
                                    onPressed: null,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "ไม่ปกติ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Expanded(
                                  child: 
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Palette.thisBlue,
                                        elevation: 0,
                                        // side: BorderSide(color: Colors.white),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )),
                                    onPressed: null,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "ปกติ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 184, 179),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.dangerous_rounded,
                              color: Color.fromARGB(255, 132, 2, 2),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text('กรุณาถ่ายรูปรายการที่ไม่ปกติ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 132, 2, 2),
                                ))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 238, 246, 255),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25))),
                            child: const Padding(
                              padding: EdgeInsets.only(top: 8, bottom: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    'ภาพประกอบ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
          
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    openAlertBox(context);
                                    //_openModal();
                                    // _getGallery();
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 238, 246, 255),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                        border: Border.all(color: Colors.grey)),
                                    child: const Center(
                                      child: Text(
                                        '+ เพิ่มรูป',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    child: selectedImages.isEmpty
                                        ? const Text(' ')
                                        : GridView.builder(
                                            shrinkWrap: true,
                                            itemCount: selectedImages.length,
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 3),
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Center(
                                                  child: GestureDetector(
                                                onTap: () {
                                                  print(index);
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
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 60,
                      child: ElevatedButton(
                        style: 
                        ElevatedButton.styleFrom(
                            primary: Colors.green,
                            elevation: 0,
                            // side: BorderSide(color: Colors.white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            PageTransition(
                                duration: const Duration(milliseconds: 500),
                                type: PageTransitionType.fade,
                                child: Check_Result()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: const Text(
                              "บันทึก",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
       CupertinoSegmentedControl<int>(
      children: {
        0: Text('Option 1'),
        1: Text('Option 2'),
      },
      groupValue: 1,
      selectedColor: Colors.blue, // Customize the selected button color
      unselectedColor: Colors.grey, // Customize the unselected button color
      pressedColor: Colors.blue[200], // Customize the color when pressed
      borderColor: Colors.blue, // Customize the border color
        // Customize the border radius
      onValueChanged: (value) {
        setState(() {
         
        });
      },
    )
                  ],
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }

  // _openModal() {
  //   showModalBottomSheet(
  //       backgroundColor: Colors.transparent,
  //       context: context,
  //       builder: (context) {
  //         return Container(
  //           height: MediaQuery.of(context).size.height * 0.2,
  //           decoration: BoxDecoration(
  //             color: Colors.red,
  //             borderRadius: new BorderRadius.only(
  //               topLeft: const Radius.circular(50),
  //               topRight: const Radius.circular(50),
  //             ),
  //           ),
  //           child: Row(
  //             children: [
  //               ElevatedButton(
  //                 style: ElevatedButton.styleFrom(

  //                     elevation: 0,
  //                     // side: BorderSide(color: Colors.white),
  //                     shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(10),
  //                     )),
  //                 onPressed: () {
  //                   _getGallery();
  //                 },
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(15.0),
  //                   child: Container(
  //                     width: double.infinity,
  //                     alignment: Alignment.center,
  //                     child: const Text(
  //                       "xxx",
  //                       style: TextStyle(
  //                           fontWeight: FontWeight.bold,
  //                           color: Colors.white,
  //                           fontSize: 15),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         );
  //       });
  // }

  openAlertBox(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true, // <-- Set it to true

            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: const EdgeInsets.all(20),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    _getToCamera();
                    Navigator.pop(context);
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/images/cam.svg'),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'ถ่ายภาพ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                InkWell(
                  onTap: () {
                    _getGallery();
                    Navigator.pop(context);
                  },
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/images/gal.svg'),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'แกลอรี่',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });

    // Future.delayed(Duration(seconds: 2), () {
    //    Navigator.pushReplacement(
    //         context,
    //         PageTransition(
    //             duration: const Duration(milliseconds: 500),
    //             type: PageTransitionType.fade,
    //             child: MainMenu_Page()),
    //       );
    // });
  }

  Future<void> _getToCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        selectedImages.add(File(pickedImage.path));
      });
    }
  }

  Future _getGallery() async {
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
