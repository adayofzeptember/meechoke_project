// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:meechoke_project/ETC/app_color.dart';
// import 'package:meechoke_project/seven%20main%20function%20pages/jobs_screen.dart';
// import 'package:page_transition/page_transition.dart';

// class MainMenu_Page extends StatefulWidget {
//   const MainMenu_Page({super.key});

//   @override
//   State<MainMenu_Page> createState() => _MainMenu_PageState();
// }

// class _MainMenu_PageState extends State<MainMenu_Page> {
//   @override
//   Widget build(BuildContext context) {
//     //*
//     var size = MediaQuery.of(context).size;
//     final double h1 = (size.height - kToolbarHeight - 400) / 2;
//     final double w1 = size.width / 2;
//     final double h = (size.height - kToolbarHeight - 500) / 2;
//     final double w = size.width / 2;
//     //*
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         automaticallyImplyLeading: false,
//         centerTitle: true,
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: CircleAvatar(
//               backgroundColor: Color.fromARGB(255, 1, 45, 97),
//               child: const Icon(
//                 Icons.person,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ],
//         title: const Text(
//           'Meechoke Driver dfMenu',
//           style: TextStyle(
//               color: Color.fromARGB(255, 1, 45, 97),
//               fontWeight: FontWeight.bold),
//         ),
//       ),
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
//           child: Column(
//             children: [
//               // Container(
//               //   width: double.infinity,
//               //   height: 150,
//               //   decoration: const BoxDecoration(
//               //       color: Palette.thisBlue,
//               //       borderRadius: BorderRadius.all(Radius.circular(25))),
//               //   child: SvgPicture.asset(
//               //     'assets/images/works.svg',
//               //     width: double.infinity,
//               //     fit: BoxFit.fitWidth,
//               //   ),
//               // ),

//               Container(
//                 height: MediaQuery.of(context).size.height * 0.22,
//                 width: double.infinity,
//                 child: ClipRRect(
//                   borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(5),
//                       topRight: Radius.circular(5)),
//                   child: SvgPicture.asset(
//                     'assets/images/works.svg',
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//               GridView.count(
//                 primary: false,
//                 childAspectRatio: (w1 / h1),
//                 shrinkWrap: true,
//                 crossAxisSpacing: 20,
//                 mainAxisSpacing: 10,
//                 crossAxisCount: 2,
//                 children: <Widget>[
//                   Container(
//                     width: MediaQuery.of(context).size.width * 0.5,
//                     child: InkWell(
//                       onTap: () {},
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
                
//                             width: double.infinity,
//                             child: ClipRRect(
//                               borderRadius: const BorderRadius.only(
//                                   topLeft: Radius.circular(5),
//                                   topRight: Radius.circular(5)),
//                               child: SvgPicture.asset(
//                                 'assets/images/fuel.svg',
//                                 fit: BoxFit.fill,
//                                 height: 180,
//                               ),
//                             ),
//                           ),
                     
                       
//                         ],
//                       ),
//                     ),
//                   ),
//                   InkWell(
//                     child: Container(
//                       decoration: const BoxDecoration(
//                           color: Palette.thisBlue,
//                           borderRadius: BorderRadius.all(Radius.circular(25))),
//                       padding: const EdgeInsets.all(8),
//                       child: const Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.calendar_month,
//                             size: 80,
//                             color: Colors.teal,
//                           ),
//                           Text(
//                             "แผนงาน",
//                             style: TextStyle(
//                                 color: Colors.teal,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               GridView.count(
//                 primary: false,
//                 childAspectRatio: (w1 / h1),
//                 shrinkWrap: true,
//                 crossAxisSpacing: 20,
//                 mainAxisSpacing: 10,
//                 crossAxisCount: 2,
//                 children: <Widget>[
//                   InkWell(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         PageTransition(
//                             duration: const Duration(milliseconds: 500),
//                             type: PageTransitionType.rightToLeft,
//                             child: Jobs_History()),
//                       );
//                     },
//                     child: Container(
//                       decoration: const BoxDecoration(
//                           color: Palette.thisBlue,
//                           borderRadius: BorderRadius.all(Radius.circular(25))),
//                       padding: const EdgeInsets.all(8),
//                       child: const Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.task,
//                             size: 80,
//                             color: Colors.teal,
//                           ),
//                           Text(
//                             "งาน",
//                             style: TextStyle(
//                                 color: Colors.teal,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   InkWell(
//                     child: Container(
//                       decoration: const BoxDecoration(
//                           color: Palette.thisBlue,
//                           borderRadius: BorderRadius.all(Radius.circular(25))),
//                       padding: const EdgeInsets.all(8),
//                       child: const Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.calendar_month,
//                             size: 80,
//                             color: Colors.teal,
//                           ),
//                           Text(
//                             "แผนงาน",
//                             style: TextStyle(
//                                 color: Colors.teal,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               GridView.count(
//                 primary: false,
//                 childAspectRatio: (w / h),
//                 shrinkWrap: true,
//                 crossAxisSpacing: 20,
//                 mainAxisSpacing: 10,
//                 crossAxisCount: 2,
//                 children: <Widget>[
//                   InkWell(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         PageTransition(
//                             duration: const Duration(milliseconds: 500),
//                             type: PageTransitionType.rightToLeft,
//                             child: Jobs_History()),
//                       );
//                     },
//                     child: Container(
//                       decoration: const BoxDecoration(
//                           color: Color.fromARGB(239, 202, 40, 54),
//                           borderRadius: BorderRadius.all(Radius.circular(25))),
//                       padding: const EdgeInsets.all(8),
//                       child: const Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.task,
//                             size: 80,
//                             color: Colors.teal,
//                           ),
//                           Text(
//                             "งาน",
//                             style: TextStyle(
//                                 color: Colors.teal,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   InkWell(
//                     child: Container(
//                       decoration: const BoxDecoration(
//                           color: Color.fromARGB(255, 247, 235, 79),
//                           borderRadius: BorderRadius.all(Radius.circular(25))),
//                       padding: const EdgeInsets.all(8),
//                       child: const Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.calendar_month,
//                             size: 80,
//                             color: Colors.teal,
//                           ),
//                           Text(
//                             "แผนงาน",
//                             style: TextStyle(
//                                 color: Colors.teal,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
