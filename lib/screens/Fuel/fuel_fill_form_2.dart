import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/screens/Jobs/Job%20Processing/job_done_5.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Fuel_fillForm extends StatefulWidget {
  @override
  _Fuel_fillFormState createState() => _Fuel_fillFormState();
}

class _Fuel_fillFormState extends State<Fuel_fillForm> {
  File? _image;
  @override
  Widget build(BuildContext context) {
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
          'เติมเชื้อเพลิง 2 ',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      backgroundColor: Palette.thisBlue,
      body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 88, 151, 211),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/images/petrol.svg',
                                    fit: BoxFit.contain, color: Colors.white),
                                SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Text(
                                    '9686 เชลล์เขาหินซ้อน เขาหินซ้อน พนมสารคาม ฉะเชิงเทรา',
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
                        'วันที่สั่งเติม 10 พ.ย. 2565 08:00',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
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
                              // const Align(
                              //   alignment: Alignment.bottomLeft,
                              //   child: Text(
                              //     'เลขไมล์ระยะทางปัจจุบัน',
                              //     style: TextStyle(
                              //         fontWeight: FontWeight.w900,
                              //         fontSize: 15,
                              //         color: Colors.black),
                              //   ),
                              // ),
                              // const SizedBox(
                              //   height: 10,
                              // ),
                              // TextFormField(
                              //   textAlign: TextAlign.left,
                              //   autofocus: false,
                              //   style: const TextStyle(fontWeight: FontWeight.bold),
                              //   validator: (value) {
                              //     if (value!.isEmpty) {
                              //       return 'โปรดกรอกเลขไมล์ระยะทางปัจจุบัน';
                              //     }
                              //     return null;
                              //   },
                              //   keyboardType: TextInputType.number,
                              //   decoration: InputDecoration(
                              //       hintText: 'กรอกเลขไมล์ระยะทางปัจจุบัน',
                              //       labelStyle: const TextStyle(fontSize: 15),
                              //       focusedBorder: OutlineInputBorder(
                              //           borderSide: const BorderSide(
                              //               color:
                              //                   Color.fromARGB(255, 211, 211, 211)),
                              //           borderRadius: BorderRadius.circular(10)),
                              //       filled: true,
                              //       fillColor: Colors.white,
                              //       border: OutlineInputBorder(
                              //           borderSide: const BorderSide(
                              //               color:
                              //                   Color.fromARGB(255, 211, 211, 211)),
                              //           borderRadius: BorderRadius.circular(10)),
                              //       enabledBorder: OutlineInputBorder(
                              //           borderSide: const BorderSide(
                              //               color:
                              //                   Color.fromARGB(255, 211, 211, 211)),
                              //           borderRadius: BorderRadius.circular(10))),
                              // ),
                              // const SizedBox(
                              //   height: 10,
                              // ),
                              // const Align(
                              //   alignment: Alignment.topLeft,
                              //   child: Text(
                              //     'ปริมาณเติมจริง',
                              //     style: TextStyle(
                              //         fontSize: 15,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.black),
                              //   ),
                              // ),
                              // const SizedBox(
                              //   height: 10,
                              // ),
                              // TextFormField(
                              //   textAlign: TextAlign.left,
                              //   autofocus: false,
                              //   style: const TextStyle(fontWeight: FontWeight.bold),
                              //   validator: (value) {
                              //     if (value!.isEmpty) {
                              //       return 'โปรดกรอกปริมาณเติมจริง';
                              //     }
                              //     return null;
                              //   },
                              //   keyboardType: TextInputType.number,
                              //   decoration: InputDecoration(
                              //       hintText: 'กรอกปริมาณเติมจริง',
                              //       labelStyle: const TextStyle(fontSize: 15),
                              //       focusedBorder: OutlineInputBorder(
                              //           borderSide: const BorderSide(
                              //               color:
                              //                   Color.fromARGB(255, 211, 211, 211)),
                              //           borderRadius: BorderRadius.circular(10)),
                              //       filled: true,
                              //       fillColor: Colors.white,
                              //       border: OutlineInputBorder(
                              //           borderSide: const BorderSide(
                              //               color:
                              //                   Color.fromARGB(255, 211, 211, 211)),
                              //           borderRadius: BorderRadius.circular(10)),
                              //       enabledBorder: OutlineInputBorder(
                              //           borderSide: const BorderSide(
                              //               color:
                              //                   Color.fromARGB(255, 211, 211, 211)),
                              //           borderRadius: BorderRadius.circular(10))),
                              // ),
                              // const SizedBox(
                              //   height: 30,
                              // ),
                              // const Align(
                              //   alignment: Alignment.topLeft,
                              //   child: Text(
                              //     'รวมเป็นเงิน',
                              //     style: TextStyle(
                              //         fontSize: 15,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.black),
                              //   ),
                              // ),
                              // const SizedBox(
                              //   height: 10,
                              // ),
                              // TextFormField(
                              //   textAlign: TextAlign.left,
                              //   autofocus: false,
                              //   style: const TextStyle(fontWeight: FontWeight.bold),
                              //   validator: (value) {
                              //     if (value!.isEmpty) {
                              //       return 'โปรดกรอกเงินรวมทั้งหมด';
                              //     }
                              //     return null;
                              //   },
                              //   keyboardType: TextInputType.number,
                              //   decoration: InputDecoration(
                              //       hintText: 'รวมเป็นเงิน',
                              //       labelStyle: const TextStyle(fontSize: 15),
                              //       focusedBorder: OutlineInputBorder(
                              //           borderSide: const BorderSide(
                              //               color:
                              //                   Color.fromARGB(255, 211, 211, 211)),
                              //           borderRadius: BorderRadius.circular(10)),
                              //       filled: true,
                              //       fillColor: Colors.white,
                              //       border: OutlineInputBorder(
                              //           borderSide: const BorderSide(
                              //               color:
                              //                   Color.fromARGB(255, 211, 211, 211)),
                              //           borderRadius: BorderRadius.circular(10)),
                              //       enabledBorder: OutlineInputBorder(
                              //           borderSide: const BorderSide(
                              //               color:
                              //                   Color.fromARGB(255, 211, 211, 211)),
                              //           borderRadius: BorderRadius.circular(10))),
                              // ),
                              // const SizedBox(
                              //   height: 30,
                              // ),
                              //!
                              _image == null
                                  ? InkWell(
                                      onTap: () {
                                        _pickImageFromCamera();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 214, 214, 214),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.3,
                                        width: double.infinity,
                                        child: Center(
                                          child: Icon(
                                            Icons.camera_alt,
                                            size: 50,
                                          ),
                                        ),
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        _pickImageFromCamera();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 214, 214, 214),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.3,
                                        width: double.infinity,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          child: Image.file(
                                            _image!,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                              SizedBox(
                                height: 30,
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
                                    openAlertBox(context);
                                    //_onAlertSubmitFuel(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Container(
                                      width: double.infinity,
                                      alignment: Alignment.center,
                                      child: const Text(
                                        "เสร็จสิ้น",
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
                        ),
                      ),
                    ))
              ])),
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
