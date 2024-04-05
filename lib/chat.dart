import 'package:uniblind/navbar.dart';
import 'package:uniblind/widgets/chat_messages.dart';
import 'package:uniblind/widgets/new_messages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  void setupPushNotification() async{
    final fcm = FirebaseMessaging.instance;

    await fcm.requestPermission();

    final token = await fcm.getToken();
    fcm.subscribeToTopic('chat');
  }

  @override
  void initState() {
    super.initState();
    setupPushNotification();
    // final fcm = FirebaseMessaging.instance;

    // fcm.requestPermission();
  }


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
          IconButton(onPressed: (){
            FirebaseAuth.instance.signOut();
          },
          icon: const Icon(Icons.exit_to_app,color: Colors.white,)),
        ],
      ),
      body: const Column(
        children:  [
          Expanded(
            child: 
            ChatMessages()
            ),
          NewMessage(),
        ],
      ),
      );
  }
}
