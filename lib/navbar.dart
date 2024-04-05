import 'package:flutter/material.dart';
import 'package:uniblind/chat.dart';
import 'package:uniblind/dashboard.dart';
import 'package:uniblind/widgets/user_image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class navBar extends StatefulWidget {
  const navBar({super.key});

  @override
  State<navBar> createState() => _navBarState();
}

class _navBarState extends State<navBar> {

  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(249, 158, 197, 248),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: // const Text('Vineet kumar'),
                StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(user.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var userData = snapshot.data!.data() as Map<String, dynamic>;
                  var username = userData['username'];
                  return Text(username, style: TextStyle(color: const Color.fromARGB(221, 255, 255, 255), fontWeight: FontWeight.bold, fontSize: 18),);
                } else {
                  return const Text('Loading...');
                }
                
              },
            ),
            // ),
            accountEmail: // Text('Sample@gmail.com'),
            StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(user.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var userData = snapshot.data!.data() as Map<String, dynamic>;
                  var email = userData['email'];
                  return Text(email,style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),);
                } else {
                  return const Text('Loading...');
                }
              },
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  "https://i.pinimg.com/564x/1f/78/50/1f7850426b2768f93b678a7052b8fc8c.jpg",
                  width: 100,
                  height: 160,
                  fit: BoxFit.fill,
                  
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    image: const NetworkImage(
                        'https://lh3.googleusercontent.com/p/AF1QipMFu2lDMocW-8qpOvr6Sv6qKHmNLzQPHmn-m_oT=s680-w680-h510',),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Color.fromARGB(255, 0, 0, 0).withOpacity(0.7), BlendMode.darken)
                    ),
                  
                    ),
          ),
          Card(
            elevation: 4, // Optional: Add elevation for a shadow effect
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10), // Optional: Add rounded corners
            ),
            color: Color.fromARGB(228, 255, 255,
                255), // Make the card transparent so that the gradient is visible
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(10), // Match the Card's border radius
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(110, 61, 145, 255)
                  ], // Gradient colors
                ),
              ),
              child: ListTile(
                leading: const Icon(Icons.group),
                title: const Text('Group Chat'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChatScreen()),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Card(
            elevation: 4, // Optional: Add elevation for a shadow effect
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10), // Optional: Add rounded corners
            ),
            color: Color.fromARGB(228, 255, 255,
                255), // Make the card transparent so that the gradient is visible
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(10), // Match the Card's border radius
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(110, 61, 145, 255)
                  ], // Gradient colors
                ),
              ),
              child: ListTile(
                leading: const Icon(Icons.privacy_tip),
                title: const Text('Private Chat'),
                onTap: () {},
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Card(
            elevation: 4, // Optional: Add elevation for a shadow effect
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10), // Optional: Add rounded corners
            ),
            color: Color.fromARGB(228, 255, 255,
                255), // Make the card transparent so that the gradient is visible
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(10), // Match the Card's border radius
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(110, 61, 145, 255)
                  ], // Gradient colors
                ),
              ),
              child: ListTile(
                leading: const Icon(Icons.video_call),
                title: const Text('Video Chat'),
                onTap: () {},
              ),
            ),
          ),
          Card(
            elevation: 4, // Optional: Add elevation for a shadow effect
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10), // Optional: Add rounded corners
            ),
            color: Color.fromARGB(228, 255, 255,
                255), // Make the card transparent so that the gradient is visible
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(10), // Match the Card's border radius
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(110, 61, 145, 255)
                  ], // Gradient colors
                ),
              ),
              child: ListTile(
                leading: const Icon(Icons.add),
                title: const Text('Add Post'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserImagePicker()),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Card(
            elevation: 4, // Optional: Add elevation for a shadow effect
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10), // Optional: Add rounded corners
            ),
            color: Color.fromARGB(228, 255, 255,
                255), // Make the card transparent so that the gradient is visible
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(10), // Match the Card's border radius
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(110, 61, 145, 255)
                  ], // Gradient colors
                ),
              ),
              child: ListTile(
                leading: const Icon(Icons.arrow_back_ios_rounded),
                title: const Text('Back'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const dashboard()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
