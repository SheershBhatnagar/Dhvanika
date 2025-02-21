import 'package:flutter/material.dart';

import 'package:dhvanika/screens/home/discover_screen.dart';
import 'package:dhvanika/screens/home/files_screen.dart';
import 'package:dhvanika/screens/home/favourites_screen.dart';
import 'package:dhvanika/screens/home/profile_screen.dart';
import 'package:dhvanika/widgets/appbar_main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedScreen = 0;

  static const List<Widget> screens = [
    DiscoverScreen(),
    FavouritesScreen(),
    FilesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBarMain(
        title: selectedScreen == 0 ? 'Discover' : selectedScreen == 1 ? 'Favourites' : selectedScreen == 2 ? 'Files' : 'Profile',
      ),
      body: screens[selectedScreen],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedScreen,
        onTap: (index) {
          setState(() {
            selectedScreen = index;
          });
        },
        enableFeedback: true,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 1,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.music_note_rounded,
              color: Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.black,
            ),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.insert_drive_file_sharp,
              color: Colors.black,
            ),
            label: 'Files',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2_rounded,
              color: Colors.black,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
