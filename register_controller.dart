import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var birthDate = ''.obs;
  var selectedGender = ''.obs;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      birthDate.value = "${picked.toLocal()}".split(' ')[0];
    }
  }

  Future<void> registerUser() async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();
    final birth = birthDate.value;
    final gender = selectedGender.value;

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        birth.isEmpty ||
        gender.isEmpty) {
      Get.snackbar('Error', 'Semua field wajib diisi');
      return;
    }

    if (password != confirmPassword) {
      Get.snackbar('Error', 'Password tidak cocok');
      return;
    }

    // Dummy simulasi berhasil registrasi
    await Future.delayed(const Duration(seconds: 1));
    Get.snackbar('Sukses', 'Registrasi berhasil!');
    Get.back(); // kembali ke halaman login
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
