import 'package:assignment/TabScreens/swiping_screen.dart';
import 'package:assignment/homeScreen/homeScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserDetailsScreen extends StatefulWidget {
  UserDetailsScreen({Key? key}) : super(key: key); // Removed userID from constructor

  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  String imageProfile="";
  String name = "";
  String age = "";
  String phoneNo = "";
  String city = "";
  String country = "";
  String profileHeading = "";
  String lookingForInPartner = "";

  // Appearance
  String height = "";
  String weight = "";
  String bodyType = "";

  // Lifestyle
  String drink = "";
  String smoke = "";
  String maritalStatus = "";
  String haveChildren = "";
  String noOfChildren = "";
  String profession = "";
  String employmentStatus = "";
  String income = "";
  String livingSituation = "";
  String willingToRelocate = "";
  String relationshipYouAreLookingFor = "";

  // Background
  String nationality = "";
  String education = "";
  String languageSpoken = "";
  String religion = "";
  String ethnicity = "";


  retrieveUserInfo() async {
    // Get the current user's ID
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      final snapshot = await FirebaseFirestore.instance
          .collection("Users")
          .doc(currentUser.uid) // Use the current user's ID
          .get();

      if (snapshot.exists) {
        print("User found: ${snapshot.data()}"); // Debug line

        // Check if the image URL exists
        if (snapshot.data()!["imageProfile"] != null) { // Adjusted field name to imageProfile
          imageProfile = snapshot.data()!["imageProfile"];
        } else {
          imageProfile = ""; // Set to an empty string if no image is found
        }
        setState(() {
          name = snapshot.data()!["name"] ?? "";
          age = snapshot.data()!['age']?.toString() ?? "";
          phoneNo = snapshot.data()!['phoneNo'] ?? "";
          city = snapshot.data()!["city"] ?? "";
          country = snapshot.data()!["country"] ?? "";
          profileHeading = snapshot.data()!["profileHeading"] ?? "";
          lookingForInPartner = snapshot.data()!["LookingForInaPartner"] ?? "";

          height = snapshot.data()!["height"] ?? "";
          weight = snapshot.data()!['weight'] ?? "";
          bodyType = snapshot.data()!["bodyType"] ?? "";

          drink = snapshot.data()!["drink"] ?? "";
          smoke = snapshot.data()!["smoke"] ?? "";
          maritalStatus = snapshot.data()!["maritalStatus"] ?? "";
          haveChildren = snapshot.data()!["haveChildren"] ?? "";
          noOfChildren = snapshot.data()!['noOfChildren'] ?? "";
          profession = snapshot.data()!['profession'] ?? "";
          employmentStatus = snapshot.data()!["employmentStatus"] ?? "";
          income = snapshot.data()!["income"] ?? "";
          livingSituation = snapshot.data()!["LivingSituation"] ?? "";
          willingToRelocate = snapshot.data()!["willingToRelocate"] ?? "";
          relationshipYouAreLookingFor = snapshot.data()!["relationshipYouAreLookingFor"] ?? "";

          nationality = snapshot.data()!["nationality"] ?? "";
          education = snapshot.data()!["education"] ?? "";
          languageSpoken = snapshot.data()!["languageSpoken"] ?? "";
          religion = snapshot.data()!["religion"] ?? "";
          ethnicity = snapshot.data()!['ethnicity'] ?? "";
        });
      } else {
        print("User not found");
      }
    } else {
      print("No user is signed in");
    }
  }

  @override
  void initState() {
    super.initState();
    retrieveUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "User Profile",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,

        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              // Optionally navigate back to login screen or home
            },
            icon: Icon(Icons.logout, size: 30),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              // Displaying the profile image
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(imageProfile),
              ),

              // Displaying user information in a table format
              Text("Personal Info", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Divider(height: 40, thickness: 1, color: Colors.white),
              Table(
                columnWidths: {
                  0: FixedColumnWidth(120), // Adjust this width as necessary
                  1: FlexColumnWidth(),
                },
                children: [
                  TableRow(
                    children: [
                      Text("Name:", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(name),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text("Age:", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(age),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text("Phone:", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(phoneNo),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text("City:", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(city),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text("Country:", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(country),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text("Profile Heading:", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(profileHeading),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text("Looking for:", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(lookingForInPartner),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Appearance details
              Text("Appearance", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Divider(height: 40, thickness: 1, color: Colors.white),
              Table(
                columnWidths: {
                  0: FixedColumnWidth(120),
                  1: FlexColumnWidth(),
                },
                children: [
                  TableRow(
                    children: [
                      Text("Height:", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(height),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text("Weight:", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(weight),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text("Body Type:", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(bodyType),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Lifestyle details
              Text("Lifestyle", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Divider(height: 40, thickness: 1, color: Colors.white),
              Table(
                columnWidths: {
                  0: FixedColumnWidth(120),
                  1: FlexColumnWidth(),
                },
                children: [
                  TableRow(
                    children: [
                      Text("Drinks:", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(drink),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text("Smokes:", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(smoke),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text("Marital Status:", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(maritalStatus),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text("Has Children:", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(haveChildren),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text("Number of Children:", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(noOfChildren),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text("Profession:", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(profession),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text("Employment Status:", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(employmentStatus),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text("Income:", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(income),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text("Living Situation:", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(livingSituation),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text("Willing to Relocate:", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(willingToRelocate),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text("Relationship Goal:", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(relationshipYouAreLookingFor),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Background details
              Text("Background", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Divider(height: 40, thickness: 1, color: Colors.white),
              Table(
                columnWidths: {
                  0: FixedColumnWidth(120),
                  1: FlexColumnWidth(),
                },
                children: [
                  TableRow(
                    children: [
                      Text("Nationality:", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(nationality),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text("Education:", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(education),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text("Languages Spoken:", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(languageSpoken),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text("Religion:", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(religion),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text("Ethnicity:", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(ethnicity),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
