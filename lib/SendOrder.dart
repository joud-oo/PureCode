import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

final List<String> servicesItems = [
  'Web Development',
  'Mobile Application',
  'Game Development',
  'E-Commerce',
  'Business Solutions',
  'Content Management',
  'Digital Marketing',
  'Software Development'
];
String? selectedValue;

final _formKey = GlobalKey<FormState>();

class SendOrder extends StatefulWidget {
  const SendOrder({Key? key}) : super(key: key);

  @override
  _SendOrderState createState() => _SendOrderState();
}

class _SendOrderState extends State {
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
            child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.arrow_back_ios_new_rounded,
                      color: Color(0xFF333E50)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Services',
                    style: TextStyle(fontSize: 32, color: Color(0xFF333E50)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Icon(
                  Icons.description_outlined,
                  size: 180,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    DropdownButtonFormField2<String>(
                      isExpanded: true,
                      decoration: InputDecoration(
                        // Add Horizontal padding using menuItemStyleData.padding so it matches
                        // the menu padding when button's width is not specified.
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        // Add more decoration..
                      ),
                      hint: const Text(
                        'Select Service',
                        style: TextStyle(fontSize: 14),
                      ),
                      items: servicesItems
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Please select service.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        //Do something when selected item is changed.
                      },
                      onSaved: (value) {
                        selectedValue = value.toString();
                      },
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.only(right: 8),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 24,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFiled('Full name'),
                    SizedBox(height: 10),
                    TextFiled('E-mail'),
                    const SizedBox(height: 10),
                    TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(16),
                          hintText: 'Select Date',
                          hintStyle: const TextStyle(fontSize: 14),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onTap: () => _selectDate(context)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 44,
                        width: 120,
                        child: ElevatedButton(
                          child: const Text('Send Request'),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              showTopSnackBar(
                                Overlay.of(context),
                                const CustomSnackBar.success(
                                  message:
                                      'Good job, your release is successful. Have a nice day',
                                  backgroundColor:
                                      Color.fromARGB(255, 212, 162, 162),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF2BBFB0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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

TextFormField TextFiled(String text) {
  return TextFormField(
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.all(16),
      hintText: text,
      hintStyle: const TextStyle(fontSize: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
}

Future<void> _selectDate(BuildContext context) async {
  final DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
  );
  if (selectedDate != null) {
    // Do something with the selected date
  }
}
