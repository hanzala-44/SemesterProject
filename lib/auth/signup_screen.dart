import 'package:flutter/material.dart';
import '../auth/signverify.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  SignupScreenState createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> signup() async {
    String email = _emailController.text.trim();
    String name = _nameController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || name.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    FocusScope.of(context).unfocus();

    // Clear fields
    _emailController.clear();
    _nameController.clear();
    _passwordController.clear();

    // Navigate to verification screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VerificationPage1(email: email),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Verification link sent')),
    );
  }

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
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay
          Container(color: Colors.black.withOpacity(0.8)),

          // Main Content
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png', width: 80),
                  SizedBox(height: 40),

                  Container(
                    width: 350,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.greenAccent.withOpacity(0.7)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 3,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        SizedBox(height: 5),
                        Text("Create your account to get started", style: TextStyle(color: Colors.white70)),
                        SizedBox(height: 20),

                        _buildTextField(_nameController, Icons.person, "Full Name"),
                        SizedBox(height: 10),
                        _buildTextField(_emailController, Icons.email, "Email"),
                        SizedBox(height: 10),
                        _buildTextField(_passwordController, Icons.lock, "Password", isPassword: true),
                        SizedBox(height: 20),

                        ElevatedButton(
                          onPressed: signup,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.tealAccent,
                            minimumSize: Size(double.infinity, 45),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 20),

                        Text("Or continue with", style: TextStyle(color: Colors.white70)),
                        SizedBox(height: 10),
                        _buildSocialIcons(),
                        SizedBox(height: 15),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account? ", style: TextStyle(color: Colors.white)),
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Text("Login", style: TextStyle(color: Colors.tealAccent)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, IconData icon, String hintText, {bool isPassword = false}) {
    return TextField(
      controller: controller,
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
        _socialIcon("assets/images/google.png"),
        SizedBox(width: 35),
        _socialIcon("assets/images/facebook.png"),
      ],
    );
  }

  Widget _socialIcon(String assetPath) {
    return GestureDetector(
      onTap: () {
        // Add social login logic here
      },
      child: Image.asset(assetPath, width: 40),
    );
  }
}
