import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('test')),
        body: ButtonSelection(),
      ),
    );
  }
}

class ButtonSelection extends StatefulWidget {
  @override
  _ButtonSelectionState createState() => _ButtonSelectionState();
}

class _ButtonSelectionState extends State<ButtonSelection> {
  int _selectedButtonIndex = -1; // Initially no button is selected

  void _onButtonPressed(int index) {
    setState(() {
      // Toggle selection
      if (_selectedButtonIndex == index) {
        _selectedButtonIndex = -1; // Deselect if already selected
      } else {
        _selectedButtonIndex = index; // Select the button
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                index: 0,
                isSelected: _selectedButtonIndex == 0,
                onPressed: _onButtonPressed,
                buttonText: "Button 1",
              ),
              SizedBox(width: 10), // Adjust spacing between buttons
              ButtonWidget(
                index: 1,
                isSelected: _selectedButtonIndex == 1,
                onPressed: _onButtonPressed,
                buttonText: "Button 2",
              ),
              SizedBox(width: 10), // Adjust spacing between buttons
              ButtonWidget(
                index: 2,
                isSelected: _selectedButtonIndex == 2,
                onPressed: _onButtonPressed,
                buttonText: "Button 3",
              ),
            ],
          ),
          SizedBox(height: 10), // Adjust spacing between rows
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                index: 3,
                isSelected: _selectedButtonIndex == 3,
                onPressed: _onButtonPressed,
                buttonText: "Button 4",
              ),
              SizedBox(width: 10), // Adjust spacing between buttons
              ButtonWidget(
                index: 4,
                isSelected: _selectedButtonIndex == 4,
                onPressed: _onButtonPressed,
                buttonText: "Button 5",
              ),
              SizedBox(width: 10), // Adjust spacing between buttons
              ButtonWidget(
                index: 5,
                isSelected: _selectedButtonIndex == 5,
                onPressed: _onButtonPressed,
                buttonText: "Button 6",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final int index;
  final bool isSelected;
  final Function(int) onPressed;
  final String buttonText;

  const ButtonWidget({
    required this.index,
    required this.isSelected,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: isSelected ? Colors.green : const Color.fromARGB(255, 200, 40, 43),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      onPressed: () => onPressed(index),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          buttonText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
