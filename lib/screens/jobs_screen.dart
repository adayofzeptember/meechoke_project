import 'package:flutter/material.dart';
import 'package:meechoke_project/ETC/app_color.dart';

class Jobs_Screen extends StatefulWidget {
  const Jobs_Screen({super.key});

  @override
  State<Jobs_Screen> createState() => _Jobs_ScreenState();
}

class _Jobs_ScreenState extends State<Jobs_Screen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double h = (size.height - kToolbarHeight - 630) / 2;
    final double w = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.thisBlue,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.person,
                color: Palette.thisBlue,
              ),
            ),
          ),
        ],
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: CircleAvatar(
            backgroundColor: Colors.white,
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Palette.thisBlue,
            ),
          ),
        ),
        title: const Text(
          'งาน',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
          child: Column(
            children: [
            
            ],
          ),
        ),
      ),
    );
  }
}
