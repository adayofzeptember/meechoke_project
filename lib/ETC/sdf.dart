// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:meechoke_project/ETC/app_color.dart';
// import 'package:meechoke_project/ETC/shape_painter.dart';
// import 'package:meechoke_project/bloc/ReportAccident/report_accident_bloc.dart';

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   File? imageProfile;

//   final _picker = ImagePicker();

//   Future<void> openImagePicker() async {
//     final XFile? pickedImage =
//         await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedImage != null) {
//       setState(() {
//         imageProfile = File(pickedImage.path);
//       });
//       Navigator.pop(context);
//     }
//   }

//   Future<void> openCameraPicker() async {
//     final XFile? pickedImage =
//         await _picker.pickImage(source: ImageSource.camera);
//     if (pickedImage != null) {
//       setState(() {
//         imageProfile = File(pickedImage.path);
//       });
//       Navigator.pop(context);
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Palette.thisBlue,
//         automaticallyImplyLeading: false,
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.arrow_back_ios_new,
//             color: Colors.white,
//           ),
//         ),
//         title: const Text(
//           'แจ้งเหตุ/ข้อมูลเกี่ยวกับกรมธรรม์',
//           style: TextStyle(
//               color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
//         ),
//       ),
//       backgroundColor: Color.fromARGB(255, 228, 237, 240),
//       body: SingleChildScrollView(
//         child: BlocBuilder<ReportAccidentBloc, ReportAccidentState>(
//           builder: (context, state) {
//             return Column(children: [
//               Stack(
//                 children: [
//                   CustomPaint(
//                     painter: ShapesPainter(),
//                     child: Container(height: 100),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           height: 15,
//                         ),
//                         Text(
//                           'หมายเหตุ:',
//                           style: TextStyle(
//                               fontSize: 18,
//                               color: Color.fromARGB(255, 66, 66, 66),
//                               fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(10.0))),
//                           child: TextFormField(
//                             minLines: 1,
//                             maxLines: 6,
//                             autofocus: false,
//                             keyboardType: TextInputType.multiline,
//                             decoration: InputDecoration(
//                               hintText: 'กรอกหมายเหตุ',
//                               hintStyle: TextStyle(color: Colors.grey),
//                               border: OutlineInputBorder(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(10.0)),
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         (imageProfile == null)
//                             ? Text('null')
//                             : GestureDetector(
//                               onTap: (){
//                                 print(imageProfile!.path.toString());
//                               },
//                               child: Container(
//                                   width: 120.0,
//                                   height: 120.0,
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     image: DecorationImage(
//                                         image: FileImage(imageProfile!),
//                                         fit: BoxFit.cover),
//                                     borderRadius: const BorderRadius.all(
//                                         Radius.circular(150.0)),
//                                     border: Border.all(
//                                       color: Colors.white,
//                                       width: 4.0,
//                                     ),
//                                     boxShadow: const [
//                                       BoxShadow(
//                                         offset: Offset(0, 0),
//                                         spreadRadius: 1,
//                                         blurRadius: 4,
//                                         color:
//                                             Color.fromRGBO(233, 170, 170, 0.44),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                             ),
//                         Container(
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(25))),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 width: double.infinity,
//                                 decoration: BoxDecoration(
//                                     color: Color.fromARGB(255, 238, 246, 255),
//                                     borderRadius: BorderRadius.only(
//                                         topLeft: Radius.circular(25),
//                                         topRight: Radius.circular(25))),
//                                 child: Padding(
//                                   padding:
//                                       const EdgeInsets.only(top: 8, bottom: 8),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Icon(
//                                         Icons.image,
//                                         color: Palette.thisBlue,
//                                       ),
//                                       SizedBox(
//                                         width: 3,
//                                       ),
//                                       Text(
//                                         'รูปภาพจุดแจ้งเหตุ',
//                                         style: TextStyle(
//                                             fontSize: 18,
//                                             color: Palette.thisBlue,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.fromLTRB(10, 10, 0, 10),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     InkWell(
//                                       onTap: () {
//                                         openAlertBox(context);
//                                       },
//                                       child: Container(
//                                         height: 100,
//                                         width: 100,
//                                         decoration: BoxDecoration(
//                                             color: Color.fromARGB(
//                                                 255, 238, 246, 255),
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(20)),
//                                             border:
//                                                 Border.all(color: Colors.grey)),
//                                         child: Center(
//                                           child: Text(
//                                             '+ เพิ่มรูป',
//                                             style: TextStyle(
//                                                 color: Colors.grey,
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         SizedBox(
//                           height: 60,
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                                 primary: Colors.green,
//                                 elevation: 0,
//                                 // side: BorderSide(color: Colors.white),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 )),
//                             onPressed: () {
//                               context.read<ReportAccidentBloc>().add(
//                                   Upload_Pics(
//                                       type: 'image',
//                                       collection: 'true',
//                                       files: imageProfile));
//                             },
//                             child: Padding(
//                               padding: const EdgeInsets.all(15.0),
//                               child: Container(
//                                 width: double.infinity,
//                                 alignment: Alignment.center,
//                                 child: const Text(
//                                   "บันทึก",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white,
//                                       fontSize: 15),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ]);
//           },
//         ),
//       ),
//     );
//   }

//   openAlertBox(context) {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             scrollable: true, // <-- Set it to true

//             shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(32.0))),
//             contentPadding: const EdgeInsets.all(20),
//             content: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     openCameraPicker();
//                   },
//                   child: Column(
//                     children: [
//                       SvgPicture.asset('assets/images/cam.svg'),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       const Text(
//                         'ถ่ายภาพ',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       )
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 25,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     openImagePicker();
//                   },
//                   child: Column(
//                     children: [
//                       SvgPicture.asset('assets/images/gal.svg'),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       const Text(
//                         'แกลอรี่',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         });
//   }
// }
