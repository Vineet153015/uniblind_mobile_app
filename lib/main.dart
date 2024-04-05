import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uniblind/authenticationScreens/signup.dart';
import 'package:uniblind/dashboard.dart'; 
import 'package:uniblind/dashboardloading.dart';
import 'package:uniblind/homepage.dart';


import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const dashloading();
          }
          
          if(snapshot.hasData){
            return const dashboard();
          }

          return const signup();
        },)
    )
  );
}