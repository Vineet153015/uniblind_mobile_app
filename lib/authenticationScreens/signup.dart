import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uniblind/useernamegen.dart';
// import 'dart:io';
// import 'package:flutter_svg/flutter_svg.dart';

final _firebase = FirebaseAuth.instance;

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final _form = GlobalKey<FormState>();

  var _isLogin = true;
  var _enteredEmail = '';
  var _enteredPassword = '';
  var _isAuthenticating = false;
  var _enteredUsername = '';

  void _submit() async {
    final isValid = _form.currentState!.validate();

    if (!isValid) {
    return;
  }

    _form.currentState!.save();
    

    try{
    if(_isLogin){
      final userCredential = await _firebase.signInWithEmailAndPassword(
        email: _enteredEmail, password: _enteredPassword);
      return;
    }
    
    else{
      
      final userCredentials = await _firebase.createUserWithEmailAndPassword(
        email: _enteredEmail, password: _enteredPassword);

      String generatedUsername = usernameGenerator.generateUniqueUsername();

      setState(() {
        _enteredUsername = generatedUsername;
        print('username fimal = '+ _enteredUsername);
      });


        await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredentials.user!.uid)
        .set({
          'username' :  _enteredUsername,
          'email' : _enteredEmail,
          'createdAt': Timestamp.now(),
        });
      }
    } on FirebaseAuthException catch (error){
        if(error.code == 'email-already-exist'){
          const Text("hello");
        };
      
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
        error.message ?? 'Authentication Failed'
      ),
      ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/bgmain1.jpg'),
          fit: BoxFit.fill),
        ),
        
        child:Stack(
          children:[
        Center(
          child: Card(
            margin: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                    key: _form,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'University email',labelStyle: TextStyle(color: Colors.black87,fontSize: 15),
                            icon: Icon(
                              Icons.mail,
                              color: Colors.black87,
                            )
                          ),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          validator: (value) {
                            if (value == null ||
                                value.trim().isEmpty ||
                                !value.contains('.christuniversity.in')) {
                              return 'Please Enter a valid email address';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredEmail = value!;
                          },
                        ),

                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Password',labelStyle: TextStyle(color: Colors.black87,fontSize: 15),
                            border: InputBorder.none,
                            icon: Icon(Icons.password,color: Colors.black87,)
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null ||
                                value.trim().length < 6 ) {
                              return 'Incorrect Password';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredPassword = value!;
                            
                          },
                        ),

                        const SizedBox(height: 20),
                        if (_isAuthenticating)
                          const CircularProgressIndicator(),
                        if (!_isAuthenticating)
                          ElevatedButton(
                              onPressed: () {
                                _submit();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 40, 76, 184),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                                )
                              ),
                              child: Text(_isLogin ? 'Login ' : 'SignUp',style: const TextStyle(color: Colors.white),),),
                        if (!_isAuthenticating)
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  _isLogin = !_isLogin;
                                });
                              },
                              child: Text(_isLogin
                                  ? 'Create an Account'
                                  : 'Already have an account',style: const TextStyle(color: Color.fromARGB(255, 40, 76, 184)),)),
                                  Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          TextButton(
                              onPressed: () {
                              },
                              child: const Text(
                                'New User?',
                                style:
                                    TextStyle(color: Color.fromARGB(255, 40, 76, 184), fontSize: 16),
                              )),
                          const SizedBox(
                            width: 120,
                          ),
                          TextButton(
                            onPressed: () {
                            },
                            child: const Text('Sign in',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 16)),
                          )
                        ],
                      ),
                      ],
                      
                    ),
                    
                    ),
                    
              ),
              
            ),
            
          ),
        ),
        ],
      ),
      ),
      
    );
  }
}
