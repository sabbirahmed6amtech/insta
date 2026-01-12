import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/login_controller.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_text_field.dart';
import '../../../common/widgets/custom_divider.dart';
import '../../../common/widgets/logo_widget.dart';
import '../../../common/widgets/clickable_text.dart';
import '../../../common/widgets/social_button.dart';
import '../../../util/dimensions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSize24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: Dimensions.paddingSize40),
              
              const LogoWidget(height: 60),
              
              SizedBox(height: Dimensions.paddingSize50),
              
              CustomTextField(
                controller: controller.usernameController,
                hintText: 'Phone number, email or username',
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              
              SizedBox(height: Dimensions.paddingSize12),
              
              Obx(() => CustomTextField(
                controller: controller.passwordController,
                hintText: 'Password',
                obscureText: controller.obscurePassword.value,
                textInputAction: TextInputAction.done,
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.obscurePassword.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Theme.of(context).textTheme.bodySmall?.color,
                    size: Dimensions.iconSize20,
                  ),
                  onPressed: controller.togglePasswordVisibility,
                ),
                onSubmitted: (_) => controller.login(),
              )),
              
              SizedBox(height: Dimensions.paddingSize16),
              
              Align(
                alignment: Alignment.centerRight,
                child: ClickableText(
                  text: 'Forgot password?',
                  onTap: controller.forgotPassword,
                  fontSize: Dimensions.fontSize12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              
              SizedBox(height: Dimensions.paddingSize24),
              
              Obx(() => CustomButton(
                text: 'Log in',
                onPressed: controller.login,
                isLoading: controller.isLoading.value,
                backgroundColor: controller.isButtonEnabled.value 
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.secondary.withOpacity(0.3),
              )),
              
              SizedBox(height: Dimensions.paddingSize30),
              
              SocialButton(
                text: 'Log in with Facebook',
                icon: Icons.facebook,
                onPressed: controller.loginWithFacebook,
              ),
              
              SizedBox(height: Dimensions.paddingSize40),
              
              const CustomDivider(text: 'OR'),
              
              SizedBox(height: Dimensions.paddingSize40),
              
              RichClickableText(
                normalText: "Don't have an account?",
                clickableText: 'Sign up.',
                onTap: controller.goToSignUp,
              ),
              
              SizedBox(height: Dimensions.paddingSize50),
              
              Padding(
                padding: EdgeInsets.only(bottom: Dimensions.paddingSize20),
                child: Column(
                  children: [
                    Divider(
                      thickness: 0.5,
                      color: Theme.of(context).dividerColor,
                    ),
                    SizedBox(height: Dimensions.paddingSize16),
                    Text(
                      'Instagram from Facebook',
                      style: TextStyle(
                        fontSize: Dimensions.fontSize12,
                        color: Theme.of(context).textTheme.bodySmall?.color,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
