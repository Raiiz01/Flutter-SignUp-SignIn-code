import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verifypages/Themes/appTheme.dart';

class VerifyCode extends StatefulWidget {
  const VerifyCode({super.key});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {

  final String number = '+252613666337';

  late Timer _timer;
  int start = 59;

  void initState(){
    super.initState();
    startTimer();
  }

  void startTimer(){
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          if (start > 0){
            start--;
          }else{
            _timer.cancel();
          }
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('eBook',
            style: GoogleFonts.playfairDisplay(textStyle: Apptheme.kTitleText)),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(
              left: 15,
            ),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.comment_outlined,
                  color: Colors.white,
                  size: 28,
                )),
          )
        ],
        backgroundColor: Colors.deepPurple.shade600,
      ),
      backgroundColor: Colors.deepPurple.shade600,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 0, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Verification Code',
                      style: GoogleFonts.playfairDisplay(
                          textStyle: Apptheme.kTitleText),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Enter 6-digit code sent to',
                      style: GoogleFonts.playfairDisplay(
                              textStyle: Apptheme.kBodyText)
                          .copyWith(color: Colors.grey.shade300),
                    ),
                    Text(
                      number,
                      style: GoogleFonts.playfairDisplay(
                              textStyle: Apptheme.kBodyText)
                          .copyWith(color: Colors.grey.shade300),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        image: DecorationImage(
                            image: AssetImage('assets/raiiz.png'),
                            fit: BoxFit.cover),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Positioned(
                      top: 120,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 600,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Resend Code: ${start}'),
                              SizedBox(
                                height: 0,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Colors.deepPurple.shade600,
                                      foregroundColor: Colors.white,
                                      minimumSize: Size(double.infinity, 40)),
                                  onPressed: () {
                                    setState(() {
                                      _timer.toString();
                                    });
                                  },
                                  child: Text(
                                    'Verify Phone Number',
                                    style: GoogleFonts.playfairDisplay(),
                                  ))
                            ],   
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}