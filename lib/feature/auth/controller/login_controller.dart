import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  
  final RxBool isLoading = false.obs;
  final RxBool obscurePassword = true.obs;
  final RxBool isButtonEnabled = false.obs;

  @override
  void onInit() {
    super.onInit();
    usernameController.addListener(_checkIfButtonEnabled);
    passwordController.addListener(_checkIfButtonEnabled);
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void _checkIfButtonEnabled() {
    isButtonEnabled.value = usernameController.text.isNotEmpty && 
                             passwordController.text.isNotEmpty;
  }

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  Future<void> login() async {
    if (!isButtonEnabled.value) return;
    
    try {
      isLoading.value = true;
      
      await Future.delayed(const Duration(seconds: 2));
      
      Get.offAllNamed('/home');
      
      Get.snackbar(
        'Success',
        'Login successful!',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Login failed. Please try again.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    } finally {
      isLoading.value = false;
    }
  }

  void loginWithFacebook() {
    Get.snackbar(
      'Info',
      'Facebook login coming soon!',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  void forgotPassword() {
    Get.snackbar(
      'Info',
      'Forgot password feature coming soon!',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  void goToSignUp() {
    Get.snackbar(
      'Info',
      'Sign up page coming soon!',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }
}
