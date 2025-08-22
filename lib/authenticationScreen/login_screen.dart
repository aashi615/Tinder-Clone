import 'package:assignment/Widgets/custom_tex_field_widget.dart';
import 'package:assignment/authenticationScreen/registration_screen.dart';
import 'package:assignment/controllers/authentication_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen>{
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  bool showProgressBar = false;
  var controllerAuth = AuthenticationController.authController;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 120,
              ),
            Image.asset(
                'assets/Images/logo.png',
                width: 300,
            ),
              Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Login now to find your Best Match",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
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
              SizedBox(height: 30,),
              Container(
                width: MediaQuery.of(context).size.width-190,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12))
                ),
                child: InkWell(
                  onTap:(){
                    if(
                    emailTextEditingController.text.trim().isNotEmpty &&
                    passwordTextEditingController.text.trim().isNotEmpty
                    ){
                      controllerAuth.loginUser(
                          emailTextEditingController.text.trim(),
                          passwordTextEditingController.text.trim());
                    }
                    else{
                     final snackBar = SnackBar(content: Text('Please fill the email and Password credentials'));
                     ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    }
                  },
                   child: Center(
                     child: Text(
                      "Login",
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
                    "Don't have an account> ",
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
                        MaterialPageRoute(builder: (context) => RegistrationScreen()),
                      );
                    },
                    child: Text("Create Here",
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