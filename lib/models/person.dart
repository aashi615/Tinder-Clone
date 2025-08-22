import 'package:cloud_firestore/cloud_firestore.dart';

class Person{
  //personal info
  String? uid;
  String? imageProfile;
  String? email;
  String? password;
  String? name;
  int? age;
  String? phoneNo;
  String? city;
  String? country;
  String? profileHeading;
  String? LookingForInaPartner;
  int? publishDateTime;

  //appearance
  String? height;
  String? weight;
  String? bodyType;

  //Life style
  String? drink;
  String? smoke;
  String? maritalStatus;
  String? haveChildren;
  String? noOfChildren;
  String? profession;
  String? employmentStatus;
  String? income;
  String? LivingSituation;
  String? willingToRelocate;
  String? relationshipYouAreLookingFor;

  //Background
  String? nationality;
  String? education;
  String? languageSpoken;
  String? religion;
  String? ethnicity;

  Person({
    //Personal Info
    this.uid,
    this.imageProfile,
    this.email,
    this.password,
    this.name,
    this.age,
    this.phoneNo,
    this.city,
    this.country,
    this.profileHeading,
    this.LookingForInaPartner,
    this.publishDateTime,
    //Appearance
    this.height,
    this.weight,
    this.bodyType,
    //LifeStyle
    this.drink,
    this.smoke,
    this.maritalStatus,
    this.haveChildren,
    this.noOfChildren,
    this.profession,
    this.employmentStatus,
    this.income,
    this.LivingSituation,
    this.willingToRelocate,
    this.relationshipYouAreLookingFor,
    //Background
    this.nationality,
    this.education,
    this.languageSpoken,
    this.religion,
    this.ethnicity,
});
static Person fromdataSnapshot(DocumentSnapshot snapshot)
{
    var dataSnapshot = snapshot.data() as Map<String, dynamic>;
     return Person(
         uid:  dataSnapshot["uid"],
         name:  dataSnapshot["name"],
         imageProfile: dataSnapshot["imageProfile"],
         email:  dataSnapshot["email"],
         password: dataSnapshot["password"],
         age: dataSnapshot["age"],
         phoneNo: dataSnapshot["phoneNo"],
         city:  dataSnapshot["city"],
         country: dataSnapshot["country"],
         profileHeading: dataSnapshot["profileHeading"],
         LookingForInaPartner: dataSnapshot["LookingForInaPartner"],
         publishDateTime:  dataSnapshot["publishDateTime"],

         height: dataSnapshot["height"],
         weight: dataSnapshot["weight"],
         bodyType: dataSnapshot["bodyType"],

         drink:  dataSnapshot["drink"],
         smoke: dataSnapshot["smoke"],
         maritalStatus: dataSnapshot["maritalStatus"],
         haveChildren: dataSnapshot["haveChildren"],
         noOfChildren:  dataSnapshot["noOfChildren"],
         profession: dataSnapshot["profession"],
         employmentStatus: dataSnapshot["employmentStatus"],
         income: dataSnapshot["income"],
         LivingSituation:  dataSnapshot["LivingSituation"],
         willingToRelocate: dataSnapshot["willingToRelocate"],
         relationshipYouAreLookingFor: dataSnapshot["relationshipYouAreLookingFor"],

         nationality: dataSnapshot["nationality"],
         education: dataSnapshot["education"],
         languageSpoken: dataSnapshot["languageSpoken"],
         religion: dataSnapshot["religion"],
         ethnicity: dataSnapshot["ethnicity"],

     );

}
Map<String, dynamic> toJson()=>
    {
      "uid": uid,
     "imageProfile": imageProfile,
      "email": email,
      "password":password,
      "name": name,
      "age":age,
      "phoneNo":phoneNo,
      "city": city,
      "country": country,
      "profileHeading":profileHeading,
      "LookingForInaPartner":LookingForInaPartner,
      "publishDateTime": publishDateTime,

      "height": height,
      "weight":weight,
      "bodyType":bodyType,

      "drink": drink,
      "smoke": smoke,
      "maritalStatus":maritalStatus,
      "haveChildren":haveChildren,
      "noOfChildren": noOfChildren,
      "profession": profession,
      "employmentStatus":employmentStatus,
      "income":income,
      "LivingSituation": LivingSituation,
      "willingToRelocate": willingToRelocate,
      "relationshipYouAreLookingFor":relationshipYouAreLookingFor,

      "nationality":nationality,
      "education": education,
      "languageSpoken": languageSpoken,
      "religion":religion,
      "ethnicity":ethnicity,

    };

}