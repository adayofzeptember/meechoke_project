import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meechoke_project/ETC/ProgressHUD.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/ETC/shape_painter.dart';
import 'package:meechoke_project/bloc/Report2_Test/report2_bloc.dart';
import 'package:meechoke_project/bloc/ReportAccident/report_accident_bloc.dart';


class Report2_Test extends StatefulWidget {
  @override
  _Report2_TestState createState() => _Report2_TestState();
}

class _Report2_TestState extends State<Report2_Test> {
  List<File> selectedImages = [];
  final picker = ImagePicker();

  @override
  void initState() {
    context.read<Report2Bloc>().add(Load_Docs());
    super.initState();
  }

  var reportRemark_Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportAccidentBloc, ReportAccidentState>(
      builder: (context, state) {
        return ProgressHUD(
            child: _uiLogin(context),
            inAsyncCall: state.isLoading,
            opacity: 0.3);
      },
    );
  }

  Widget _uiLogin(BuildContext context) {
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
            'แจ้งเหตุ/ข้อมูลเกี่ยวกับกรมธรรม์',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 228, 237, 240),
        body:
            SingleChildScrollView(child: BlocBuilder<Report2Bloc, Report2State>(
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
                          decoration: const BoxDecoration(
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
                                      const Icon(
                                        Icons.pin_drop_outlined,
                                        color: Palette.thisBlue,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        child: Text(
                                          'state.locationName.toString()',
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
                        const SizedBox(
                          height: 15,
                        ),
                        (state.statusCheck == "0")
                        ? Center(child: CircularProgressIndicator())


                        : GestureDetector(
                          onTap: () {
                                context.read<Report2Bloc>().add(Load_Docs());
                          },
                          child: Text('เกิดข้อผิดพลาด กดเพื่อลองใหม่')),

                    
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'แจ้งเหตุ:',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 66, 66, 66),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          child: TextFormField(
                            minLines: 1,
                            controller: reportRemark_Controller,
                            maxLines: 6,
                            autofocus: false,
                            keyboardType: TextInputType.multiline,
                            decoration: const InputDecoration(
                              hintText: 'กรอกหมายเหตุ',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: (selectedImages.isEmpty) ? 200 : null,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
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
                                padding: const EdgeInsets.all(5.0),
                                child: SizedBox(
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: const Color.fromARGB(
                                            255, 238, 246, 255),
                                        elevation: 0,
                                        side: const BorderSide(
                                            color: Colors.grey),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )),
                                    onPressed: () {
                                      openImageDialog(context);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "+ เพิ่มรูป",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
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
                                                print(
                                                    selectedImages[index].path);
                                              },
                                              child: Card(
                                                child: SizedBox(
                                                  height: 120,
                                                  width: 120,
                                                  child: Image.file(
                                                    selectedImages[index],
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ));
                                          },
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
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
                            onPressed: (selectedImages.isEmpty)
                                ? null
                                : () {
                                    context.read<ReportAccidentBloc>().add(
                                        Upload_Pics_andReport(
                                            context: context,
                                            getRemark:
                                                reportRemark_Controller.text,
                                            type: 'image',
                                            collection: 'true',
                                            files: selectedImages));

                                    selectedImages = [];
                                    reportRemark_Controller.text = '';
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
        )));
  }

  openImageDialog(context) {
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
    dynamic pickedFile = await picker.pickMultiImage(
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

//* DIALOG
uploadSuccessDialog(context) {
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
                  const Text(
                    'ส่งแจ้งเสร็จสิ้น',
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
