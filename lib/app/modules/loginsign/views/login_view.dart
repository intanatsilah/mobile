import 'package:flutter/material.dart';
import 'package:flutter_application_kelas_d/app/modules/loginsign/controllers/loginsign_controller.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  final LoginsignController controller = Get.find<LoginsignController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/hospital_background.png'), // Background image
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Image.asset('assets/logo.png',
                  height: 200), // Increased logo size
              SizedBox(height: 20),
              Text('Login',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)), // Changed to black
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 24.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9).withOpacity(0.9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Username',
                            prefixIcon: Icon(Icons.email)),
                        onChanged: (value) => controller.username.value = value,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock)),
                        obscureText: true,
                        onChanged: (value) => controller.password.value = value,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: controller.login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFA1CCA5),
                        ),
                        child: Text(
                          'Log In',
                          style: TextStyle(
                              color: Colors.white), // Changed to white
                        ),
                      ),
                      TextButton(
                        onPressed: () => Get.toNamed('/signup'),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Belum Mendaftar? ',
                                style: TextStyle(
                                    color: Colors.black), // Black color
                              ),
                              TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(
                                    color: Color(0xFF6C53FD)), // Purple color
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextButton(
                        onPressed: controller.loginAsGuest,
                        child: Text(
                          'Masuk Tanpa Login',
                          style: TextStyle(color: Color(0xFF6C53FD)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
