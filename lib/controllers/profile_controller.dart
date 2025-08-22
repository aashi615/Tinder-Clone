import 'package:assignment/Widgets/global.dart';
import 'package:assignment/models/person.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final Rx<List<Person>> usersProfileList = Rx<List<Person>>([]);
  List<Person> get allUsersProfileList => usersProfileList.value;

  @override
  void onInit() {
    super.onInit();

    usersProfileList.bindStream(
      FirebaseFirestore.instance
          .collection("Users").
          where("uid",isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots()
          .map((QuerySnapshot queryDataSnapshot) {
        List<Person> profilesList = [];

        for (var eachProfile in queryDataSnapshot.docs) {

          profilesList.add(Person.fromdataSnapshot(eachProfile));
        }


        return profilesList;
      }),
    );
  }
  favouriteSentAndFavouriteReceived(String toUserID , String senderName) async
  {
    //if that marked favourite exits
    var document = await FirebaseFirestore.instance.collection("Users").
    doc(toUserID).collection("favouriteReceived").doc(currentUserID).get();
    //remove the currentUserID from the favouriteReceived list of that profile person [toUserid]
    if(document.exists){
      await FirebaseFirestore.instance.collection("Users").
      doc(toUserID).collection("favouriteReceived").doc(currentUserID).delete();
      //remove the profile person [toUserid] from the fvuriteSent list of that profile person [toUserID]
      await FirebaseFirestore.instance.collection("Users").
      doc(currentUserID).collection("favouriteSent").doc(toUserID).delete();

    }
    //add favourite in database
    else{
      //add currentUserId to the favouritereceived list of that profile person[to user id]
      await FirebaseFirestore.instance.collection("Users").
      doc(toUserID).collection("favouriteReceived").doc(currentUserID).set({});
      //add profileperson [toUserId] to the favouriteSent list of that person
      await FirebaseFirestore.instance.collection("Users").
      doc(currentUserID).collection("favouriteSent").doc(toUserID).set({});

      //send notification

    }
    update();

  }
  LikesSentAndLikesReceived(String toUserID , String senderName) async
  {
    //if that marked favourite exits
    var document = await FirebaseFirestore.instance.collection("Users").
    doc(toUserID).collection("LikeReceived").doc(currentUserID).get();

    if(document.exists){
      await FirebaseFirestore.instance.collection("Users").
      doc(toUserID).collection("LikeReceived").doc(currentUserID).delete();

      await FirebaseFirestore.instance.collection("Users").
      doc(currentUserID).collection("LikeSent").doc(toUserID).delete();

    }
    //add favourite in database
    else{

      await FirebaseFirestore.instance.collection("Users").
      doc(toUserID).collection("LikeReceived").doc(currentUserID).set({});

      await FirebaseFirestore.instance.collection("Users").
      doc(currentUserID).collection("LikeSent").doc(toUserID).set({});

      //send notification

    }
    update();

  }

}
