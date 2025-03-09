import 'package:flutter/material.dart';
import 'login_screen.dart'; // Import Login Screen for navigation

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'), // Same background as Login
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Dark Overlay
          Container(
            color: Colors.black.withOpacity(0.6),
          ),

          // Main Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Image.asset('assets/images/logo.png', width: 100), // Heapware logo
                SizedBox(height: 10),
                SizedBox(height: 30),

                // Glassmorphic Container (Same as Login)
                Container(
                  width: 350,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: 5),
                      Text("Create your account to get started", style: TextStyle(color: Colors.white70)),
                      SizedBox(height: 20),

                      _buildTextField(Icons.person, "Full Name"),
                      SizedBox(height: 10),
                      _buildTextField(Icons.email, "Email"),
                      SizedBox(height: 10),
                      _buildTextField(Icons.lock, "Password", isPassword: true),

                      SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Sign Up"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.tealAccent,
                          minimumSize: Size(double.infinity, 45),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      SizedBox(height: 15),

                      // Social Media Login (Same as Login)
                      Text("Or continue with", style: TextStyle(color: Colors.white70)),
                      SizedBox(height: 10),
                      _buildSocialIcons(),

                      SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context); // Navigate back to Login
                        },
                        child: Text("Already have an account? Login", style: TextStyle(color: Colors.tealAccent)),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Custom Input Field (Matching Login Screen)
  Widget _buildTextField(IconData icon, String hintText, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white70),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white70),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  // Social Icons (Matching Login)
  Widget _buildSocialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _socialIcon("assets/images/google.png"),
        SizedBox(width: 15),
        _socialIcon("assets/images/facebook.png"),
        SizedBox(width: 15),
        _socialIcon("assets/images/instagram.png"),
      ],
    );
  }

  Widget _socialIcon(String assetPath) {
    return GestureDetector(
      onTap: () {}, // Add social login logic here
      child: Image.asset(assetPath, width: 40),
    );
  }
}
