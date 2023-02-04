import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseapp/login_page.dart';
import 'package:firebaseapp/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  static AuthController instance = Get.find();

  late Rx<User?> _User;
  FirebaseAuth auth = FirebaseAuth.instance;


  @override
  void onReady(){
     super.onReady();
     _User = Rx<User?>(auth.currentUser);
     _User.bindStream(auth.userChanges());
     ever(_User, _initialScreen);
  }


  _initialScreen(User? user){
    if(user == null){
      print("login page");
      Get.offAll(()=>LoginPage());

    }
    else{
      Get.offAll(()=>WelcomePage(email: user.email!,));
    }
  }

  Future<void> register(String email,password) async {
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    }
    catch(e){
      Get.snackbar("About user", "User Meassage",
      backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "Account Creation Failed",
          style: TextStyle(
            color: Colors.white
          ),
        )
      );

    }
  }

  Future<void> Login(String email,password) async {
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
    }
    catch(e){
      Get.snackbar("About Login", "Login Meassage",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Login Failed",
            style: TextStyle(
                color: Colors.white
            ),
          )
      );

    }
  }
  Future<void> logout() async {
    await auth.signOut();
  }
}