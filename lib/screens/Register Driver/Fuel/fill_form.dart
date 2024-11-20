import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meechoke_project/ETC/ProgressHUD.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/bloc/Fuel/fuel_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Fuel_fillForm extends StatefulWidget {
  @override
  _Fuel_fillFormState createState() => _Fuel_fillFormState();
}

class _Fuel_fillFormState extends State<Fuel_fillForm> {
  List<File> selectedImages = [];
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FuelBloc, FuelState>(
      builder: (context, state) {
        return ProgressHUD(
            child: _uiFillFuel(context),
            inAsyncCall: state.isLoading,
            opacity: 0.3);
      },
    );
  }

  Widget _uiFillFuel(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          'เติมเชื้อเพลิง',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 1, 44, 97),
      body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BlocBuilder<FuelBloc, FuelState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 88, 151, 211),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Column(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/images/petrol.svg',
                                            fit: BoxFit.contain,
                                            color: Colors.white),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          child: Text(
                                            state.fuelInfo.location_name,
                                            overflow: TextOverflow.clip,
                                            maxLines: 3,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/images/icon_job.svg',
                                  fit: BoxFit.contain, color: Colors.white),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                state.fuelInfo.date,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 1,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Form(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
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
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: SizedBox(
                                        height: 50,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: Palette.thisBlue,
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
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 15),
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
                                                      _showImageDialog(
                                                          context,
                                                          selectedImages[index]
                                                              .path);
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
                              SizedBox(
                                height: 30,
                              ),
                              (selectedImages.isEmpty)
                                  ? Container()
                                  : BlocBuilder<FuelBloc, FuelState>(
                                      builder: (context, state) {
                                        return SizedBox(
                                          height: 60,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.green,
                                                elevation: 0,
                                                // side: BorderSide(color: Colors.white),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                )),
                                            onPressed: (selectedImages.isEmpty)
                                                ? null
                                                : () {
                                                    // openAlertBox(context);
                                                    print('send');
                                                    context
                                                        .read<FuelBloc>()
                                                        .add(Upload_Pics_Fuel(
                                                            fuel_id: int.parse(
                                                                state.fuelInfo
                                                                    .id),
                                                            context: context,
                                                            type: 'image',
                                                            collection: 'true',
                                                            files:
                                                                selectedImages));
                                                    // context.read<ReportAccidentBloc>().add(
                                                    //     Upload_Pics_andReport(

                                                    //         context: context,
                                                    //         getRemark:
                                                    //             reportRemark_Controller.text,
                                                    //         type: 'image',
                                                    //         collection: 'true',
                                                    //         files: selectedImages));

                                                    // selectedImages = [];
                                                    // reportRemark_Controller.text = '';
                                                  },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Container(
                                                width: double.infinity,
                                                alignment: Alignment.center,
                                                child: const Text(
                                                  "เสร็จสิ้น",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                      fontSize: 15),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ))
              ])),
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
                    _getCamera();
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

  // Future<void> _getToCamera() async {
  //   final picker = ImagePicker();
  //   final pickedImage = await picker.pickImage(source: ImageSource.camera);

  //   if (pickedImage != null) {
  //     setState(() {
  //       selectedImages.add(File(pickedImage.path));
  //     });
  //   }
  // }

  Future _getCamera() async {
    try {
      // Pick an image from the camera
      final pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 100, // You can adjust quality
        maxHeight: 1000,
        maxWidth: 1000,
      );

      // If an image is selected, store it in the selectedImages list
      if (pickedFile != null) {
        setState(() {
          selectedImages.add(File(pickedFile.path));
        });
      } else {
        // If no image is picked, show a message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('ไม่ได้เลือกรูป')),
        );
      }
    } catch (e) {
      // Handle any errors that might occur
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('เกิดข้อผิดพลาด: $e')),
      );
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

_onAlertSubmitFuel(context) {
  var alertStyle = AlertStyle(
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Sarabun'),
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: TextStyle(
      color: Colors.red,
    ),
    animationType: AnimationType.grow,
    overlayColor: Color(0x55000000),
    alertElevation: 0,
  );
  //!
  Alert(
    context: context,
    style: alertStyle,
    content: SizedBox(
      child: Center(
          child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          SvgPicture.asset(
            'assets/images/question.svg',
            fit: BoxFit.fill,
          ),
          SizedBox(height: 10),
          Text(
            'บันทึกการเติมน้ำมัน',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 97, 97, 97)),
          ),
        ],
      )),
    ),
    buttons: [
      DialogButton(
        child: Text(
          "ยกเลิก",
          style:
              TextStyle(color: Color.fromARGB(255, 97, 97, 97), fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        color: Color.fromARGB(255, 237, 237, 237),
      ),
      DialogButton(
        child: Text(
          "ยืนยัน",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () {
          Navigator.pop(context);
          _onAlertSubdddmitFuel(context);
        },
        color: Color.fromARGB(255, 9, 154, 75),
      ),
    ],
  ).show();
}

_onAlertSubdddmitFuel(context) {
  var alertStyle = AlertStyle(
    isCloseButton: false,
    isOverlayTapDismiss: true,
    descStyle: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Sarabun'),
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: TextStyle(
      color: Colors.red,
    ),
    animationType: AnimationType.grow,
    overlayColor: Color(0x55000000),
    alertElevation: 0,
  );
  //!
  Alert(
      context: context,
      style: alertStyle,
      content: SizedBox(
        child: Center(
            child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            SvgPicture.asset(
              'assets/images/done.svg',
              fit: BoxFit.fill,
            ),
            SizedBox(height: 10),
            Text(
              'บันทึกสำเร็จ',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 97, 97, 97)),
            ),
          ],
        )),
      ),
      buttons: [
        DialogButton(
          child: Text(
            "ตกลง",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Color.fromARGB(255, 9, 154, 75),
        ),
      ]).show();
}
