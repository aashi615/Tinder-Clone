import 'dart:io';
import 'package:assignment/homeScreen/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:assignment/models/person.dart' as personModel;


class AuthenticationController extends GetxController {
  static AuthenticationController authController = Get.find();

  // Initialize pickedFile with a null value
  Rx<File?> pickedFile = Rx<File?>(null);

  // Getter for profile image
  File? get profileImage => pickedFile.value;
  XFile? imageFile;



  // Method to pick an image from the gallery
  pickImageFileFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      // Update the picked file with the selected image
      pickedFile.value = File(image.path);
      Get.snackbar("Profile Image", "You have successfully picked your image");
    }
  }

  // Method to capture an image from the camera
  captureImageFileFromPhoneCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      // Update the picked file with the captured image
      pickedFile.value = File(image.path);
      Get.snackbar("Profile Image", "You have successfully captured the image using the camera");
    }
  }

  // Method to upload an image to Firebase Storage
  Future<String> uploadImageToStorage(File imageFile) async {
    Reference referenceStorage = FirebaseStorage.instance
        .ref()
        .child("Profile Images")
        .child(FirebaseAuth.instance.currentUser!.uid);

    UploadTask task = referenceStorage.putFile(imageFile);
    TaskSnapshot snapshot = await task;

    String downloadUrlOfImage = await snapshot.ref.getDownloadURL();
    return downloadUrlOfImage;
  }

  // Method to create a new user account and store the user data in Firestore
  Future<void> createNewUserAccount({
    // Personal Info
    required String name,
    required File imageProfile,
    required String email,
    required String password,
    required String age,
    required String phoneNo,
    required String city,
    required String country,
    required String profileHeading,
    required String lookingForInaPartner,
    String? publishDateTime,

    // Appearance
    required String height,
    required String weight,
    required String bodyType,

    // Lifestyle
    required String drink,
    required String smoke,
    required String maritalStatus,
    required String haveChildren,
    required String noOfChildren,
    required String profession,
    required String employmentStatus,
    required String income,
    required String livingSituation,
    required String willingToRelocate,
    required String relationshipYouAreLookingFor,

    // Background
    required String nationality,
    required String education,
    required String languageSpoken,
    required String religion,
    required String ethnicity,
  }) async {
    try {
      // Create the user account in Firebase Authentication
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // Upload the profile image to Firebase Storage and get the download URL
      String UrlofDownloadedImage="";
      if (profileImage != null) {
       UrlofDownloadedImage = await uploadImageToStorage(profileImage!);
      }

      //Store user information in Firestore
      personModel.Person personInstance = personModel.Person(
        //personal Info
        uid: FirebaseAuth.instance.currentUser!.uid,
        imageProfile: UrlofDownloadedImage,
        email: email,
        password: password,
        name: name,
        age:int.parse(age),
        phoneNo: phoneNo,
        city: city,
        country: country,
        profileHeading: profileHeading,
        LookingForInaPartner: lookingForInaPartner,
        publishDateTime: DateTime.now().millisecondsSinceEpoch,
        //Appearance
        height: height,
        weight: weight,
        bodyType: bodyType,
        //Life Style
        drink: drink,
        smoke: smoke,
        maritalStatus: maritalStatus,
        haveChildren: haveChildren,
        noOfChildren: noOfChildren,
        profession: profession,
        employmentStatus: employmentStatus,
        income: income,
        LivingSituation: livingSituation,
        willingToRelocate: willingToRelocate,
        relationshipYouAreLookingFor: relationshipYouAreLookingFor,
        //Background
        nationality: nationality,
        education: education,
        languageSpoken: languageSpoken,
        religion: religion,
        ethnicity: ethnicity,
      );

await FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).
    set(personInstance.toJson());

      Get.to(homeScreen());

    } catch (error) {
      Get.snackbar("Account Creation Unsuccessful", "Error occurred: $error");
    }
  }
  loginUser(String emailUser, String password) async {
    try {
      // Perform login using Firebase
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailUser,
        password: password,
      );

      // Show a success message using GetX's snackbar
      Get.snackbar("Success", "Login successful!");

      // Navigate to the home screen using GetX
      Get.off(homeScreen()); // Replace with your actual route
    } catch (error) {
      String errorMsg;

      // Catch FirebaseAuth-specific errors
      if (error is FirebaseAuthException) {
        if (error.code == 'user-not-found') {
          errorMsg = 'No user found for this email.';
        } else if (error.code == 'wrong-password') {
          errorMsg = 'Wrong password provided.';
        } else {
          errorMsg = 'Login failed. Please try again.';
        }
      } else {
        errorMsg = 'An unexpected error occurred.';
      }

      // Show an error message using GetX's snackbar
      Get.snackbar("Login Unsuccessful", "Error occurred: $errorMsg");
    }
  }

}

