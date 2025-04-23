import 'package:flutter/material.dart';
import './signup_screen.dart';
import 'home_screen.dart'; // Import HomeScreen

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark theme
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'), // Your background image
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Dark overlay
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
                SizedBox(height: 30),

                // Glassmorphic Container
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
                        "Login",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: 5),
                      Text("Please login to your account", style: TextStyle(color: Colors.white70)),
                      SizedBox(height: 20),

                      _buildTextField(Icons.email, "Email"),
                      SizedBox(height: 10),
                      _buildTextField(Icons.lock, "Password", isPassword: true),

                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text("Forgot Password?", style: TextStyle(color: Colors.tealAccent)),
                      ),

                      SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to Home Screen after login
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => HomeScreen()),
                          );
                        },
                        child: Text("Login"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.tealAccent,
                          minimumSize: Size(double.infinity, 45),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      SizedBox(height: 15),

                      // Social Media Login
                      Text("Or continue with", style: TextStyle(color: Colors.white70)),
                      SizedBox(height: 10),
                      _buildSocialIcons(),

                      SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => SignupScreen()));
                        },
                        child: Text("Create an account? Sign up", style: TextStyle(color: Colors.tealAccent)),
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

  Widget _buildSocialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/google.png", width: 40),
        SizedBox(width: 15),
        Image.asset("assets/images/facebook.png", width: 40),
        SizedBox(width: 15),
        Image.asset("assets/images/instagram.png", width: 40),
      ],
    );
  }
}
