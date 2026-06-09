import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

import '../screens/home/home_screen.dart';
import '../screens/explore/explore_screen.dart';
import '../screens/create/create_post_screen.dart';
import '../screens/chat/chat_list_screen.dart';
import '../screens/profile/profile_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomeScreen(),

    ExploreScreen(),

    CreatePostScreen(),

    ChatListScreen(),

    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        backgroundColor: AppColors.card,

        selectedItemColor: AppColors.primary,

        unselectedItemColor: Colors.grey,

        type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.travel_explore_rounded),
            label: "Explore",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, size: 36),
            label: "Create",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_rounded),
            label: "Chats",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
