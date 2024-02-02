import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    Future.delayed(Duration(seconds: 2), () {
      if (user != null) {
        // Navigate to the logged-in screen if the user is already authenticated
        // Example: Navigator.pushReplacementNamed(context, '/logged_in');
      } else {
        // Navigate to the login screen if the user is not authenticated
        Navigator.pushReplacementNamed(context, '/login');
      }
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/brain_final.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Neuron',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.blue, // Change the color to your desired color
                letterSpacing: 1.5, // Increase or decrease the spacing between letters
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(0, 2),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Accurate brain tumor segmentation is essential for better treatment planning. Our app uses AI to provide precise segmentation of Intracranial Hemorrhage',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87, // Change the color to a suitable one
                fontStyle: FontStyle.italic,
                shadows: [
                  Shadow(
                    color: Colors.white.withOpacity(0.5),
                    offset: Offset(0, 2),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text('Get Started'),
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
