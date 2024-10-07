import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For number input

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Verification',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VerificationScreen(),
    );
  }
}

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  // Countdown timer variables
  late Timer _timer;
  int _start = 59; // Starting time in seconds

  // Text editing controllers for 6-digit input
  List<TextEditingController> _controllers = List.generate(6, (index) => TextEditingController());

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_start > 0) {
          _start--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple, // Match background color
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Verification Code', style: TextStyle(fontSize: 20)),
        leading: Icon(Icons.arrow_back),
        elevation: 0, // Remove shadow for a flat look
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Enter the 6-digit code sent to',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: 5),
          Text(
            '+252613666337', // Example number
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) {
                return _buildCodeField(index);
              }),
            ),
          ),
          SizedBox(height: 30),
          Text(
            'Resend Code 00:${_start.toString().padLeft(2, '0')}',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: ElevatedButton(
              onPressed: () {
                // Verify action
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), backgroundColor: Colors.deepPurple.shade700, // Full width button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ), // Match button color
              ),
              child: Text(
                'Verify Phone Number',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to build each code input field
  Widget _buildCodeField(int index) {
    return Container(
      width: 45,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: _controllers[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        inputFormatters: [LengthLimitingTextInputFormatter(1)], // Limit to 1 digit
        onChanged: (value) {
          if (value.isNotEmpty && index < 5) {
            FocusScope.of(context).nextFocus(); // Move to next field automatically
          }
        },
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
