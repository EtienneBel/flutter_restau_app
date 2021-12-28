import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restau_app/constance.dart';
import 'package:restau_app/core/view_model/auth_view_model.dart';
import 'package:restau_app/view/auth/register_view.dart';
import 'package:restau_app/view/widgets/custom_button.dart';
import 'package:restau_app/view/widgets/custom_button_social.dart';
import 'package:restau_app/view/widgets/custom_text_form_field.dart';
import '../widgets/custom_text.dart';
import 'package:get/get.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0.0,
      //   backgroundColor: Colors.white,
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 70.0,
            right: 20,
            left: 20,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Welcome',
                      fontSize: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(RegisterView());
                      },
                      child: CustomText(
                        text: 'Sign Up',
                        color: primaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                CustomText(
                  text: 'Sign in to continue',
                  color: Colors.grey,
                  fontSize: 14,
                ),
                SizedBox(
                  height: 50,
                ),
                CustomTextFormField(
                  text: 'Email',
                  hint: 'iamwendkuuni@gmail.com',
                  onSave: (value) {
                    controller.email = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("ERROR");
                    }
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  text: 'Password',
                  hint: '**************',
                  onSave: (value) {
                    controller.password = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("ERROR");
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: 'Forget Password',
                  fontSize: 14,
                  alignment: Alignment.topRight,
                ),
                SizedBox(height: 20),
                CustomButton(
                  text: 'SIGN IN',
                  onPressed: () {
                    _formKey.currentState.save();
                    if(_formKey.currentState.validate()){
                      controller.signInWithEmailAndPassword();
                    }
                  },
                ),
                SizedBox(height: 20),
                CustomText(
                  text: '- OR -',
                  alignment: Alignment.center,
                ),
                SizedBox(height: 40),
                CustomButtonSocial(
                  text: 'Sign in with Facebook',
                  onPressed: (){
                    controller.facebookSignInMethod();
                  },
                  imageName: 'assets/images/facebook.png',
                ),
                SizedBox(height: 20),
                CustomButtonSocial(
                  text: 'Sign in with Google',
                  onPressed: () {
                    controller.googleSigneInMethod();
                  },
                  imageName: 'assets/images/google.png',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
