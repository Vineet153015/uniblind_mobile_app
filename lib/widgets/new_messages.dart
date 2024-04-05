import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget{
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() {
    return _NewMessageState();
}
}

class _NewMessageState extends State<NewMessage>{

final _messageController = TextEditingController();


  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _submitMessage() async {
    final enteredMessage = _messageController.text;

    

    if(enteredMessage.trim().isEmpty){
      return;
    }
    FocusScope.of(context).unfocus();
    _messageController.clear();


    final user = FirebaseAuth.instance.currentUser!;

    final userData = await FirebaseFirestore.instance
    .collection('users')
    .doc(user.uid)
    .get();

    FirebaseFirestore.instance
    .collection('chat')
    .add(
      {
        'text': enteredMessage,
        'createdAt': Timestamp.now(),
        'userId': user.uid,
        'username' : userData.data()!['username'],
      }
    );
    
    
  }


  @override
  Widget build(BuildContext context) {
    
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(20), // Optional: Add rounded corners
            ),
            color: Color.fromARGB(255, 194, 236, 255),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 1),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _messageController,
                textCapitalization: TextCapitalization.sentences,
                autocorrect: true,
                enableSuggestions: true,
                decoration: const InputDecoration(
                  labelText: 'Send a message...',
                  border: InputBorder.none
                ),
              )
            ),IconButton(onPressed: _submitMessage, 
            icon: const Icon(Icons.send,color: Colors.blue,),
            color: Theme.of(context).colorScheme.primary,
            )
          ],
        ),
        ),
    );
  }
}