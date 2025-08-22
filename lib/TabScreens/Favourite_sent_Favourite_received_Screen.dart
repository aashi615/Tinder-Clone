import 'package:assignment/Widgets/global.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class FavouriteSentFavouriteReceivedScreen extends StatefulWidget {
  const FavouriteSentFavouriteReceivedScreen({super.key});

  @override
  _FavouriteSentFavouriteReceivedScreenState createState() => _FavouriteSentFavouriteReceivedScreenState();
}


class _FavouriteSentFavouriteReceivedScreenState extends State<FavouriteSentFavouriteReceivedScreen> {
  bool isFavouriteSentClicked = true;
  List<String> favouriteSentList =[];
  List<String> favouriteReceivedList =[];
  List favouritesList =[];

  getFavouriteListKeys() async{

   if(isFavouriteSentClicked) {
     var favouriteSentDocument = await FirebaseFirestore.instance.
     collection("Users").doc(currentUserID.toString()).collection(
         "favouriteSent").get();
     for(int i=0; i<favouriteSentDocument.docs.length; i++){
     favouriteSentList.add(favouriteSentDocument.docs[i].id);
     }
     getKeysdataFromUsersCollection(favouriteSentList);

   }
   else {
     var favouriteReceivedDocument = await FirebaseFirestore.instance.
     collection("Users").doc(currentUserID.toString()).collection(
         "favouriteReceived").get();
     for(int i=0; i<favouriteReceivedDocument.docs.length; i++){
       favouriteReceivedList.add(favouriteReceivedDocument.docs[i].id);
     }
     getKeysdataFromUsersCollection(favouriteReceivedList);

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
         favouritesList.add(allUsersDocument.docs[i].data());
        }
      }
    }
    setState(() {
      favouritesList;
    });
  print("favouriteslist = " + favouritesList.toString());
  }
  @override
  void initState() {
    // TODO: implement initState
    getFavouriteListKeys();
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
                  favouriteSentList.clear();
                   favouriteSentList =[];
                  favouriteReceivedList.clear();
                 favouriteReceivedList =[];
                  favouritesList.clear();
                   favouritesList =[];

                 setState(() {
                   isFavouriteSentClicked=true;
                 });

                  getFavouriteListKeys();
                },
                child: Text(
                  "My Favourites",
                  style: TextStyle(
                    color: isFavouriteSentClicked? Colors.white: Colors.grey,
                    fontWeight: isFavouriteSentClicked? FontWeight.bold : FontWeight.normal,
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
                  favouriteSentList.clear();
                  favouriteSentList =[];
                  favouriteReceivedList.clear();
                  favouriteReceivedList =[];
                  favouritesList.clear();
                  favouritesList =[];

                  setState(() {
                    isFavouriteSentClicked=false;
                  });

                  getFavouriteListKeys();
                },
                child: Text(
                  "I'm their favourite",
                  style: TextStyle(
                    color: isFavouriteSentClicked? Colors.grey: Colors.white,
                    fontWeight: isFavouriteSentClicked? FontWeight.normal : FontWeight.bold,
                    fontSize: 14,
                  ),
                )
            )
          ],
        ),
        centerTitle: true,
      ) ,
      body: favouritesList.isEmpty ? Center(
        child: Icon(Icons.person_off_sharp,color: Colors.white,size: 60,),
      ): GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(8) ,
          children: List.generate(favouritesList.length, (index){
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
                        image: NetworkImage(favouritesList[index]["imageProfile"]),
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
                                    favouritesList[index]["name"].toString() + "○" +  favouritesList[index]["age"].toString(),
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
                                      favouritesList[index]["city"].toString() + "○" +  favouritesList[index]["country"].toString(),
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