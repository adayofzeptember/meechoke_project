import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate loading delay
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skeleton Loading Example'),
      ),
      body: _isLoading ? _buildSkeletonUI() : _buildActualContent(),
    );
  }

  Widget _buildSkeletonUI() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ListTile(
          leading: SkeletonPlaceholder(
            width: 40,
            height: 40,
          ),
          title: SkeletonPlaceholder(
            width: double.infinity,
            height: 20,
          ),
        );
      },
    );
  }

  Widget _buildActualContent() {
    // Replace this with your actual content UI
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.star),
          title: Text('Item $index'),
        );
      },
    );
  }
}

class SkeletonPlaceholder extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const SkeletonPlaceholder({
    Key? key,
    required this.width,
    required this.height,
    this.color = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color,
    );
  }
}
