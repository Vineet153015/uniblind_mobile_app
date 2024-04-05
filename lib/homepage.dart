import 'package:flutter/material.dart';
import 'package:uniblind/authenticationScreens/signup.dart';

class homepage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _signUp() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const signup()));
    }

    // TODO: implement build
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 12, 146, 255),
            Color.fromARGB(255, 163, 221, 248)
          ],
          stops: [0.0, 0.7],
        ),
      ),

      // TITLE
      child: Stack(
        children: [
          Positioned(
            top: 100, // Adjust this value as needed
            left: 0,
            right: 9,
            child: Center(
              child: RichText(
                textAlign: TextAlign.left,
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 130,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'Uni',
                      style: TextStyle(
                          color: Color.fromARGB(255, 40, 76, 184),
                          fontSize: 94.6,
                          fontWeight: FontWeight.bold,
                          height: 1.2),
                    ),
                    TextSpan(
                      text: '\nBlind',
                      style: TextStyle(
                          color: Colors.white, height: 0.9, fontSize: 141.83),
                    ),
                    TextSpan(
                        text: '\n  Chat Anonymously with your Acquintances',
                        style: TextStyle(
                          fontSize: 15.12,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          height: 0.1,
                        ))
                  ],
                ),
              ),
            ),
          ),

          // LOGO
          Positioned(
            top: 10,
            // left: 20
            left: 20, // Adjust the left position as needed
            child: SizedBox(
              width: 50, // Adjust the width as needed
              height: 70, // Adjust the height as needed
              child: Image.asset(
                  'assets/images/logo.png'), // Replace 'assets/logo.png' with your logo path
            ),
          ),

          // OVERLAY
          Positioned.fill(
            top: 480,
            child: Container(
              padding: const EdgeInsets.only(
                  bottom: 20, right: 20, top: 20, left: 0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: const BorderRadius.only(
                  // topLeft: Radius.circular(0),
                  topRight: Radius.circular(200),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 5, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: const Offset(0, 3), // Offset
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      const Text(
                        "Welcome to UniBlind",
                        style: TextStyle(
                          color: Color.fromARGB(255, 40, 76, 184),
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        "& let's start engaging",
                        style: TextStyle(
                          color: Color.fromARGB(255, 40, 76, 184),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        'Connect, chat, post, call, anonymously. Explore\nnow',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 0), // Adjust the right padding as needed
                        child: Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () {
                              _signUp();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 40, 76, 184),
                              minimumSize: const Size(50, 44.5),
                            ),
                            child: const Text(
                              'Get Started',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 345,
            left: 0,
            child: SizedBox(
              width: 250,
              height: 278,
              child: Image.asset('assets/images/bg.png'),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class homepage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             Color.fromARGB(255, 12, 146, 255),
//             Color.fromARGB(255, 163, 221, 248)
//           ],
//           stops: [0.0, 0.7],
//         ),
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//             top: 100,
//             left: 0,
//             right: 9,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 RichText(
//                   textAlign: TextAlign.left,
//                   text: const TextSpan(
//                     style: TextStyle(
//                       fontSize: 130,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                     children: [
//                       TextSpan(
//                         text: 'Uni',
//                         style: TextStyle(color: Color.fromARGB(255, 40, 76, 184)),
//                       ),
//                       TextSpan(
//                         text: '\nBlind',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(width: 10), // Adjust the spacing between text and image
//                 Image.asset(
//                   'assets/images/bg.png', // Replace 'assets/images/logo.png' with your logo path
//                   width: 50, // Adjust the width of the image
//                   height: 50, // Adjust the height of the image
//                 ),
//               ],
//             ),
//           ),
//           Positioned.fill(
//             top: 480,
//             left: 0,
//             right: 0,
//             bottom: 0,
//             child: Container(
//               padding: const EdgeInsets.all(20),
//               decoration: const BoxDecoration(
//                 color: Color.fromARGB(255, 255, 255, 255),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(0),
//                   topRight: Radius.circular(200),
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   const Text(
//                     'Welcome to\nUniBlind',
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 5, 0, 0),
//                       fontSize: 25,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 100),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Add your Google sign-in logic here
//                     },
//                     child: const Text('Sign in with Google'),
//                   ),
//                   const SizedBox(height: 100)
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
