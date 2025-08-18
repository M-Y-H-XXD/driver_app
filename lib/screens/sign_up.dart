import 'dart:convert';

import 'package:driver/apis/register_user.dart';
import 'package:driver/constants_components/enter_way.dart';
import 'package:driver/modles/constant_colors.dart';
import 'package:driver/mywigets/email_field.dart';
import 'package:driver/mywigets/my_home_page.dart';
import 'package:driver/mywigets/password_field.dart';
import 'package:driver/mywigets/phone_field.dart';
import 'package:driver/mywigets/set_password_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

GlobalKey<FormState> formState = GlobalKey();
GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  RegisterUser register = RegisterUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      backgroundColor: ConstantColors.backgroundColorSignIn,
      body: SingleChildScrollView(
        child: Form(
          key: formState,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // const Padding(
                //   padding: EdgeInsets.only(top: 30),
                //   child: Row(
                //     children: [
                //       Expanded(
                //         child: Padding(
                //           padding: EdgeInsets.only(right: 20),
                //           child: NameField(label: 'First Name'),
                //         ),
                //       ),

                //       Expanded(
                //         child: Padding(
                //           padding: EdgeInsets.only(left: 10),
                //           child: NameField(label: 'Last Name'),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

                // const Padding(
                //   padding: EdgeInsets.only(top: 30),
                //   child: Row(
                //     children: [
                //       Expanded(
                //         child: Padding(
                //           padding: EdgeInsets.only(right: 20),
                //           child: NameField(label: 'Location'),
                //         ),
                //       ),

                //       Expanded(
                //         child: Padding(
                //           padding: EdgeInsets.only(left: 10),
                //           child: BirthDayField(label: 'Birth Day'),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: EmailField(enterType: EnterWay.sinUp),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: PhoneField(enterType: EnterWay.sinUp),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: PasswordField(),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: SetPasswordField(),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(12),
                //   child: PickImageAndShowIt(scaffoldState: scaffoldState),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: MaterialButton(
                    color:
                        ConstantColors.backgroundColorTabBarIndicatorSelected,
                    padding: const EdgeInsets.all(15),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    minWidth: double.infinity,
                    onPressed: () async {
                      formState.currentState!.save(); //this for set password
                      if (formState.currentState!.validate()) {
                        formState.currentState!.save();
                        Response response = await register.registerUser();
                        var data = jsonDecode(response.body);
                        if (response.statusCode == 200 ||
                            response.statusCode == 201) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${data['msg']}'),
                              backgroundColor:
                                  ConstantColors.backgroundOfSnackBarRight,
                            ),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyHomePage(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${data['msg']}'),
                              backgroundColor:
                                  ConstantColors.backgroundOfSnackBarFalse,
                            ),
                          );
                        }
                      }
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
