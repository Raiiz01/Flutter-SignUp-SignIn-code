import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verifypages/Screens/verifyNumber.dart';
import 'package:verifypages/Themes/appTheme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedValue = 'English (US)';

  final List<Map<String, String>> _countries = [
    {'name': 'English (US)', 'flag': 'assets/us-circle.png'},
    {'name': 'soomaali (Somalia)', 'flag': 'assets/som_cir.png'},
  ];

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
                      'Select Language',
                      style: GoogleFonts.playfairDisplay(
                          textStyle: Apptheme.kTitleText),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'You can change this in yoyr profile later',
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
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              DropdownButton<String>(
                                value: _selectedValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedValue = newValue!;
                                  });
                                },
                                items: _countries.map((country) {
                                  return DropdownMenuItem<String>(
                                    value: country['name'],
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          country['flag']!,
                                          width: 24,
                                          height: 24,
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(country['name']!)
                                      ],
                                    ),
                                  );
                                }).toList(),
                                dropdownColor: Colors.white,
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: 100,
                              ),
                              Text(
                                'Choose your prefered language by clicking top button',
                                style: GoogleFonts.playfairDisplay(
                                        textStyle: Apptheme.kBodyText)
                                    .copyWith(
                                        color: Colors.black87, fontSize: 14),
                              ),
                              SizedBox(
                                height: 180,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Colors.deepPurple.shade600,
                                          foregroundColor: Colors.white,
                                          minimumSize: Size(150, 40)),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    VerifyNumber()));
                                      },
                                      child: Text(
                                        'Sign Up',
                                        style: GoogleFonts.playfairDisplay(),
                                      )),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white10,
                                          foregroundColor: Colors.black,
                                          minimumSize: Size(150, 40)),
                                      onPressed: () {},
                                      child: Text(
                                        'Sign In',
                                        style: GoogleFonts.playfairDisplay(),
                                      )),
                                ],
                              )
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
