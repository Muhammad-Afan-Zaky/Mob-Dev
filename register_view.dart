import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:todo_app/modules/login/views/login_view.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 177, 174),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              const Center(
                child: Text(
                  'Join Us',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Name
              TextField(
                controller: controller.nameController,
                decoration: _inputDecoration('Name', Icons.person),
              ),
              const SizedBox(height: 20),

              // Email
              TextField(
                controller: controller.emailController,
                decoration: _inputDecoration('Email', Icons.email),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),

              // Password
              TextField(
                controller: controller.passwordController,
                obscureText: true,
                decoration: _inputDecoration('Password', Icons.lock),
              ),
              const SizedBox(height: 20),

              // Confirm Password
              TextField(
                controller: controller.confirmPasswordController,
                obscureText: true,
                decoration: _inputDecoration('Confirm Password', Icons.lock),
              ),
              const SizedBox(height: 20),

              // Gender Dropdown
              Obx(() => DropdownButtonFormField<String>(
                    value: controller.selectedGender.value.isEmpty
                        ? null
                        : controller.selectedGender.value,
                    onChanged: (value) {
                      if (value != null) {
                        controller.selectedGender.value = value;
                      }
                    },
                    decoration: _inputDecoration('Gender', Icons.person),
                    items: const [
                      DropdownMenuItem(value: 'laki-laki', child: Text('Laki-laki')),
                      DropdownMenuItem(value: 'perempuan', child: Text('Perempuan')),
                    ],
                    hint: const Text('Select gender'),
                  )),
              const SizedBox(height: 20),

              // Birth Date
              Obx(() => TextField(
                    readOnly: true,
                    onTap: () => controller.pickDate(context),
                    controller: TextEditingController(
                      text: controller.birthDate.value,
                    ),
                    decoration: _inputDecoration('Birth Date', Icons.calendar_today),
                  )),
              const SizedBox(height: 40),

              // Register Button
              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    controller.registerUser();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Login Link
              RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                  children: [
                    TextSpan(
                      text: 'Login',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(() => const LoginView());
                        },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
