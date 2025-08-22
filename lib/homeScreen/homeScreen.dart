import 'package:assignment/TabScreens/Favourite_sent_Favourite_received_Screen.dart';
import 'package:assignment/TabScreens/Like_sent_Like_receivedScreen.dart';
import 'package:assignment/TabScreens/User_Details_Screen.dart';
import 'package:assignment/TabScreens/swiping_screen.dart';
import 'package:assignment/TabScreens/view_sent_view_received_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget{
  const homeScreen({super.key});
  @override
  State<homeScreen> createState() => _homeScreenState();
}
class _homeScreenState extends State<homeScreen>{
  int _currentIndex=0;
  List tabScreensList = [
     SwipingScreen(),
     ViewSentViewReceivedScreen(),
     FavouriteSentFavouriteReceivedScreen(),
     LikeSentLikeReceivedScreen(),
     UserDetailsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: tabScreensList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,size: 30,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.remove_red_eye,size: 30,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star,size: 30,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite,size: 30,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,size: 30,),
            label: 'User Details',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white12,

      ),


    );
  }
}