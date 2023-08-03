import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purecode_project/ContactUs.dart';
import 'package:purecode_project/SendOrder.dart';

import 'Constant.dart';

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State {
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ContactUs()),
                  );
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
                  child: SafeArea(
                    child: Text('Services',
                        style: GoogleFonts.workSans(
                          fontSize: 32,
                        )),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ServicesBox('Mobile Apps', appOverview,
                                'assets/mobile pic.png'),
                            ServicesBox('Web Development', webOverview,
                                'assets/web pic.png'),
                          ],
                        ),
                        Row(
                          children: [
                            ServicesBox('Game Development', GameOverview,
                                'assets/game development pic.jpg'),
                            ServicesBox('E-Commerce', EcomrOverview,
                                'assets/E-Com.jpg'),
                          ],
                        ),
                        Row(
                          children: [
                            ServicesBox('Business Solutions', BSOverview,
                                'assets/BS.jpg'),
                            ServicesBox('Content Management', CMOverview,
                                'assets/CM.jpg'),
                          ],
                        ),
                        Row(
                          children: [
                            ServicesBox('Digital Marketing', DMOverview,
                                'assets/DM.jpg'),
                            ServicesBox('Software Development', SWDOverview,
                                'assets/SW.jpg'),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
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

  SizedBox ServicesBox(
      String servicesName, String servicesOverview, String image) {
    return SizedBox(
      width: 166.0,
      height: 225.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Color(0xFFA5C0CA),
          child: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image(
                      image: AssetImage(image),
                      height: 68,
                      width: 69,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      servicesName,
                      style: GoogleFonts.workSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(servicesOverview,
                        style: GoogleFonts.workSans(
                            fontSize: 10,
                            color: const Color.fromARGB(255, 0, 0, 0))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SizedBox(
                      height: 26,
                      width: 80,
                      child: ElevatedButton(
                        child: const Text('Order'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SendOrder()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF2BBFB0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ), //Text
          ), //Center
        ),
      ), //Card
    );
  }
}
