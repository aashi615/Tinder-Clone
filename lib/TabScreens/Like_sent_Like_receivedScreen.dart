import 'package:assignment/Widgets/global.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class LikeSentLikeReceivedScreen extends StatefulWidget {
  const LikeSentLikeReceivedScreen({super.key});

  @override
  _LikeSentLikeReceivedScreenState createState() => _LikeSentLikeReceivedScreenState();
}


class _LikeSentLikeReceivedScreenState extends State<LikeSentLikeReceivedScreen> {
  bool isLikedSentClicked = true;
  List<String> LikesSentList =[];
  List<String> LikesReceivedList =[];
  List LikesList =[];
  getLikeListKeys() async{

    if(isLikedSentClicked) {
      var LikeSentDocument = await FirebaseFirestore.instance.
      collection("Users").doc(currentUserID.toString()).collection(
          "LikeSent").get();
      for(int i=0; i<LikeSentDocument.docs.length; i++){
        LikesSentList.add(LikeSentDocument.docs[i].id);
      }
      getKeysdataFromUsersCollection(LikesSentList);

    }
    else {
      var LikesReceivedDocument = await FirebaseFirestore.instance.
      collection("Users").doc(currentUserID.toString()).collection(
          "LikeReceived").get();
      for(int i=0; i<LikesReceivedDocument.docs.length; i++){
        LikesReceivedList.add(LikesReceivedDocument.docs[i].id);
      }
      getKeysdataFromUsersCollection(LikesReceivedList);

    }
  }

  getKeysdataFromUsersCollection(List<String> keysList) async
  {
    var allUsersDocument = await FirebaseFirestore.instance.collection("Users")
        .get();
    for (int i = 0; i < allUsersDocument.docs.length; i++) {
      //we get uid and compare key with that
      for (int k = 0; k < keysList.length; k++) {
        if (((allUsersDocument.docs[i].data() as dynamic)["uid"]) ==
            keysList[k])
        {
          LikesList.add(allUsersDocument.docs[i].data());
        }
      }
    }
    setState(() {
      LikesList;
    });

  }
  @override
  void initState() {
    // TODO: implement initState
    getLikeListKeys();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed:(){
                    LikesSentList.clear();
                    LikesSentList =[];
                    LikesReceivedList.clear();
                    LikesReceivedList =[];
                    LikesList.clear();
                    LikesList =[];

                    setState(() {
                      isLikedSentClicked=true;
                    });

                    getLikeListKeys();
                  },
                  child: Text(
                    "My Likes",
                    style: TextStyle(
                      color: isLikedSentClicked? Colors.white: Colors.grey,
                      fontWeight: isLikedSentClicked? FontWeight.bold : FontWeight.normal,
                      fontSize: 14,
                    ),
                  )
              ),
              const Text(
                "   |   ",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              TextButton(
                  onPressed:(){
                    LikesSentList.clear();
                    LikesSentList =[];
                    LikesReceivedList.clear();
                    LikesReceivedList =[];
                    LikesList.clear();
                    LikesList =[];

                    setState(() {
                      isLikedSentClicked=false;
                    });

                    getLikeListKeys();
                  },
                  child: Text(
                    "Liked Me",
                    style: TextStyle(
                      color: isLikedSentClicked? Colors.grey: Colors.white,
                      fontWeight: isLikedSentClicked? FontWeight.normal : FontWeight.bold,
                      fontSize: 14,
                    ),
                  )
              )
            ],
          ),
          centerTitle: true,
        ) ,
        body: LikesList.isEmpty ? Center(
          child: Icon(Icons.person_off_sharp,color: Colors.white,size: 60,),
        ): GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(8) ,
          children: List.generate(LikesList.length, (index){
            return GridTile(child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.blue.shade200,
                  child: GestureDetector(
                    onTap:(){},
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          image:
                          DecorationImage(
                            image: NetworkImage(LikesList[index]["imageProfile"]),
                            fit: BoxFit.cover,
                          )),
                      child:Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: [

                              const Spacer(),
                              Expanded(
                                child: Text(
                                    LikesList[index]["name"].toString() + "○" +  LikesList[index]["age"].toString(),
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    )
                                ),
                              ),
                              const SizedBox(height: 4,),
                              Expanded(
                                child: Text(
                                    LikesList[index]["city"].toString() + "○" +  LikesList[index]["country"].toString(),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,

                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                      ) ,
                    ),
                  ),
                )));
          }),
        )
    );
  }
}