import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purecode_project/Constant.dart';
import 'package:ionicons/ionicons.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'SendOrder.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State {
  int _selectedTab = 0;
  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1C6179),
          toolbarHeight: 65,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 5.0),
            child: Image(
              image: AssetImage('assets/Logo.png'),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white70),
              tooltip: 'Search',
              iconSize: 40,
              onPressed: () {
                // handle the press
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: Icon(
                  Icons.headset_mic_outlined,
                  color: Color(0xff333E50),
                ),
                tooltip: 'Contact Us',
                iconSize: 40,
                onPressed: () {
                  // handle the press
                },
              ),
            ),
          ],
        ),

        body: SafeArea(
            child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      titles('Contact Information'),
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SizedBox(
                          width: 349,
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Card(
                              color: Color(0xFFA5C0CA),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    SizedBox(height: 5),
                                    ConatctInfo(phone),
                                    SizedBox(height: 10),
                                    ConatctInfo(Email),
                                    SizedBox(height: 10),
                                    ConatctInfo(Location),
                                    SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(Icons.telegram_outlined),
                                        Icon(Ionicons.logo_twitter),
                                        Icon(Ionicons.logo_linkedin),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ], // children
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      titles('Contact Form'),
                      SizedBox(height: 5),
                      TextFiled('Full name'),
                      SizedBox(height: 10),
                      TextFiled('Email'),
                      SizedBox(height: 10),
                      des('Description'),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 37,
                          width: 140,
                          child: ElevatedButton(
                            child: const Text('Send Message'),
                            onPressed: () {
                              showTopSnackBar(
                                Overlay.of(context),
                                const CustomSnackBar.success(
                                  message:
                                      'Good job, your release is successful. Have a nice day',
                                  backgroundColor:
                                      Color.fromARGB(255, 212, 162, 162),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF2BBFB0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(children: [
                      titles('FAQ ?'),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            FQA(Q1, Ans1),
                            FQA(Q2, Ans2),
                          ],
                        ),
                      )
                    ]))
              ],
            )
          ],
        )),

        //bootom bar
        bottomNavigationBar: Theme(
          data: ThemeData(
            canvasColor: Color(0xff1C6179),
          ),
          // child: Padding(
          //padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
            child: BottomNavigationBar(
              currentIndex: _selectedTab,
              onTap: (index) => _changeTab(index),
              selectedItemColor: Colors.white,
              unselectedItemColor: Color(0xff333E50),
              showSelectedLabels: true,
              showUnselectedLabels: true,
              iconSize: 40,
              selectedFontSize: 18,
              unselectedFontSize: 14,
              selectedLabelStyle: GoogleFonts.workSans(),
              unselectedLabelStyle: GoogleFonts.workSans(),
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.space_dashboard_rounded),
                  label: "Services",
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.art_track_sharp), label: "OurWork"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: "Settings"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding FQA(String Q, String answer) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 300,
        height: 170,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
              color: Color(0xFFA5C0CA),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Flexible(
                        child: Column(
                      children: [
                        Quastions(Q),
                        ConatctInfo(answer),
                      ],
                    ))
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Padding titles(String title) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Text(
        title,
        style: GoogleFonts.workSans(
            fontSize: 24, color: const Color.fromARGB(255, 0, 0, 0)),
      ),
    );
  }

  Text ConatctInfo(String info) {
    return Text(info,
        textAlign: TextAlign.left,
        style: GoogleFonts.workSans(
            fontSize: 14, color: const Color.fromARGB(255, 0, 0, 0)));
  }

  Text Quastions(String info) {
    return Text(info,
        textAlign: TextAlign.left,
        style: GoogleFonts.workSans(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: const Color.fromARGB(255, 0, 0, 0)));
  }
}

TextFormField des(String text) {
  return TextFormField(
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.all(30),
      hintText: text,
      hintStyle: const TextStyle(fontSize: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
}
