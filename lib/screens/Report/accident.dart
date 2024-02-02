import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/ETC/shape_painter.dart';

import '../../bloc/ReportAccident/report_accident_bloc.dart';

class Report_Accident extends StatefulWidget {
  @override
  _Report_AccidentState createState() => _Report_AccidentState();
}

class _Report_AccidentState extends State<Report_Accident> {
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
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: CircleAvatar(
        //       radius: 20,
        //       backgroundColor: Colors.white,
        //       child: const Icon(
        //         Icons.person,
        //         color: Palette.thisBlue,
        //         size: 20,
        //       ),
        //     ),
        //   ),
        // ],
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
          'แจ้งเหตุ/ข้อมูลเกี่ยวกับกรมธรรม์',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 228, 237, 240),
      body: SingleChildScrollView(
        child: BlocBuilder<ReportAccidentBloc, ReportAccidentState>(
          builder: (context, state) {
            return Column(children: [
              Stack(
                children: [
                  CustomPaint(
                    painter: ShapesPainter(),
                    child: Container(height: 100),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          child: Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.pin_drop_outlined,
                                        color: Palette.thisBlue,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        child: Text(
                                          '9686 เชลล์เขาหินซ้อน เขาหินซ้อน พนมสารคาม ฉะเชิงเทรา',
                                          overflow: TextOverflow.clip,
                                          maxLines: 3,
                                          style: TextStyle(
                                              color: Palette.thisBlue,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 300,
                          child: Column(
                            children: [
                              ListView.builder(
                                itemCount: state.vehicle_Docs.length,
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25))),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 238, 246, 255),
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(25),
                                                    topRight:
                                                        Radius.circular(25))),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8, bottom: 8),
                                              child: Center(
                                                child: Text(
                                                  state.vehicle_Docs[index]
                                                      .docType
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Palette.thisBlue,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 15, 20, 15),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      child: Text(
                                                        'บริษัท:',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: Color.fromARGB(
                                                              255, 66, 66, 66),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      state.vehicle_Docs[index]
                                                          .company
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Color.fromARGB(
                                                              255, 66, 66, 66),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      child: Text(
                                                        'เลขที่กรมธรรม์:',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: Color.fromARGB(
                                                              255, 66, 66, 66),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      state.vehicle_Docs[index]
                                                          .docNumber
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Color.fromARGB(
                                                              255, 66, 66, 66),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      child: Text(
                                                        'เบอร์โทรติดต่อ:',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: Color.fromARGB(
                                                              255, 66, 66, 66),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      state.vehicle_Docs[index]
                                                          .contact
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Color.fromARGB(
                                                              255, 66, 66, 66),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      child: Text(
                                                        'วงเงิน:',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: Color.fromARGB(
                                                              255, 66, 66, 66),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      state.vehicle_Docs[index]
                                                          .creditLimit
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Color.fromARGB(
                                                              255, 66, 66, 66),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                              ListView.builder(
                                itemCount: state.productIns_Docs.length,
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25))),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 238, 246, 255),
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(25),
                                                    topRight:
                                                        Radius.circular(25))),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8, bottom: 8),
                                              child: Center(
                                                child: Text(
                                                  state.productIns_Docs[index]
                                                      .docType
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Palette.thisBlue,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 15, 20, 15),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      child: Text(
                                                        'บริษัท:',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: Color.fromARGB(
                                                              255, 66, 66, 66),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      state.productIns_Docs[index]
                                                          .company
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Color.fromARGB(
                                                              255, 66, 66, 66),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      child: Text(
                                                        'เลขที่กรมธรรม์:',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: Color.fromARGB(
                                                              255, 66, 66, 66),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      state.productIns_Docs[index]
                                                          .docNumber
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Color.fromARGB(
                                                              255, 66, 66, 66),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      child: Text(
                                                        'เบอร์โทรติดต่อ:',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: Color.fromARGB(
                                                              255, 66, 66, 66),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      state.productIns_Docs[index]
                                                          .contact
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Color.fromARGB(
                                                              255, 66, 66, 66),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      child: Text(
                                                        'วงเงิน:',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: Color.fromARGB(
                                                              255, 66, 66, 66),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      state.productIns_Docs[index]
                                                          .creditLimit
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Color.fromARGB(
                                                              255, 66, 66, 66),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'หมายเหตุ:',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 66, 66, 66),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          child: TextFormField(
                            minLines: 1,
                            maxLines: 6,
                            autofocus: false,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              hintText: 'กรอกหมายเหตุ',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 238, 246, 255),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25))),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.image,
                                        color: Palette.thisBlue,
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        'รูปภาพจุดแจ้งเหตุ',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Palette.thisBlue,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 0, 10),
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
                                            color: Color.fromARGB(
                                                255, 238, 246, 255),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            border:
                                                Border.all(color: Colors.grey)),
                                        child: Center(
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
                                                itemCount:
                                                    selectedImages.length,
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 3),
                                                itemBuilder:
                                                    (BuildContext context,
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
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                elevation: 0,
                                // side: BorderSide(color: Colors.white),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onPressed: () {
                              // openAlertBox(context);
                              // Navigator.pushReplacement(
                              //   context,
                              //   PageTransition(
                              //       duration: const Duration(milliseconds: 500),
                              //       type: PageTransitionType.fade,
                              //       child: Check_Result()),
                              // );
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
                      ],
                    ),
                  )
                ],
              ),
            ]);
          },
        ),
      ),
    );
  }

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
