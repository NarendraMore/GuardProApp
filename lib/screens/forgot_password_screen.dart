import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ForgotPasswordScreen extends HookConsumerWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mobileController = useTextEditingController();
    final otpController = useTextEditingController();
    final newPasswordController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 10, 10, 10)),
          onPressed: () {
            context.go('/'); // Navigate to the login screen
          },
        ),
        title: const Text (
          
            'Forgot Password',
            style: TextStyle(
              color: Color.fromARGB(255, 53, 51, 51),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
        ),
        centerTitle: false, // Aligns the title to the left
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'), // Updated to use AssetImage
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(1), BlendMode.dstATop), // Optional: adds a dark overlay
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Center(
                  child: Text(
                    'Enter details to reset your password',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                // Mobile number field
                _buildInputField(mobileController, 'Mobile Number', TextInputType.phone),
                const SizedBox(height: 16),
                // Send OTP Button
                _buildButton(
                  context,
                  'Send OTP',
                  Colors.lightGreen,
                  () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('OTP sent to your mobile number'),
                        behavior: SnackBarBehavior.floating,
                        margin: const EdgeInsets.only(top: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                // OTP field
                _buildInputField(otpController, 'OTP', TextInputType.number),
                const SizedBox(height: 16),
                // Resend OTP Button
                _buildButton(
                  context,
                  'Resend OTP',
                  Colors.lightBlueAccent,
                  () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('OTP resent!'),
                        behavior: SnackBarBehavior.floating,
                        margin: const EdgeInsets.only(top: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                // New password field
                _buildInputField(newPasswordController, 'New Password', TextInputType.text, obscureText: true),
                const SizedBox(height: 16),
                // Save password Button
                _buildButton(
                  context,
                  'Save Password',
                  Colors.orange,
                  () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Password reset successful!')),
                    );

                    Future.delayed(const Duration(seconds: 1), () {
                      context.go('/'); // Navigate to the login screen
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget to create input fields
  Widget _buildInputField(TextEditingController controller, String label, TextInputType keyboardType, {bool obscureText = false}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.black54,
          fontSize: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(255, 240, 127, 35), width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
    );
  }

  // Widget to create buttons
  Widget _buildButton(BuildContext context, String label, Color color, VoidCallback onPressed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            minimumSize: const Size(120, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 5,
          ),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
