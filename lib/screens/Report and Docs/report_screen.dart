import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meechoke_project/ETC/ProgressHUD.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/bloc/ReportAccident/report_accident_bloc.dart';

class Report_Screen extends StatefulWidget {
  @override
  _Report_ScreenState createState() => _Report_ScreenState();
}

class _Report_ScreenState extends State<Report_Screen> {
  List<File> selectedImages = [];
  final picker = ImagePicker();

  @override
  void initState() {
    context.read<ReportAccidentBloc>().add(EmitLatLng(context: context));
    super.initState();
  }

  var reportRemark_Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportAccidentBloc, ReportAccidentState>(
      builder: (context, state) {
        return ProgressHUD(
            child: _uiReport(context),
            inAsyncCall: state.isLoading,
            opacity: 0.3);
      },
    );
  }

  Widget _uiReport(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.mainBackgroud,
      body: SingleChildScrollView(
        child: BlocBuilder<ReportAccidentBloc, ReportAccidentState>(
          builder: (context, state) {
            if (state.lat == 0 || state.lng == 0) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  CircularProgressIndicator(),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'กำลังระบุตำแหน่งปัจจุบัน',
                    style: TextStyle(
                        color: Palette.thisBlue, fontWeight: FontWeight.bold),
                  )
                ],
              ));
            }

            context.read<ReportAccidentBloc>().add(GetLocationName());
            return Column(children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 5, 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Palette.thisBlue,
                              // border: Border.all(),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Palette.someRed,
                                    ),
                                    // Text(
                                    //   'ตำแหน่งปัจจุบัน',
                                    //   style: TextStyle(
                                    //       fontSize: 18,
                                    //       color: Colors.white,
                                    //       fontWeight: FontWeight.bold),
                                    // ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    state.locationName,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'รายละเอียดการแจ้ง',
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                              hintText: 'กรอกรายละเอียดแจ้งเหตุ',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
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
                                      const Text(
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
                                                _showImageDialog(context,
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
                        ElevatedButton(
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
                                "ส่งแจ้ง",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 15),
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

  static void _showImageDialog(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Image.file(
              File(imagePath),
              fit: BoxFit.fill,
            ),
          ),
        );
      },
    );
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
