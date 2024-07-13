import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove back button
        backgroundColor: Colors.white,
        elevation: 0, // Removes the shadow
      ),
      backgroundColor: Colors.white, // Set background color of the page
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 1.0), // Adjust top spacing as needed
            Image.asset(
              'assets/login.jpeg',
              fit: BoxFit.fitHeight,
              width: MediaQuery.of(context).size.width, // Full width of screen
              height: 140.0,
            ),
            SizedBox(height: 36.0),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Login ',
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: ' or ',
                    style: TextStyle(
                      fontSize: 23.0,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: ' SignUp',
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 26.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: '+91  |       Mobile Number',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'By continuing, I agree with ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                ),
                Text(
                  'Terms of Use & Privacy Policy',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Add your login logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(227, 96, 96, 1),
                padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              child: Text(
                'CONTINUE',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10.0), // Adjust spacing between button and text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Have trouble logging in? ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle "Get help" action
                  },
                  child: Text(
                    'Get help',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25.0), // Adjust bottom spacing as needed
          ],
        ),
      ),
    );
  }
}
