// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:meechoke_project/ETC/app_color.dart';
// import 'package:meechoke_project/ETC/shape_painter.dart';
// import 'package:meechoke_project/ETC/success_dialog.dart';
// import 'package:meechoke_project/bloc/Car_Check/car_check_bloc.dart';
// import 'package:meechoke_project/screens/Checking/CheckMethod/ExtCheckupEquipment_addMethod.dart';
// import 'package:meechoke_project/screens/Checking/CheckMethod/ExtCheckupList_addMethod.dart';
// import 'package:meechoke_project/screens/Checking/CheckMethod/ExtCheckupSafety_addMethod.dart';

// class Check_Screen extends StatefulWidget {
//   final String checkingType;

//   Check_Screen({Key? key, required this.checkingType}) : super(key: key);

//   @override
//   _Check_ScreenState createState() => _Check_ScreenState();
// }

// class _Check_ScreenState extends State<Check_Screen> {
//   List<File> selectedImages = [];
//   final picker = ImagePicker();

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
//             ExtCheckupList_Item.checklist.clear();
//             ExtCheckupEquipment_Item.checklistEquipment.clear();
//             ExtCheckupSafety_Item.checklistExtCheckupSafety_Item.clear();

//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.arrow_back_ios_new,
//             color: Colors.white,
//           ),
//         ),
//         title: Text(
//           widget.checkingType,
//           style: TextStyle(
//               color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
//         ),
//       ),
//       backgroundColor: const Color.fromARGB(255, 228, 237, 240),
//       body: SingleChildScrollView(
//         child: Column(children: [
//           Stack(
//             children: [
//               CustomPaint(
//                 painter: ShapesPainter(),
//                 child: Container(height: 160),
//               ),
//               Padding(
//                 padding: EdgeInsets.fromLTRB(15, 10, 15, 15),
//                 child: BlocBuilder<CarCheckBloc, CarCheckState>(
//                   builder: (context, state) {
//                     if (state.fetched_checkList1.length == 0) {
//                       return Center(
//                         child: CircularProgressIndicator(
//                           color: Colors.white,
//                         ),
//                       );
//                     }
//                     return ListView.builder(
//                         primary: true,
//                         itemCount: 1,
//                         shrinkWrap: true,
//                         physics: const ClampingScrollPhysics(),
//                         itemBuilder: (context, index) {
//                           return Column(
//                             children: [
//                               (state.toCheckChecklist1 == 0)
//                                   ? Column(
//                                       children: [
//                                         Container(
//                                           decoration: const BoxDecoration(
//                                               color: Colors.white,
//                                               borderRadius: BorderRadius.all(
//                                                   Radius.circular(25))),
//                                           child: Column(
//                                             children: [
//                                               Container(
//                                                 height: 130,
//                                                 decoration: BoxDecoration(
//                                                     border: Border.all(
//                                                         color: Palette.thisBlue,
//                                                         width: 2),
//                                                     color: Colors.white,
//                                                     borderRadius:
//                                                         BorderRadius.all(
//                                                             Radius.circular(
//                                                                 25))),
//                                                 child: Center(
//                                                   child: Text(
//                                                     state
//                                                         .fetched_checkList1[state
//                                                             .countIndexCheck]
//                                                         .name,
//                                                     style: TextStyle(
//                                                         color: Palette.thisBlue,
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         fontSize: 20),
//                                                   ),
//                                                 ),
//                                               ),
//                                               const SizedBox(
//                                                 height: 5,
//                                               ),
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsets.all(8.0),
//                                                 child: Row(
//                                                   children: [
//                                                     Expanded(
//                                                       child: ElevatedButton(
//                                                         style: ElevatedButton
//                                                             .styleFrom(
//                                                                 primary: state
//                                                                             .indexButtonSelect ==
//                                                                         0
//                                                                     ? Palette
//                                                                         .theGreen
//                                                                     : const Color
//                                                                         .fromARGB(
//                                                                         255,
//                                                                         190,
//                                                                         190,
//                                                                         190),
//                                                                 elevation: 0,
//                                                                 shape:
//                                                                     RoundedRectangleBorder(
//                                                                   borderRadius:
//                                                                       BorderRadius
//                                                                           .circular(
//                                                                               10),
//                                                                 )),
//                                                         onPressed: () {
//                                                           context
//                                                               .read<
//                                                                   CarCheckBloc>()
//                                                               .add(
//                                                                   Swap_Index_forButtones(
//                                                                       getIndex:
//                                                                           0));
//                                                         },
//                                                         child: Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                   .all(15.0),
//                                                           child: Row(
//                                                             children: [
//                                                               SvgPicture.asset(
//                                                                   'assets/images/normal.svg'),
//                                                               Text(
//                                                                 "ปกติ",
//                                                                 style:
//                                                                     TextStyle(
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .bold,
//                                                                   color: state.indexButtonSelect ==
//                                                                           0
//                                                                       ? Colors
//                                                                           .white
//                                                                       : Colors
//                                                                           .grey,
//                                                                   fontSize: 15,
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     const SizedBox(
//                                                       width: 5,
//                                                     ),
//                                                     Expanded(
//                                                       child: ElevatedButton(
//                                                         style: ElevatedButton
//                                                             .styleFrom(
//                                                                 primary: state
//                                                                             .indexButtonSelect ==
//                                                                         1
//                                                                     ? Palette
//                                                                         .someRed
//                                                                     : const Color
//                                                                         .fromARGB(
//                                                                         255,
//                                                                         190,
//                                                                         190,
//                                                                         190),
//                                                                 elevation: 0,
//                                                                 shape:
//                                                                     RoundedRectangleBorder(
//                                                                   borderRadius:
//                                                                       BorderRadius
//                                                                           .circular(
//                                                                               10),
//                                                                 )),
//                                                         onPressed: () {
//                                                           context
//                                                               .read<
//                                                                   CarCheckBloc>()
//                                                               .add(
//                                                                   Swap_Index_forButtones(
//                                                                       getIndex:
//                                                                           1));
//                                                         },
//                                                         child: Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                   .all(15.0),
//                                                           child: Row(
//                                                             children: [
//                                                               SvgPicture.asset(
//                                                                   'assets/images/abnormal.svg'),
//                                                               Text(
//                                                                 "ไม่ปกติ",
//                                                                 style:
//                                                                     TextStyle(
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .bold,
//                                                                   color: state.indexButtonSelect ==
//                                                                           1
//                                                                       ? Colors
//                                                                           .white
//                                                                       : Colors
//                                                                           .grey,
//                                                                   fontSize: 15,
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     )
//                                                   ],
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           height: 15,
//                                         ),
//                                         (state.indexButtonSelect == 1)
//                                             ? Column(
//                                                 children: [
//                                                   Container(
//                                                     decoration:
//                                                         const BoxDecoration(
//                                                             color:
//                                                                 Color
//                                                                     .fromARGB(
//                                                                         255,
//                                                                         255,
//                                                                         184,
//                                                                         179),
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .all(Radius
//                                                                         .circular(
//                                                                             5))),
//                                                     child: const Padding(
//                                                       padding:
//                                                           EdgeInsets.all(8.0),
//                                                       child: Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .center,
//                                                         children: [
//                                                           Icon(
//                                                             Icons
//                                                                 .dangerous_rounded,
//                                                             color:
//                                                                 Color.fromARGB(
//                                                                     255,
//                                                                     132,
//                                                                     2,
//                                                                     2),
//                                                           ),
//                                                           SizedBox(
//                                                             width: 3,
//                                                           ),
//                                                           Text(
//                                                               'กรุณาถ่ายรูปรายการที่ไม่ปกติ',
//                                                               style: TextStyle(
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .bold,
//                                                                 color: Color
//                                                                     .fromARGB(
//                                                                         255,
//                                                                         132,
//                                                                         2,
//                                                                         2),
//                                                               ))
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   SizedBox(
//                                                     height: 10,
//                                                   ),
//                                                   Container(
//                                                     width: double.infinity,
//                                                     decoration: const BoxDecoration(
//                                                         color: Colors.white,
//                                                         borderRadius:
//                                                             BorderRadius.all(
//                                                                 Radius.circular(
//                                                                     25))),
//                                                     child: Column(
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .start,
//                                                       children: [
//                                                         Container(
//                                                           width:
//                                                               double.infinity,
//                                                           decoration: const BoxDecoration(
//                                                               color:
//                                                                   Color.fromARGB(
//                                                                       255,
//                                                                       238,
//                                                                       246,
//                                                                       255),
//                                                               borderRadius: BorderRadius.only(
//                                                                   topLeft: Radius
//                                                                       .circular(
//                                                                           25),
//                                                                   topRight: Radius
//                                                                       .circular(
//                                                                           25))),
//                                                           child: const Padding(
//                                                             padding:
//                                                                 EdgeInsets.only(
//                                                                     top: 8,
//                                                                     bottom: 8),
//                                                             child: Row(
//                                                               mainAxisAlignment:
//                                                                   MainAxisAlignment
//                                                                       .center,
//                                                               children: [
//                                                                 Icon(
//                                                                   Icons.image,
//                                                                   color: Colors
//                                                                       .grey,
//                                                                 ),
//                                                                 SizedBox(
//                                                                   width: 3,
//                                                                 ),
//                                                                 Text(
//                                                                   'ภาพประกอบ',
//                                                                   style: TextStyle(
//                                                                       fontSize:
//                                                                           18,
//                                                                       color: Colors
//                                                                           .grey,
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .bold),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                         ),
//                                                         Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                   .fromLTRB(10,
//                                                                   10, 0, 10),
//                                                           child: Row(
//                                                             mainAxisAlignment:
//                                                                 MainAxisAlignment
//                                                                     .center,
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .center,
//                                                             children: [
//                                                               InkWell(
//                                                                 onTap: () {
//                                                                   //openAlertBox(context);
//                                                                   //_openModal();
//                                                                   // _getGallery();
//                                                                 },
//                                                                 child:
//                                                                     Container(
//                                                                   height: 100,
//                                                                   width: 100,
//                                                                   decoration: BoxDecoration(
//                                                                       color: const Color
//                                                                           .fromARGB(
//                                                                           255,
//                                                                           238,
//                                                                           246,
//                                                                           255),
//                                                                       borderRadius: const BorderRadius
//                                                                           .all(
//                                                                           Radius.circular(
//                                                                               20)),
//                                                                       border: Border.all(
//                                                                           color:
//                                                                               Colors.grey)),
//                                                                   child:
//                                                                       const Center(
//                                                                     child: Text(
//                                                                       '+ เพิ่มรูป',
//                                                                       style: TextStyle(
//                                                                           color: Colors
//                                                                               .grey,
//                                                                           fontWeight:
//                                                                               FontWeight.bold),
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                               Expanded(
//                                                                 child: SizedBox(
//                                                                   child: selectedImages
//                                                                           .isEmpty
//                                                                       ? const Text(
//                                                                           ' ')
//                                                                       : GridView
//                                                                           .builder(
//                                                                           shrinkWrap:
//                                                                               true,
//                                                                           itemCount:
//                                                                               selectedImages.length,
//                                                                           gridDelegate:
//                                                                               const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
//                                                                           itemBuilder:
//                                                                               (BuildContext context, int index) {
//                                                                             return Center(
//                                                                                 child: GestureDetector(
//                                                                               onTap: () {
//                                                                                 print(index);
//                                                                               },
//                                                                               child: Container(
//                                                                                   child: Card(
//                                                                                 child: SizedBox(
//                                                                                   height: 100,
//                                                                                   width: 100,
//                                                                                   child: Image.file(
//                                                                                     selectedImages[index],
//                                                                                     fit: BoxFit.cover,
//                                                                                   ),
//                                                                                 ),
//                                                                               )),
//                                                                             ));
//                                                                           },
//                                                                         ),
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         )
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ],
//                                               )
//                                             : Container(),
//                                       ],
//                                     )
//                                   : Container(
//                                       width: double.infinity,
//                                       decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(25))),
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Container(
//                                             width: double.infinity,
//                                             decoration: BoxDecoration(
//                                                 color: Color.fromARGB(
//                                                     255, 238, 246, 255),
//                                                 borderRadius: BorderRadius.only(
//                                                     topLeft:
//                                                         Radius.circular(25),
//                                                     topRight:
//                                                         Radius.circular(25))),
//                                             child: Padding(
//                                               padding: const EdgeInsets.only(
//                                                   top: 8, bottom: 8),
//                                               child: Center(
//                                                 child: Text(
//                                                   'ตรวจเช็ครายการ ${widget.checkingType} ทั้งหมดแล้ว',
//                                                   style: TextStyle(
//                                                       fontSize: 18,
//                                                       color: Palette.thisBlue,
//                                                       fontWeight:
//                                                           FontWeight.bold),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets.all(15.0),
//                                             child: Column(
//                                               children: [
//                                                 if (state.typeCheckState ==
//                                                     'extCheckupList')
//                                                   ListView.builder(
//                                                     shrinkWrap: true,
//                                                     itemCount:
//                                                         ExtCheckupList_Item
//                                                             .checklist.length,
//                                                     itemBuilder:
//                                                         (context, index) {
//                                                       return Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceBetween,
//                                                         children: [
//                                                           Text(
//                                                             ExtCheckupList_Item
//                                                                 .checklist[
//                                                                     index]
//                                                                 .list
//                                                                 .toString(),
//                                                             style: TextStyle(
//                                                                 fontSize: 20,
//                                                                 color: Palette
//                                                                     .thisBlue),
//                                                           ),
//                                                           Text(
//                                                             ExtCheckupList_Item
//                                                                 .checklist[
//                                                                     index]
//                                                                 .result
//                                                                 .toString(),
//                                                             style: TextStyle(
//                                                                 fontSize: 20,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .bold,
//                                                                 color: (ExtCheckupList_Item
//                                                                             .checklist[
//                                                                                 index]
//                                                                             .result
//                                                                             .toString() ==
//                                                                         'ปกติ')
//                                                                     ? Palette
//                                                                         .theGreen
//                                                                     : Palette
//                                                                         .someRed),
//                                                           ),
//                                                         ],
//                                                       );
//                                                     },
//                                                   ),
//                                                 if (state.typeCheckState ==
//                                                     'extCheckupEquipment')
//                                                   ListView.builder(
//                                                     shrinkWrap: true,
//                                                     itemCount:
//                                                         ExtCheckupEquipment_Item
//                                                             .checklistEquipment
//                                                             .length,
//                                                     itemBuilder:
//                                                         (context, index) {
//                                                       return Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceBetween,
//                                                         children: [
//                                                           Text(
//                                                             ExtCheckupEquipment_Item
//                                                                 .checklistEquipment[
//                                                                     index]
//                                                                 .list
//                                                                 .toString(),
//                                                             style: TextStyle(
//                                                                 fontSize: 20,
//                                                                 color: Palette
//                                                                     .thisBlue),
//                                                           ),
//                                                           Text(
//                                                             ExtCheckupEquipment_Item
//                                                                 .checklistEquipment[
//                                                                     index]
//                                                                 .result
//                                                                 .toString(),
//                                                             style: TextStyle(
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .bold,
//                                                                 fontSize: 20,
//                                                                 color: (ExtCheckupEquipment_Item
//                                                                             .checklistEquipment[
//                                                                                 index]
//                                                                             .result
//                                                                             .toString() ==
//                                                                         'ปกติ')
//                                                                     ? Palette
//                                                                         .theGreen
//                                                                     : Palette
//                                                                         .someRed),
//                                                           ),
//                                                         ],
//                                                       );
//                                                     },
//                                                   ),
//                                                 if (state.typeCheckState ==
//                                                     'extCheckupSafetyList')
//                                                   ListView.builder(
//                                                     shrinkWrap: true,
//                                                     itemCount: ExtCheckupSafety_Item
//                                                         .checklistExtCheckupSafety_Item
//                                                         .length,
//                                                     itemBuilder:
//                                                         (context, index) {
//                                                       return Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceBetween,
//                                                         children: [
//                                                           Text(
//                                                             ExtCheckupSafety_Item
//                                                                 .checklistExtCheckupSafety_Item[
//                                                                     index]
//                                                                 .list
//                                                                 .toString(),
//                                                             style: TextStyle(
//                                                                 fontSize: 20,
//                                                                 color: Palette
//                                                                     .thisBlue),
//                                                           ),
//                                                           Text(
//                                                             ExtCheckupSafety_Item
//                                                                 .checklistExtCheckupSafety_Item[
//                                                                     index]
//                                                                 .result
//                                                                 .toString(),
//                                                             style: TextStyle(
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .bold,
//                                                                 fontSize: 20,
//                                                                 color: (ExtCheckupSafety_Item
//                                                                             .checklistExtCheckupSafety_Item[
//                                                                                 index]
//                                                                             .result
//                                                                             .toString() ==
//                                                                         'ปกติ')
//                                                                     ? Palette
//                                                                         .theGreen
//                                                                     : Palette
//                                                                         .someRed),
//                                                           ),
//                                                         ],
//                                                       );
//                                                     },
//                                                   ),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               SizedBox(
//                                 height: 60,
//                                 child: ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                       primary: Colors.green,
//                                       elevation: 0,
//                                       // side: BorderSide(color: Colors.white),
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(10),
//                                       )),
//                                   onPressed: () {
//                                     if (state.toCheckChecklist1 == 1) {
//                                       SuccessMessage_Dialog(
//                                           context,
//                                           'เช็ครายการเบื้องต้นเสร็จสิ้น',
//                                           'เช็ครถ');

//                                       context.read<CarCheckBloc>().add(
//                                           CheckupList_BlocAdd(
//                                               getExtCheckup_List:
//                                                   ExtCheckupList_Item.checklist,
//                                               getTypeCheckToStore:
//                                                   state.typeCheckState));

//                                       if (state.typeCheckState ==
//                                           'extCheckupList') {
//                                         context.read<CarCheckBloc>().add(
//                                             CheckupList_BlocAdd(
//                                                 getExtCheckup_List:
//                                                     ExtCheckupList_Item
//                                                         .checklist,
//                                                 getTypeCheckToStore:
//                                                     state.typeCheckState));
//                                       } else if (state.typeCheckState ==
//                                           'extCheckupEquipment') {
//                                         context.read<CarCheckBloc>().add(
//                                             CheckupList_BlocAdd(
//                                                 getExtEqipment_List:
//                                                     ExtCheckupEquipment_Item
//                                                         .checklistEquipment,
//                                                 getTypeCheckToStore:
//                                                     state.typeCheckState));
//                                       } else {
//                                         context.read<CarCheckBloc>().add(
//                                             CheckupList_BlocAdd(
//                                                 getExtSafety_List:
//                                                     ExtCheckupSafety_Item
//                                                         .checklistExtCheckupSafety_Item,
//                                                 getTypeCheckToStore:
//                                                     state.typeCheckState));
//                                       }
//                                     }
//                                     //!
//                                     else {
//                                       if (state.typeCheckState ==
//                                           'extCheckupList') {
//                                         // context
//                                         //     .read<CarCheckBloc>()
//                                         //     .add(AddItem_Bloc());
//                                         ExtCheckupList_Item.addItem1(
//                                             sysVehicleChecklistId: int.parse(
//                                                 state
//                                                     .fetched_checkList1[
//                                                         state.countIndexCheck]
//                                                     .id
//                                                     .toString()),
//                                             list: state
//                                                 .fetched_checkList1[
//                                                     state.countIndexCheck]
//                                                 .name,
//                                             result: (context
//                                                         .read<CarCheckBloc>()
//                                                         .state
//                                                         .indexButtonSelect ==
//                                                     0)
//                                                 ? 'ปกติ'
//                                                 : 'ไม่ปกติ',
//                                             order: 1);
//                                       } else if (state.typeCheckState ==
//                                           'extCheckupEquipment') {
//                                         ExtCheckupEquipment_Item.addItem2(
//                                             sysVehicleEquipmentId: int.parse(
//                                                 state
//                                                     .fetched_checkList1[
//                                                         state.countIndexCheck]
//                                                     .id
//                                                     .toString()),
//                                             list: state
//                                                 .fetched_checkList1[
//                                                     state.countIndexCheck]
//                                                 .name,
//                                             result: (context
//                                                         .read<CarCheckBloc>()
//                                                         .state
//                                                         .indexButtonSelect ==
//                                                     0)
//                                                 ? 'ปกติ'
//                                                 : 'ไม่ปกติ',
//                                             order: 1);
//                                       } else {
//                                         ExtCheckupSafety_Item.addItem3(
//                                             sysVehicleSafetyListId: int.parse(
//                                                 state
//                                                     .fetched_checkList1[
//                                                         state.countIndexCheck]
//                                                     .id
//                                                     .toString()),
//                                             list: state
//                                                 .fetched_checkList1[
//                                                     state.countIndexCheck]
//                                                 .name,
//                                             result: (context
//                                                         .read<CarCheckBloc>()
//                                                         .state
//                                                         .indexButtonSelect ==
//                                                     0)
//                                                 ? 'ปกติ'
//                                                 : 'ไม่ปกติ',
//                                             order: 1);
//                                       }

//                                       context
//                                           .read<CarCheckBloc>()
//                                           .add(Count_PlusIndex(method: "+"));

//                                       context.read<CarCheckBloc>().add(
//                                           Swap_Index_forButtones(getIndex: 0));
//                                     }
//                                   },
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(15.0),
//                                     child: Container(
//                                       width: double.infinity,
//                                       alignment: Alignment.center,
//                                       child: const Text(
//                                         "บันทึก",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.white,
//                                             fontSize: 15),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           );
//                         });
//                   },
//                 ),
//               )
//             ],
//           ),
//         ]),
//       ),
//     );
//   }
// }
