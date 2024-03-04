import 'package:flutter/material.dart';

class XDart extends StatelessWidget {
  const XDart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        try {
          return YourMainWidget();
        } catch (e) {
          // Return a fallback UI if an error occurs
          return Text('An error occurred: $e');
        }
      },
    );
  }
}

class YourMainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
