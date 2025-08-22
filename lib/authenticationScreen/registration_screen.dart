import 'dart:io';
import 'package:assignment/Widgets/custom_tex_field_widget.dart';
import 'package:assignment/authenticationScreen/login_screen.dart';
import 'package:assignment/controllers/authentication_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';


class RegistrationScreen extends StatefulWidget{
  const RegistrationScreen({super.key});
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
{
  //personal info
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController ageTextEditingController = TextEditingController();
  TextEditingController phoneNoTextEditingController = TextEditingController();
  TextEditingController cityTextEditingController = TextEditingController();
  TextEditingController countryTextEditingController = TextEditingController();
  TextEditingController profileheadingTextEditingController = TextEditingController();
  TextEditingController LookingForInaPartnerTextEditingController = TextEditingController();
  //Appearance
  TextEditingController heightTextEditingController = TextEditingController();
  TextEditingController weightTextEditingController = TextEditingController();
  TextEditingController bodyTypeTextEditingController = TextEditingController();
  //Life Style
  TextEditingController drinkTextEditingController = TextEditingController();
  TextEditingController smokeTextEditingController = TextEditingController();
  TextEditingController martialStatusTextEditingController = TextEditingController();
  TextEditingController haveChildrenTextEditingController = TextEditingController();
  TextEditingController noOfChildrenTextEditingController = TextEditingController();
  TextEditingController professionTextEditingController = TextEditingController();
  TextEditingController employmentStatusTextEditingController = TextEditingController();
  TextEditingController incomeTextEditingController = TextEditingController();
  TextEditingController livingSituationTextEditingController = TextEditingController();
  TextEditingController willingtoRelocateTextEditingController = TextEditingController();
  TextEditingController RelationshipYouareLookingForTextEditingController = TextEditingController();
  //Background-Culture
  TextEditingController nationalityTextEditingController = TextEditingController();
  TextEditingController educationTextEditingController = TextEditingController();
  TextEditingController languageTextEditingController = TextEditingController();
  TextEditingController religionTextEditingController = TextEditingController();
  TextEditingController ethnicityTextEditingController = TextEditingController();
  bool showProgressBar = false;
  final AuthenticationController authenticationController = Get.find<AuthenticationController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'To get Started Now',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,

                ),
              ),
              const SizedBox(
                height: 16,
              ),
              authenticationController.profileImage == null
                  ? CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/Images/profile_avatar.jpg'),
                backgroundColor: Colors.black,
              )
                  : Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: FileImage(authenticationController.profileImage!),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async {
                      await authenticationController.pickImageFileFromGallery();
                      setState(() {
                        // This will trigger the rebuild after the image is picked
                      });
                    },
                    icon: Icon(Icons.image, color: Colors.grey),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    onPressed: () async {
                      await authenticationController.captureImageFileFromPhoneCamera();
                      setState(() {
                        // This will trigger the rebuild after the image is captured
                      });
                    },
                    icon: Icon(Icons.camera, color: Colors.grey),
                  ),
                ],
              ),

              const SizedBox(
                height: 30,
              ),
              //Personal Info
              const Text(
                'Personal Info:',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12,),
              //name
              Container(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: nameTextEditingController,
                  labelText: "Name",
                  iconData: Icons.person_outlined,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              //email
              Container(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: emailTextEditingController,
                  labelText: "Email",
                  iconData: Icons.email_outlined,
                  isObscure: false,
                ),
              ),
              SizedBox(height: 24,),
              //password
              Container(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: passwordTextEditingController,
                  labelText: "Password",
                  iconData: Icons.lock_outline,
                  isObscure: true,
                ),
              ),
              SizedBox(height: 24,),
              //age
              Container(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: ageTextEditingController,
                  labelText: "Age",
                  iconData: Icons.numbers,
                  isObscure: false,
                ),
              ),
              SizedBox(height: 24,),
            //phone No
              Container(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: phoneNoTextEditingController,
                  labelText: "Phone No",
                  iconData: Icons.phone,
                  isObscure: false,
                ),
              ),
              SizedBox(height: 24,),
            //city
              Container(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: cityTextEditingController,
                  labelText: "City",
                  iconData: Icons.location_city,
                  isObscure: false,
                ),
              ),
              SizedBox(height: 24,),
            //country
              Container(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: countryTextEditingController,
                  labelText: "Country",
                  iconData: Icons.location_city_sharp,
                  isObscure: false,
                ),
              ),
              SizedBox(height: 24,),
            //profileheading
              Container(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: profileheadingTextEditingController,
                  labelText: "Profile Heading",
                  iconData: Icons.text_fields,
                  isObscure: false,
                ),
              ),
              SizedBox(height: 24,),
            //LookingForInaPartner
              Container(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: LookingForInaPartnerTextEditingController,
                  labelText: "What you are looking For in a Partner",
                  iconData: Icons.face,
                  isObscure: false,
                ),
              ),
              SizedBox(height: 24,),

              //Appearance
              const Text(
                'Appearance:',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12,),
              //height
              Container(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: heightTextEditingController,
                  labelText: "Height",
                  iconData: Icons.insert_chart,
                  isObscure: false,
                ),
              ),
              //weight
              SizedBox(
                height: 24,
              ),
              Container(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: weightTextEditingController,
                  labelText: "Weight",
                  iconData: Icons.table_chart,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: bodyTypeTextEditingController,
                  labelText: "Body Type",
                  iconData: Icons.type_specimen,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 24,
              ),
            //Life Style
              const Text(
                'Life Style:',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12,),
              //drink
              Container(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: drinkTextEditingController,
                  labelText: "Drink",
                  iconData: Icons.local_drink,
                  isObscure: false,
                ),
              ),

              SizedBox(
                height: 24,
              ),
              //smoke
              Container(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: smokeTextEditingController,
                  labelText: "Smoke",
                  iconData: Icons.smoking_rooms,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              //martial status
              Container(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: martialStatusTextEditingController,
                  labelText: "Marital Status",
                  iconData: Icons.people_alt_outlined,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              //have children
              Container(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: haveChildrenTextEditingController,
                  labelText: "Do you have children?",
                  iconData: Icons.people_rounded,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              //noofchildren
              Container(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: noOfChildrenTextEditingController,
                  labelText: "Number of children",
                  iconData: Icons.person_3_outlined,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              //profession
              Container(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: professionTextEditingController,
                  labelText: "Profession",
                  iconData: Icons.business_center,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              //employment status
              Container(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: employmentStatusTextEditingController,
                  labelText: "Employment Status",
                  iconData: CupertinoIcons.sort_down,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              //Annual Income
              Container(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: incomeTextEditingController,
                  labelText: "Income",
                  iconData: Icons.money,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              //living Situation
              Container(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: livingSituationTextEditingController,
                  labelText: "Living Situation",
                  iconData: Icons.roofing_sharp,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 24,
              ),

              Container(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: willingtoRelocateTextEditingController,
                  labelText: "Are you willing to relocate?",
                  iconData: Icons.location_city,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              //Relationship you are looking for
              Container(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: RelationshipYouareLookingForTextEditingController,
                  labelText: "What relationship are you looking for",
                  iconData: Icons.person_2_outlined,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 24,
              ),
           //Cultural Values
              const Text(
                'Cultural Values:',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12,),
              //nationality
              Container(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: nationalityTextEditingController,
                  labelText: "Nationality",
                  iconData: Icons.flag,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              //education
              Container(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: educationTextEditingController,
                  labelText: "Education",
                  iconData: Icons.history_edu,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              //Language spoken
              Container(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: languageTextEditingController,
                  labelText: "Language",
                  iconData: Icons.speaker_group_outlined,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              //religion
              Container(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: religionTextEditingController,
                  labelText: "Religion",
                  iconData: Icons.check_circle_sharp,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              //ethnicity
              Container(
                width: MediaQuery.of(context).size.width-36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: ethnicityTextEditingController,
                  labelText: "Ethnicity",
                  iconData: Icons.remove_red_eye,
                  isObscure: false,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width-190,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12))
                ),
                child: InkWell(
                  onTap: () async {
                    if (authenticationController.profileImage == null) {
                      final snackBar = SnackBar(content: Text('Please pick an image from the gallery!'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      return;
                    }

                    // Check if all required fields are filled
                    if (nameTextEditingController.text.trim().isEmpty &&
                        emailTextEditingController.text.trim().isEmpty &&
                        passwordTextEditingController.text.trim().isEmpty &&
                        ageTextEditingController.text.trim().isEmpty &&
                        phoneNoTextEditingController.text.trim().isEmpty &&
                        cityTextEditingController.text.trim().isEmpty &&
                        countryTextEditingController.text.trim().isEmpty &&
                        profileheadingTextEditingController.text.trim().isEmpty &&
                        LookingForInaPartnerTextEditingController.text.trim().isEmpty &&
                        heightTextEditingController.text.trim().isEmpty &&
                        weightTextEditingController.text.trim().isEmpty &&
                        bodyTypeTextEditingController.text.trim().isEmpty &&
                        drinkTextEditingController.text.trim().isEmpty &&
                        smokeTextEditingController.text.trim().isEmpty &&
                        martialStatusTextEditingController.text.trim().isEmpty &&
                        haveChildrenTextEditingController.text.trim().isEmpty &&
                        noOfChildrenTextEditingController.text.trim().isEmpty &&
                        professionTextEditingController.text.trim().isEmpty &&
                        employmentStatusTextEditingController.text.trim().isEmpty &&
                        incomeTextEditingController.text.trim().isEmpty &&
                        livingSituationTextEditingController.text.trim().isEmpty &&
                        willingtoRelocateTextEditingController.text.trim().isEmpty &&
                        RelationshipYouareLookingForTextEditingController.text.trim().isEmpty &&
                        nationalityTextEditingController.text.trim().isEmpty &&
                        educationTextEditingController.text.trim().isEmpty &&
                        languageTextEditingController.text.trim().isEmpty &&
                        religionTextEditingController.text.trim().isEmpty &&
                        ethnicityTextEditingController.text.trim().isEmpty) {
                      final snackBar = SnackBar(content: Text('Please fill in all the required fields.'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      return;
                    }

                    setState(() {
                      showProgressBar = true;
                    });
                    authenticationController.imageFile = null;

                    try {
                      await authenticationController.createNewUserAccount(
                        name: nameTextEditingController.text.trim(),
                        imageProfile: authenticationController.profileImage!,
                        email: emailTextEditingController.text.trim(),
                        password: passwordTextEditingController.text.trim(),
                        age: ageTextEditingController.text.trim(),
                        phoneNo: phoneNoTextEditingController.text.trim(),
                        city: cityTextEditingController.text.trim(),
                        country: countryTextEditingController.text.trim(),
                        profileHeading: profileheadingTextEditingController.text.trim(),
                        lookingForInaPartner: LookingForInaPartnerTextEditingController.text.trim(),
                        height: heightTextEditingController.text.trim(),
                        weight: weightTextEditingController.text.trim(),
                        bodyType: bodyTypeTextEditingController.text.trim(),
                        drink: drinkTextEditingController.text.trim(),
                        smoke: smokeTextEditingController.text.trim(),
                        maritalStatus: martialStatusTextEditingController.text.trim(),
                        haveChildren: haveChildrenTextEditingController.text.trim(),
                        noOfChildren: noOfChildrenTextEditingController.text.trim(),
                        profession: professionTextEditingController.text.trim(),
                        employmentStatus: employmentStatusTextEditingController.text.trim(),
                        income: incomeTextEditingController.text.trim(),
                        livingSituation: livingSituationTextEditingController.text.trim(),
                        willingToRelocate: willingtoRelocateTextEditingController.text.trim(),
                        relationshipYouAreLookingFor: RelationshipYouareLookingForTextEditingController.text.trim(),
                        nationality: nationalityTextEditingController.text.trim(),
                        education: educationTextEditingController.text.trim(),
                        languageSpoken: languageTextEditingController.text.trim(),
                        religion: religionTextEditingController.text.trim(),
                        ethnicity: ethnicityTextEditingController.text.trim(),
                      );

                      setState(() {
                        showProgressBar = false;
                      });

                      final snackBar = SnackBar(content: Text('Account created successfully!'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } catch (e) {
                      setState(() {
                        showProgressBar = false;
                      });

                      final snackBar = SnackBar(content: Text('Something went wrong. Please try again.'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },

                  child: Center(
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ),


              ),
              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account> ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(width: 5,),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>   LoginScreen()),
                      );
                    },
                    child: Text("Click Here",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              showProgressBar== true ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
              ): Container(),

            ],
          ),
        ),
      ),
    );
  }
}
