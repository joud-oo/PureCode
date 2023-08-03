import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ContactUs.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State {
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
            child: Column(
          children: [
            Row(
              children: [
                Text(''),
                Card(),
              ],
            ),
          ], // children
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
}
