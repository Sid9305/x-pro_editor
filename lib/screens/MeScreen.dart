import 'package:Xpro_editor/screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MeScreen extends StatelessWidget {

  const MeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/sunrise.jpg"),
            fit: BoxFit.fill,
          ),
          color: Colors.teal,
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const SizedBox(
              height: 70.0,
            ),
            const Text(
              "Xpro Editor",
              style: TextStyle(
                fontSize: 37,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Text("Connect with global video creators",
                style: TextStyle(fontSize: 20, color: Colors.white60)),
            const SizedBox(
              height: 70.0,
            ),
            Container(
              height: 50,
              width: 300,
              child: FloatingActionButton.extended(
                onPressed: () {
                  return ;
                },
                label: const Text(
                  "Create an Account",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text("OR",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              height: 50,
              width: 300,
              child: FloatingActionButton.extended(
                backgroundColor: Colors.black,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginPage()));
                },
                label: Row(
                  children: const [
                    Image(
                        image: AssetImage("assets/google.png"),
                        width: 30,
                        height: 30),
                    // Icon(FontAwesomeIcons.google,color: Colors.blue),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Continue with Google",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              height: 50,
              width: 300,
              child: FloatingActionButton.extended(
                backgroundColor: Colors.black,
                onPressed: () {
                },
                label: Row(
                  children: const [
                    Image(
                      image: AssetImage("assets/apple.png"),
                      width: 50,
                      height: 50,
                    ),
                    // Icon(FontAwesomeIcons.google,color: Colors.blue),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Continue with Apple",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 100.0,
            ),
            const Text(
              "I have read and accept the Xpro Editor",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            const SizedBox(
              height: 10.0,
            ),
            GestureDetector(
              onTap: () {
                debugPrint("Terms of Service and Privacy Policy clicked");
              },
              child: const Text(
                "Terms of Service and Privacy Policy",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
                GestureDetector(
                  onTap: (){
                    debugPrint("Sign in with google clicked");
                  },
                    child: Text(
                  "Sign in with email",
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
                ),
              ],
            )
          ],
        ),
      ),
    );
}


