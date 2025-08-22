import 'package:assignment/Widgets/global.dart';
import 'package:assignment/controllers/profile_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class SwipingScreen extends StatefulWidget {
  const SwipingScreen({super.key});

  @override
  _SwipingScreenState createState() => _SwipingScreenState();
}

class _SwipingScreenState extends State<SwipingScreen> {
  ProfileController profileController = Get.put(ProfileController());
  String senderName="";
  readCurrentUserData() async{
    await FirebaseFirestore.instance.
    collection("Users").doc(currentUserID).get().then((dataSnapshot)
    {
     setState(() {
       senderName= dataSnapshot.data()!['name'].toString();
     });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readCurrentUserData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
      if (profileController.allUsersProfileList.isEmpty) {
        return Center(
          child: Text("No profiles available."),
        );
      }
      return PageView.builder(
        itemCount: profileController.allUsersProfileList.length,
        controller: PageController(initialPage: 0, viewportFraction: 1),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final eachProfileInfo = profileController.allUsersProfileList[index];

          return DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  eachProfileInfo.imageProfile.toString(),
                ),
                fit: BoxFit.cover,
              ),
            ),
            child:Padding(
                padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                //Filter Icon button
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                   child: IconButton(onPressed: (){},
                      icon:Icon(Icons.filter_list,size: 30,) )
                )),
                const Spacer(),
                //user Data
                GestureDetector(
                  onTap: (){},
                  child: Column(
                    children: [
                      Text(
                        eachProfileInfo.name.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          letterSpacing: 4,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //age
                      Text(
                        eachProfileInfo.age.toString()+" ◦ "+eachProfileInfo.city.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          letterSpacing: 4,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(onPressed:(){},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white30,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            )
                          ),
                            child: Text(
                              eachProfileInfo.profession.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(width: 6,),
                          ElevatedButton(onPressed:(){},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white30,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                )
                            ),
                            child: Text(
                              eachProfileInfo.religion.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(onPressed:(){},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white30,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                )
                            ),
                            child: Text(
                              eachProfileInfo.country.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(width: 6,),
                          ElevatedButton(onPressed:(){},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white30,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                )
                            ),
                            child: Text(
                              eachProfileInfo.ethnicity.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                //Image Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        profileController.favouriteSentAndFavouriteReceived(eachProfileInfo.uid.toString(), senderName);
                      },
                      child: Image.asset("assets/Images/favourite.png",width: 50,),
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Image.asset("assets/Images/chat.png",width: 80,),
                    ),
                    GestureDetector(
                      onTap: (){
                        profileController.LikesSentAndLikesReceived(eachProfileInfo.uid.toString(), senderName);
                      },
                      child: Image.asset("assets/Images/likes.png",width: 50,),
                    )
                  ],
                )
              ],
            ),

            ),
          );
        },
      );
    }),

    );
  }
}