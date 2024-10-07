import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verifypages/Themes/appTheme.dart';

class VerifyNumber extends StatefulWidget {
  const VerifyNumber({super.key});

  @override
  State<VerifyNumber> createState() => _VerifyNumberState();
}

class _VerifyNumberState extends State<VerifyNumber> {
  String _selectedValue = '+1';

  final List<Map<String, String>> _countries = [
    {'name': '+1', 'flag': 'assets/us-circle.png'},
    {'name': '+252', 'flag': 'assets/som_cir.png'},
  ];

  bool _isChecked = false;

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
                      'Sign Up',
                      style: GoogleFonts.playfairDisplay(
                          textStyle: Apptheme.kTitleText),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'To get started please enter your phone number',
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
                        height: 500,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Phone Number'),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey.shade400,
                                        width: 2.0)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      flex: 0,
                                      child: DropdownButton<String>(
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
                                                CircleAvatar(
                                                  radius: 12,
                                                  backgroundImage: AssetImage(
                                                    country['flag']!,
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                Text(
                                                  country['name']!,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }).toList(),
                                        dropdownColor: Colors.white,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    VerticalDivider(
                                      thickness: 20,
                                      width: 5,
                                      indent: 10,
                                      endIndent: 10,
                                      color: Colors.black,
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            hintText: 'Phone Number',
                                            hintStyle: TextStyle(
                                              fontSize: 20,
                                              color: Colors.grey.shade400,
                                            ),
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                'To create an account you need to agree.',
                                style: GoogleFonts.playfairDisplay(
                                        textStyle: Apptheme.kBodyText)
                                    .copyWith(
                                        color: Colors.black87, fontSize: 14),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                      value: _isChecked,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _isChecked = value ?? false;
                                        });
                                      }),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text('Privacy Policy and Terms',
                                          style: GoogleFonts.playfairDisplay(
                                              textStyle: TextStyle(
                                                  decoration: TextDecoration
                                                      .underline))))
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Already have an account',
                                    style: GoogleFonts.playfairDisplay(
                                        textStyle: TextStyle(
                                            decoration:
                                                TextDecoration.underline)),
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text('Sign In',
                                          style:
                                              GoogleFonts.playfairDisplay())),
                                ],
                              ),
                              SizedBox(
                                height: 130,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Colors.deepPurple.shade600,
                                      foregroundColor: Colors.white,
                                      minimumSize: Size(double.infinity, 40)),
                                  onPressed: () {},
                                  child: Text(
                                    'Send Virification Code',
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
