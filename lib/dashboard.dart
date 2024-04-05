import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uniblind/navbar.dart';
import 'package:uniblind/post.dart';

class dashboard extends StatefulWidget{
  const dashboard({super.key});

  @override
  State<dashboard> createState() {
    return _dashboard();
  }

}

class _dashboard extends State<dashboard>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const navBar(),
      backgroundColor: const Color(0xFFEEF5FF),
      appBar: AppBar(

        backgroundColor: const Color.fromARGB(255, 143, 201, 255),

        title: const Center(
          child: Text('UniBlind',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        ),

        actions: [
          IconButton(onPressed: () async{
            try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print('Error signing out: $e');
    }
    
          },
          icon: const Icon(Icons.exit_to_app,color: Colors.white,)),
        ],
      ),

      body: const Center(
        child: SafeArea(
          child: PostScreen()
          ),
      ),
      
    );
  }
}