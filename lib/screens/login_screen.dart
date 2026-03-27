import 'package:flutter/material.dart';
import 'main_nav_screen.dart';
import 'freelancer_dashboard_screen.dart';
import 'admin_dashboard_screen.dart';
import 'signup_screen.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              // Title
              const Center(
                child: Text(
                  'I Want',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              const Center(
                child: Text(
                  'Local services in Tripoli',
                  style: TextStyle(color: Colors.grey),
                ),
              ),

              const SizedBox(height: 40),

              // Email
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              // Password
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 8),

              // ✅ Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const ForgotPasswordScreen(),
                      ),
                    );
                  },
                  child: const Text('Forgot Password?'),
                ),
              ),

              const SizedBox(height: 16),

              // Login Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainNavScreen(),
                      ),
                    );
                  },
                  child: const Text('Login as Customer'),
                ),
              ),

              const SizedBox(height: 20),

              // Divider
              const Center(
                child: Text(
                  'Quick Demo Access',
                  style: TextStyle(color: Colors.grey),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  // Freelancer Button
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const FreelancerDashboardScreen(),
                          ),
                        );
                      },
                      child: const Text('Freelancer'),
                    ),
                  ),

                  const SizedBox(width: 12),

                  // Admin Button
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const AdminDashboardScreen(),
                          ),
                        );
                      },
                      child: const Text('Admin'),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Signup
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupScreen(),
                      ),
                    );
                  },
                  child: const Text("Don't have an account? Sign Up"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}