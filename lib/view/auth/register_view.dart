import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restau_app/core/view_model/auth_view_model.dart';
import 'package:restau_app/view/auth/login_view.dart';
import 'package:restau_app/view/widgets/custom_button.dart';
import 'package:restau_app/view/widgets/custom_button_social.dart';
import 'package:restau_app/view/widgets/custom_text.dart';
import 'package:restau_app/view/widgets/custom_text_form_field.dart';

import '../../constance.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.off(LoginView());
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
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
                CustomText(
                  text: 'Sign Up',
                  color: primaryColor,
                  fontSize: 30,
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  text: 'Name',
                  hint: 'Drissa Kanon',
                  onSave: (value) {
                    controller.name = value;
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
                SizedBox(height: 20),
                CustomButton(
                  text: 'SIGN UP',
                  onPressed: () {
                    _formKey.currentState.save();
                    if (_formKey.currentState.validate()) {
                      controller.createAccountWithEmailAndPassword();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
