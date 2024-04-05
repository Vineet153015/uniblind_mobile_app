import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uniblind/navbar.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({super.key});

  @override
  State<UserImagePicker> createState() {
    // TODO: implement createState
    return _UserImagePickerState();
  }
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImageFile;
  final _postcontentController = TextEditingController();
  final _titleController = TextEditingController();
  var imageUrl;

  @override
  void dispose() {
    _postcontentController.dispose();
    super.dispose();
  }

  void _postButton() async{
    final user = FirebaseAuth.instance.currentUser!;

    final content = _postcontentController.text;
    final title = _titleController.text;

    if (content.trim().isEmpty) {
      return ;
    }
    if(_pickedImageFile!= null){
    try{
      final storageRef = FirebaseStorage.instance
                      .ref()
                      .child('post')
                      .child('${user.uid}_${DateTime.now().millisecondsSinceEpoch}.jpg');
    
    await storageRef.putFile(_pickedImageFile!);
        imageUrl = await storageRef.getDownloadURL();

        final userData = await FirebaseFirestore.instance
    .collection('users')
    .doc(user.uid)
    .get();

    FirebaseFirestore.instance
    .collection('posts')
    .add({
      'text': content,
      'createdAt' : Timestamp.now(),
      'userId' : user.uid,
      'username' : userData.data()!['username'],
      'title' :  title,
      'image_url' : imageUrl,
    });
    }
    catch (error) {
      print('Error uploading image: $error');
    }
  } 

    FocusScope.of(context).unfocus();
    _postcontentController.clear();

    
  

  
  }

  void _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: max(80, 100),
        maxWidth: 390,
        maxHeight: 300);

    if (pickedImage == null) {
      return;
    }

    setState(() {
      _pickedImageFile = File(pickedImage.path);
    });

    // widget.onPickImage(_pickedImageFile!);
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, right: 8 , left: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: 390,
                      height: 300,
                      color: Colors.grey,
                      child: _pickedImageFile != null
                          ? Image.file(
                              _pickedImageFile!,
                              fit: BoxFit.cover,
                            )
                          : Icon(
                              Icons.image,
                              size: 40,
                              color: Theme.of(context).primaryColor,
                            ),
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: _pickImage,
                  icon: const Icon(Icons.image,color: Colors.blue,),
                  label: const Text(
                    'Add Image',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
                Center(
                  child: TextFormField(
                    autocorrect: true,
                    enableSuggestions: true,
                    controller: _titleController,
                    decoration: const InputDecoration(
                      labelText: 'Title',border: InputBorder.none
                    ),
                      
                  ),
                ),
                TextFormField(
                  autocorrect: true,
                  enableSuggestions: true,
                  controller: _postcontentController,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: const InputDecoration(
                    labelText: 'Express yourself',
                    border: InputBorder.none
                  ),
                  maxLines: null, 
                  validator: (value) {
                    if(value == null || value.isEmpty || value.trim().length> 100){
                      return 'TextField is either Empty or over 100 characters!!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(onPressed: (){
                  _postButton();
                },style: ElevatedButton.styleFrom(
                  backgroundColor:const Color.fromARGB(255, 138, 197, 245)
                )
                ,child: const Text("Post",style: TextStyle(color: Colors.white),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
